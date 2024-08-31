# Modern Data Architecture
- Modern data architecture is an agile ans scalable system that efficiently manages and analyzes large and diverse datasets, enabling organizations to unlock valuable insights and make data-driven decisions.
- Case study: Your company uses an event-based architecture, and all the events are stored within a single source of truth. The data science department would love to train a model to predict the probability of a customer abandoning your service. Thus, they asked the data engineering team to provide a table with historical information in a specific format. Your company currently uses a Kappa architecture for the data platform, hence processing all the data as a stream. Select the statement that describes the best approach to meet the data science team's requirement.
    - Create a new flow for extracting the new data, and re-process the source of events to get the whole history.
- Data Mesh: architectural approach to decentralized data ownership and management.
    - Autonomous product teams.
    - Multiple business units needs to share data while maintaining their own data management and enabling self-service consumption.
- Data Fabric: architecture with a great focus on metadata analysis.
    - Improve data management
    - Integrate disparate systems and data sources to provide an unified view of data assets.
- Blob storages are normally used across most data platforms, especially for being landing zones or intermediate storage.
- Streaming Ingestion:
    - Event Producer --write--> Event Queues (pub-sub, kinesis, kafka) --read--> Event Processing (Spark, Flink) --write--> Event S3, Redshift, BigQuery.
- Landing zones as a getway for new data. They enable you to carry out further processing on your data, which can help you address quality issues and enrich it.
- Data warehouse:
    - Structure data, and need to create dashboards
    - Structure, semi-structured data and need to perform analytical querying.
- Blob storage:
    - Unstructured data, and would like to train machine learning models.
    - Need to archive it to the long term without much querying.
- RDBMS: structured data, and need to expose it via an API with single record lookup capability.
- Data governance is a set of rules that dicates how we treat our data in different stages of its life cycle. Nonetheless, it's critical to understand that these rules will require well-defined roles, processes, and tools that help with muanual overhead.
- Metadata is one of the key enablers of data governance. It assists in organizing, accessing, and understanding data.
- A data breach occurs when sensitive data is accessed, stolen, or leaked without authorization.
    - To prevent data breaches: strong access controls, encryption, regular security checks (audits).
- VPCs provide a highly secure, customizable environment where you can control the inbound and outbound network traffic.
- Orchestration:
    - Coordinate multiple jobs (tasks)
    - Automated configuration and coordination of complex workflows
    - Examples: coordinate a multiple ETL jobs with dependencies between them. Manage a complex machine learning pipeline with conditional executions.
- A quarantine zone for data is a temporary storage area used to isolate and analyze incoming data that hasn't been validated or cleansed yet. This is crucial to prevent corrupted, incomplete, or potentially harmful data from entering and affecting the main data pipeline, ensuring data quality and system security.

## Design Modern Data Architecture
A key responsibility of data architecs is understanding the business needs to be able to satisfy them with the appropriate technology. To understand the business, you need to ask a lot questions, but it is not about the quantity but the quality.
**Requirements**
- How large are the files (data)?
- How many robots?
- How frequently are those files generated?
- How data will be processed? Machine learning? Queries?
- How data will be exposed?
- What regulations/constraints do we have?

**Assumptions**
- 100 machines
- Each CSV file is around 100MB
- Plain files as database
- Tens of gigabytes for each plain file
- Model exposed through API
    - Requires all previous result or summary
    - Summary needs to be updated constantly

**Use Case**
- A retail company is looking to build a data platform to help them better understand their business and customers. They want to be able to analyze data from various sources to gain insights that can drive their decision-making and improve their business operations. These are some of their requirements:
    - Process real-time data from various sources
    - Ingest structured/unstructured data, including transactional/clickstream/social media
    - Cleanse/transform/enrich data for quality/consistency
    - Secure data with access controls protections
    - Run analytics to uncover insights on customer behavior/patterns
