import pandas as pd

# User activity
data = pd.read_csv("data/activity_all.csv")
data.head()
print(len(data))
# Assuming your DataFrame is called 'df'
# first_1000_rows = data.head(1000)  # Select the first 1000 rows
# Save the DataFrame to a CSV file
# first_1000_rows.to_csv("data/activity_all.csv", index=False)
data.activity_level.value_counts().sort_values()
data.groupby("activity_level").describe().head()

# Calculating Daily Active Users
activity = data.query("activity_level > 0").groupby(["dt"]).count().reset_index()
print(activity.describe())

# Click-through rate
data = pd.read_csv("data/ctr_all.csv")
data.head()
print(len(data))
# ctr = data.groupby(["dt"]).mean().reset_index()
