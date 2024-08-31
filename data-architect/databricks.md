# Databricks!
**The Databricks Lakehouse Platform**
1. Single platform for all data workloads
2. Built on open source technology
3. Collaborative environment
4. Simplified architecture
- `Delta` is open-source data storage file format:
    - ACID transactions
    - Unified batch and streaming
    - Schema evolution
    - Table history
    - Time-travel
- `Unity Catalog` is open data governance strategy that controls access to all data assets in the Databricks Lakehouse Platform.
    - `SQL GRANT`, `REVOKE`, statements to control access.
- The Control Plane is the brains of the platform, controling all processing and creating clusters. The Compute Plane is the muscles of the data platform, and houses all of the physical entities of the platform.
- Databricks can connect to most, if not all, of our other data systems, not just the data in the data lake.
- Account Admins have permissions to the entire account and back-end configurations, while Workspace Admins have permissions for the operations within a specific workspace.

## Data Intelligence Platform
- `Auto Loader` processes new data files as they land in a data lake
    - Incremental processing
    - Efficient processing
    - Automatic
    ```python
    spark.readStream
        .format("cloudFiles")
        .option("cloudFiles.format", "json")
        .load(filepath)
    ```
    - Use case: Right now, I am reading in several CSV files from an external data lake location. It has been really hard to keep my tables accurate because I never know when the new data files come in, and I cannot easily remember which files I have already loaded into my tables.
- Delta Live Tables (DLT) is simplifies the creation, deployment, and management of reliable data pipelines.
- Example Data Pipeline Steps:
    1. Ingest raw data files into a Delta table with Autoloader
    2. Create a Delta Live Table pipeline to clean and join datasets.
    3. Create a Delta Live Table pipeline to aggregate datasets for BI applications
    4. Orchestrate all the Data Engineering tasks with a Databricks Workflow.
    5. Monitor data quality of the pipeline to keep track of the accuracy of your tables.
- The Catolog Explorer can quickly provide a sampling of a data table directly in the UI. By leveraging the Catolog Explorer, you can be much more flexible and thorough when exploring data assets in your organization.
- `Photon` is a high-performance query engine developed to optimize SQL execution in databricks. It's designed to accelarate data processing by taking advantage of modern hardware.
