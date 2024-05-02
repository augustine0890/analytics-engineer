# dbt (data build tool)
- "data build tool"
- Primarily handles the T in the ELT (sometimes ETL)
- Allows easy switching between data warehouses
- What does dbt do?
  - Primarily defines data models and transformations using SQL
  - Translates between SQL dialects
  - Can define relationships between data models.
  - Run the data transformation process(es) as requested
  - Can test for data quality requirements
  - Adapters provide connections to different data warehouses:
    - dbt-snowflake
    - dbt-bigquery
    - dbt-sqlserver
- Who is dbt for?
  - `dbt` is designed for any users that need to transform data: data engineers, analytics engineers, data analysts.
- `dbt -v` show the version of dbt currently installed.
- What is a dbt project?
  - Encompass components for working with data in dbt
  - Project configuration
  - Data sources and destinations
  - SQL queries
  - Templates
  - Documentation
  - Implemented as a folder structure
- How to create a new project?
  - Use the  `dbt init` command:
    - Ask the name of the project
    - Ask which database/data warehouse type
  - Can consolidate with `dbt init <projectname>`
  - `dbt_project.yml`
  ```yaml
  nyc_yellow_taxi:
    outputs:
      dev:
        type: duckdb
        path: dbt.duckdb
    target: dev
  ```
  - Use the command `dbt debug` to verify no errors.
    - Verify connectivity to database and data warehouses
    - Data warehouses must be created/accessible first
  - Create the top level project folder and all needed structures
  - `dbt run`:
    - Run whenever their model changes
    - Or when the data process needs to be materialized
    - Output provides many details on the success or failure of the various steps
- Define configuration with project profiles
  - A profile represents a given deployment scenario:
    - Development
    - Staging/Test
    - Production
  - A dbt project can have multiple profiles
  - Defined in the `profiles.yml` file.
- DuckDB: open source serverless database
  - Similar to sqlite
  - Designed for analytics
  - Vectorized (meaning FAST)
  - dbt-duckdb
- Workflow for `dbt`
  1. Create a project (`dbt init`)
  2. Define configuration (`profiles.yml`)
  3. Create/use models/templates
  4. Instantiate models (`dbt run`)
  5. Verify/Test/Troubleshoot
  6. Repeat as needed
- Table vs View:
  - Tables:
    - Objects within a database/warehouse that hold data
    - Take up space within the database
    - Content only updated when changed
  - Views:
    - Queryable like a table
    - Usually defined as a select query against another table or tables
    - Content generated with each query