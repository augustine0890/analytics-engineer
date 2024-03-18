import pandas as pd

assgiments_data = pd.read_csv("data/assignments.csv")
random_rows = assgiments_data.sample(n=1000, replace=True)
random_rows.to_csv("data/assignments.csv", index=False)

activity_data = pd.read_csv("data/activity_all.csv")
random_rows = activity_data.sample(n=1000, replace=True)
random_rows.to_csv("data/activity_all.csv", index=False)

ctr_data = pd.read_csv("data/ctr_all.csv")
random_rows = ctr_data.sample(n=1000, replace=True)
random_rows.to_csv("data/ctr_all.csv", index=False)
