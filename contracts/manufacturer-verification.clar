;; Manufacturer Verification Contract
;; Validates and manages automotive manufacturers

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_MANUFACTURER_EXISTS (err u101))
(define-constant ERR_MANUFACTURER_NOT_FOUND (err u102))
(define-constant ERR_INVALID_LICENSE (err u103))

;; Data structures
(define-map manufacturers
  { manufacturer-id: uint }
  {
    name: (string-ascii 100),
    license-number: (string-ascii 50),
    country: (string-ascii 50),
    verified: bool,
    registration-date: uint
  }
)

(define-data-var next-manufacturer-id uint u1)

;; Public functions
(define-public (register-manufacturer (name (string-ascii 100)) (license-number (string-ascii 50)) (country (string-ascii 50)))
  (let ((manufacturer-id (var-get next-manufacturer-id)))
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
    (asserts! (is-none (map-get? manufacturers { manufacturer-id: manufacturer-id })) ERR_MANUFACTURER_EXISTS)

    (map-set manufacturers
      { manufacturer-id: manufacturer-id }
      {
        name: name,
        license-number: license-number,
        country: country,
        verified: true,
        registration-date: block-height
      }
    )

    (var-set next-manufacturer-id (+ manufacturer-id u1))
    (ok manufacturer-id)
  )
)

(define-public (verify-manufacturer (manufacturer-id uint))
  (let ((manufacturer (unwrap! (map-get? manufacturers { manufacturer-id: manufacturer-id }) ERR_MANUFACTURER_NOT_FOUND)))
    (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)

    (map-set manufacturers
      { manufacturer-id: manufacturer-id }
      (merge manufacturer { verified: true })
    )
    (ok true)
  )
)

;; Read-only functions
(define-read-only (get-manufacturer (manufacturer-id uint))
  (map-get? manufacturers { manufacturer-id: manufacturer-id })
)

(define-read-only (is-verified-manufacturer (manufacturer-id uint))
  (match (map-get? manufacturers { manufacturer-id: manufacturer-id })
    manufacturer (get verified manufacturer)
    false
  )
)
