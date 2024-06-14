# This document contains the documentation for our dimensional models

{% docs dim_customers %}

## Data Sources
The Customers model aggregates data from the following sources:

Customers (src_customers): Contains customer details.
Nation (src_nation): Provides information on nations.
Region (src_region): Includes regional details.

{% enddocs %}



{% docs dim_orders %}

Brief overview of the Orders model, which integrates order data, item details, and part information to generate a comprehensive view of each order and its associated parts.

## Data Sources
The Orders model aggregates data from the following sources:

Orders (src_orders): Contains order-level information.
Line Items (src_lineitem): Provides detailed information about each item in an order.
Parts (src_part): Includes detailed information about parts, such as name, manufacturer, brand, type, size, container, and retail price.
{% enddocs %}


{% docs dim_suppliers %}

Brief overview of the Supplier model, which consolidates information from various sources to present a detailed view of suppliers, parts, and their associated costs and availability.

## Data Sources
The Supplier model aggregates data from the following sources:

Suppliers (sc_supplier): Contains basic supplier information.

Parts Supplier (src_partsupp): Provides data on parts supplied by suppliers, including availability and supply cost.

Parts (src_part): Includes detailed information about parts, such as name, manufacturer, brand, type, container, and retail price.

{% enddocs %}