# Decentralized Automotive Vehicle Lifecycle Management

A comprehensive blockchain-based system for managing the complete lifecycle of automotive vehicles using Clarity smart contracts on the Stacks blockchain.

## Overview

This system provides a decentralized solution for tracking vehicles from manufacturing to disposal, ensuring transparency, security, and immutable record-keeping throughout the vehicle's lifecycle.

## Features

### 🏭 Manufacturer Verification
- Register and verify automotive manufacturers
- Validate manufacturer licenses and credentials
- Maintain manufacturer registry with verification status

### 🚗 Vehicle Registration
- Register vehicles on the blockchain with immutable records
- Link vehicles to verified manufacturers
- Track vehicle specifications and ownership

### 🔧 Maintenance Tracking
- Record comprehensive maintenance history
- Track service providers and costs
- Maintain mileage and parts replacement records

### 🔄 Ownership Transfer
- Secure peer-to-peer vehicle transfers
- Escrow-like transfer process with expiry
- Automatic transfer fee calculation

### ⚠️ Recall Coordination
- Issue manufacturer recalls
- Track recall completion status
- Coordinate recall services across the network

## Smart Contracts

### 1. Manufacturer Verification (`manufacturer-verification.clar`)
Manages the registration and verification of automotive manufacturers.

**Key Functions:**
- `register-manufacturer`: Register a new manufacturer
- `verify-manufacturer`: Verify manufacturer credentials
- `get-manufacturer`: Retrieve manufacturer information
- `is-verified-manufacturer`: Check verification status

### 2. Vehicle Registration (`vehicle-registration.clar`)
Handles vehicle registration and ownership tracking.

**Key Functions:**
- `register-vehicle`: Register a new vehicle
- `get-vehicle`: Retrieve vehicle information
- `get-vehicle-owner`: Get current vehicle owner
- `get-owner-vehicle-count`: Count vehicles owned by an address

### 3. Maintenance Tracking (`maintenance-tracking.clar`)
Tracks comprehensive maintenance history for vehicles.

**Key Functions:**
- `add-maintenance-record`: Add new maintenance record
- `get-maintenance-record`: Retrieve specific maintenance record
- `get-maintenance-count`: Get total maintenance records for a vehicle
- `get-vehicle-maintenance-history`: Get maintenance history overview

### 4. Ownership Transfer (`ownership-transfer.clar`)
Manages secure vehicle ownership transfers.

**Key Functions:**
- `initiate-transfer`: Start ownership transfer process
- `complete-transfer`: Complete the transfer
- `get-transfer-record`: Retrieve transfer history
- `get-pending-transfer`: Check pending transfers

### 5. Recall Coordination (`recall-coordination.clar`)
Coordinates vehicle recalls and tracks completion.

**Key Functions:**
- `issue-recall`: Issue a new recall
- `complete-recall-service`: Mark recall service as completed
- `get-recall`: Retrieve recall information
- `is-recall-completed`: Check if recall is completed for a vehicle

## Data Structures

### Vehicle Information
- VIN (Vehicle Identification Number)
- Manufacturer ID
- Model, Year, Color
- Engine Type
- Registration Date
- Current Owner

### Maintenance Records
- Service Type and Description
- Mileage at Service
- Cost and Parts Replaced
- Service Provider
- Service Date

### Transfer Records
- From/To Owners
- Sale Price
- Transfer Fee (1% of sale price)
- Transfer Date

### Recall Information
- Manufacturer ID
- Title and Description
- Severity Level
- Affected Models and Years
- Issue Date and Deadline

## Security Features

- **Access Control**: Only verified manufacturers can register vehicles
- **Ownership Verification**: Only current owners can initiate transfers
- **Time-based Expiry**: Transfer proposals expire after 24 hours
- **Immutable Records**: All records are permanently stored on blockchain
- **Transfer Fees**: Automatic calculation of 1% transfer fees

## Error Handling

The system includes comprehensive error handling:
- Unauthorized access attempts
- Invalid data validation
- Non-existent record checks
- Duplicate prevention
- Ownership verification

## Testing

The project includes comprehensive test suites using Vitest:
- Unit tests for all contract functions
- Mock contract interactions
- Edge case testing
- Error condition validation

Run tests with:
```bash
npm test
```

## Deployment

1. Deploy contracts in the following order:
    - `manufacturer-verification.clar`
    - `vehicle-registration.clar`
    - `maintenance-tracking.clar`
    - `ownership-transfer.clar`
    - `recall-coordination.clar`

2. Verify contract deployments
3. Register initial manufacturers
4. Begin vehicle registration process

## Usage Examples

### Register a Manufacturer
```clarity
(contract-call? .manufacturer-verification register-manufacturer 
  "Toyota Motor Corp" 
  "TMC-2024-001" 
  "Japan")
```

### Register a Vehicle
```clarity
(contract-call? .vehicle-registration register-vehicle 
  "1HGBH41JXMN109186"
  u1
  "Camry"
  u2024
  "Silver"
  "Hybrid"
  'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM)
```

### Add Maintenance Record
```clarity
(contract-call? .maintenance-tracking add-maintenance-record
  "1HGBH41JXMN109186"
  "Oil Change"
  "Regular maintenance service"
  u15000
  u50
  "Oil filter, Engine oil")
```

## Benefits

- **Transparency**: All vehicle history is publicly verifiable
- **Security**: Cryptographic security of blockchain technology
- **Immutability**: Records cannot be altered or deleted
- **Decentralization**: No single point of failure
- **Cost Efficiency**: Reduced intermediary costs
- **Global Access**: Accessible from anywhere in the world

## Future Enhancements

- Integration with IoT devices for automatic maintenance logging
- Insurance claim integration
- Government regulatory compliance modules
- Mobile application for end users
- Analytics dashboard for manufacturers
- Cross-chain compatibility

## Contributing

1. Fork the repository
2. Create a feature branch
3. Write tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation wiki
