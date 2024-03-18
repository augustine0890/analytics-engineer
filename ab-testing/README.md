# A/B Testing in Python

## What is an A/B test
- Multivariate testing, hypothesis testing, experimentation
- Decision making support and research methodology
  - Allows you to measure an impact of a change in a product
- __A/B test key characteristics:__
  - Controlled deliberate experiment
  - Based on randomized set of users
  - Defined hypothesis and ability to measure the success
    - There is a control group with default experience and at least one test group with new experience
- __Steps of A/B Test__
1. Define a hypothesis
   - Assumption on how the change will effect the users
2. Decide how to design the feature
3. Build the feature
4. Determine how to measure success of the feature
5. Determine how to run the A/B test
   - For how long do we run the A/B test?
   - How many users do we want to assign to the test?
   - How do we monitor the performance of the test?
6. Analyzing the results
- __Metrics for Digital Products__
  - Engagement based metrics:
    - Number of users
    - Number of downloads
    - Number of active users (daily, weekly, monthly)
    - User retention
    - User engagement
  - Revenue and monetization metrics:
    - Ads and affiliate links
    - Subscription-based
    - In-app purchases
    - Other revenue streams
  - Daily active users (DAU): to make sure users come back
  - Click-through rate (CTR): new type of sponsored posts vs old type of sponsored posts
  
## Data Instrumentation and Tracking
- The App --> Raw tracking events (Data Engineer) --> Cleaned events --> Low level aggregations (Data Scientist) --> Business level aggregations (Data Report)