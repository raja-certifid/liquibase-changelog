# Order History Database Management System

This project implements a comprehensive order history database system using MySQL and Liquibase for database version control. It includes tables for managing customers, orders, payments, shipments, and related entities.

## Database Schema

The system includes the following main components:

### Core Entities
- `Customer` & `CustomerGroup`: Customer management
- `Order` & `OrderItem`: Order management
- `Address`: Address information

### Payment & Tax
- `Payment`: Payment records
- `OrderAppliedTaxSummary` & `OrderAppliedTaxItem`: Tax calculations

### Shipping
- `Shipment`: Shipment information
- `ShipmentItem`: Items in shipments
- `ShipmentTrack`: Shipment tracking

### Order Tracking
- `OrderStatusHistory`: Order status changes
- `OrderSourceSelectionSummary` & `OrderSourceSelectionItem`: Order source information

## Prerequisites

- Docker and Docker Compose
- Java Runtime Environment (JRE) 8 or higher
- Bash shell (for Unix-based systems) or Git Bash (for Windows)

## Setup

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. Start the MySQL database:
   ```bash
   docker-compose up -d
   ```

3. Run the database migrations:
   ```bash
   ./run-liquibase.sh
   ```

## Database Configuration

The MySQL database is configured with the following default settings:

- Database Name: `order_history`
- Username: `order_user`
- Password: `order_pass`
- Port: `3306`
- Host: `localhost` (when accessing from host machine)

These settings can be modified in both `docker-compose.yml` and `liquibase.properties`.

## Project Structure

```
.
├── changelog-master.yaml           # Master changelog file
├── docker-compose.yml             # Docker configuration
├── liquibase.properties           # Liquibase configuration
├── run-liquibase.sh              # Script to run migrations
└── changelogs/                    # Database change files
    ├── 000_create_customer_group.yaml
    ├── 001_create_customer.yaml
    └── ...
```

## Database Migration Files

The database schema is managed through Liquibase changelog files:

1. Customer Management (000-001)
2. Address and Order Management (002-004)
3. Payment Processing (005)
4. Shipment Handling (006-008)
5. Order Status and Tracking (009)
6. Tax Management (010-011)
7. Order Source Selection (012-013)

## Development

### Adding New Changes

1. Create a new changelog file in the root directory
2. Add your changes using Liquibase YAML format
3. Include the new changelog in `changelog-master.yaml`
4. Run the migrations using `./run-liquibase.sh`

### Best Practices

- Always create new changelog files for changes
- Use meaningful names for changelog files
- Include rollback instructions where possible
- Test changes in a development environment first

## Troubleshooting

### Common Issues

1. If MySQL connection fails:
   - Check if Docker container is running
   - Verify port 3306 is not in use
   - Confirm credentials in `liquibase.properties`

2. If Liquibase fails:
   - Ensure Java is installed and in PATH
   - Check if changelog files are properly formatted
   - Verify file permissions on `run-liquibase.sh`

## Contributing

1. Create a feature branch
2. Make your changes
3. Test thoroughly
4. Submit a pull request

## License

[Add your license information here]

## Contact

[Add your contact information here] 