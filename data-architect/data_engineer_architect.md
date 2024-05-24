## Data Transformation
- The Evolution of ETL:
  - Early: Code ETL, Bash, SQL, Perl <- Single Server
  - On-premises: Visual ETL, Informatica, IBM, Azure, Alteryx <- ETL Engine, SQL Data Warehouse.
  - Early CLoud: Code, Internal Frameworks, Spark, SQL Cloud Warehouse
  - Mature Cloud: Unified Visual and Code with packages, Spark, SQL Cloud Warehouse

## Data Lakes and Data Warehouse
- A data lake is a central location that holds a large amount of data in its native, raw format.
- Data Lakes:
  - Structured, semi-structured, unstructured, raw
  - Schema on read
  - Designed for large data volume
  - Choose from various processing engines
  - No built-in data management
- Data Warehouse:
  - Structured, processed
  - Schema on write
  - Expensive for large data volume
  - Limited processing options
  - Native data management support
- Data Lakehouse: diverse data sources, including traditional applications and modern streams, contribute to the architecture.
  - Connecting to data sources, ingesting both batch and real-time data into data lake
  - Catalog: stores metadata in the Lake House storage layer. It is shared between the data lake and data warehouse, allowing unified querying and dataset discovery.
  - Processing: transforms data into a consumable state through validation, cleanup, normalization, transformation, and enrichment.
  - Consumption: enable data access using various analysis methods, including interactive SQL queries, traditional analytics, BI dashboards, and machine learning.