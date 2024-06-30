# DBT Project: Data Models

## Overview

This project utilizes DBT (Data Build Tool) to transform and organize raw data from multiple sources into comprehensive models for analysis and reporting. The models include Supplier, Orders, and Customers, each integrating data from various datasets to provide detailed views of business operations.

## Contents

- [Models](#models)
  - [Supplier Model](#supplier-model)
  - [Orders Model](#orders-model)
  - [Customers Model](#customers-model)
- [Tests and Macros](#tests-and-macros)
- [Running the Project](#running-the-project)
- [Contributing](#contributing)
- [License](#license)

## Models

### Supplier Model

#### Description
The Supplier model consolidates information about suppliers, the parts they supply, and associated costs and availability. It integrates data from supplier, parts supplier, and parts datasets.

#### Data Sources
- **Suppliers (`sc_supplier`)**: Contains basic supplier information.
- **Parts Supplier (`src_partsupp`)**: Provides data on parts supplied by suppliers, including availability and supply cost.
- **Parts (`src_part`)**: Includes detailed information about parts, such as name, manufacturer, brand, type, container, and retail price.

### Orders Model

#### Description
The Orders model combines order data, item details, and part information to generate a comprehensive view of each order and its associated parts.

#### Data Sources
- **Orders (`src_orders`)**: Contains order-level information.
- **Line Items (`src_lineitem`)**: Provides detailed information about each item in an order.
- **Parts (`src_part`)**: Includes detailed information about parts, such as name, manufacturer, brand, type, size, container, and retail price.

### Customers Model

#### Description
The Customers model integrates customer data with nation and region details, providing a comprehensive view of each customer's geographic and market segment context.

#### Data Sources
- **Customers (`src_customers`)**: Contains customer details.
- **Nation (`src_nation`)**: Provides information on nations.
- **Region (`src_region`)**: Includes regional details.

## Tests and Macros

### Data Tests
This project includes various data tests to ensure the accuracy and integrity of the data. These tests check for conditions such as non-null values, unique keys, and referential integrity between tables.

### Generic Tests
Generic tests are reusable tests applied to multiple models or columns to validate common conditions like uniqueness, non-nullability, and accepted value ranges.

### Macros
Macros are SQL snippets that can be reused across multiple models. This project includes macros to generate unique keys, extract dates, and other common transformations.

## Running the Project

To generate the documentation, run:
```sh
dbt docs generate
```

To list all models, run:
```sh
dbt ls
```

To run the models, use:
```sh
dbt run
```

To test the models, use:
```sh
dbt test
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes