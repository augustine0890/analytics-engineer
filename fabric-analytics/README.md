# AI Skills Challenge: Fabric Analytics Engineer
- Analytics Engineers connect, ingest, store, analyze, and report on data with Microsoft Fabric.

__1. Introduction to end-to-end analytics using Microsoft Fabric (MF)__
- Fabric provides a set of integrated services that enable you to ingest, store, process, and analyze data in a single environment.
- Fabric is a unified software-as-a-service (SaaS) offering, with all your data stored in a single open format in OneLake.

**OneLake**
- OneLake is Fabric's lake-centric architecture that provides a single, integrated environment for data professionals and the business to collaborate on data projects.
- A key component of OneLake that allows you to read data from a single copy, without moving or duplicating data.
    - Fabric's data warehousing, data engineering (Lakehouses and Notebooks), data integration (pipelines and dataflows), real-time analytics, and Power BI all use OneLake as their native store without needing any extra configuration.
- The default storage format for OneLake is Delta Parquet, which is an open-source storage layer that brings reliability to data lakes.
- Provides a comprehensive data analytics solution by unifying all these experiences on a single platform
    - Synapse Data Engineering: data engineering with a Spark platform for data transformation at scale.
    - Synapse Data Warehouse: data warehousing with industry-leading SQL performance and scale to support data use.
    - Synapse Data Science: data science with Azure Machine Learning and Spark for model training and execution tracking in a scalable environment.
    - Synapse Real-Time Analytics: real-time analytics to query and analyze large volumes of data in real-time.
    - Data Factory: data integration combining Power Query with the scale of Azure Data Factory to move and transform data.
    - Power BI: business intelligence for translating data to decisions.
![OneLake Storage](./onelake-storage.png)
- Fabric is built on Power BI and Azure Data Lake Storage, and includes capabilities from Azure Synapse Analytics, Azure Data Factory, Azure Databricks, and Azure Machine Learning.

__2. Get started with lake-houses in MF__
- A lakehouse is a unified platform that combines:
  - The flexible and scalable storage of a data lake
  - The ability to query and analyze data of a data warehouse
- Can use a lakehouse as the basis of an end-to-end data analytics solution that includes data ingestion, transformation, modeling, and visualization.
- A shortcut enables to include external (Azure Data Lake Store Gen2) data in the lakehouse.
- Data ingestion can also be automated using Data Factory Pipelines or Dataflows (Gen2).
  - Dataflows (Gen2) are based on Power Query. The familiar tool to data analysts using Excel or Power BI that provides visual representation of transformations as an alternative to traditional programming.
- Data Factory Pipelines can be used to orchestrate Spark, Dataflow, and other activities --> enabling to implement complex data transformation processes.
- After transforming the data, you can query it using SQL, use it to train machine learning models, perform real-time analytics, or develop reports in Power BI.
- [Hands-on Lab: Create and Ingest Data with Fabric Lakehouse](https://microsoftlearning.github.io/mslearn-fabric/Instructions/Labs/01-lakehouse.html)

__3. Use Apache Spark in MF__
- Apache Spark is an open source parallel processing framework for large-scale data processing and analytics.
- Spark uses a "divide and conquer" approach to processing large volumes of data quickly by distributing the work across multiple computers.
- In most scenarios, the default settings provide an optimal configuration for Spark in Microsoft Fabric.
- The Parquet format is typically preferred for data files that you will use for further analysis or ingestion into an analytical store.
- Partitioning is an optimization technique that enables Spark to maximize performance across the worker nodes. More performance gains can be achieved when filtering data in queries by eliminating unnecessary disk IO.
- The Spark catalog supports tables based on files in various formats:
  - The preferred format in MF is `delta`, which is the format for a relational data technology on Spark named Delta Lake.
- [Hands-on Lab: Analyze data with Apache Spark](https://microsoftlearning.github.io/mslearn-fabric/Instructions/Labs/02-analyze-spark.html)

__4. Work with Delta Lake tables in MF__
- Tables in a MF lakehouse are based on the Linux foundation Delta Lake table format.
- Delta Lake is an open-source storage layer for Spark that enables relational database capabilities for batch ans streaming data.
- Delta tables are schema abstractions over data files that are stored in Delta format. For each table, the lakehouse stores a folder containing Parquet data files and a _delta_Log folder in which transaction details are logged in JSON format.
- The benefits of using Delta tables:
  - Relational tables that support querying and data modification.
  - Support for ACID transactions
  - Data versioning and time travel
  - Support for batch and streaming data
  - Standard formats and interoperability.
- A typical stream processing solution involves constantly reading a stream of data from source, optionally processing it to select specific fields, aggregate and group values, or otherwise manipulate the data, and writing the results to a sink.
  - You could capture a stream of real time data from an IoT device and write the stream directly to a delta as a sink - enabling you to query the table to see the latest streamed data.
- [Hands-on Lab: Use delta tables in Apache Spark](https://microsoftlearning.github.io/mslearn-fabric/Instructions/Labs/03-delta-lake.html)