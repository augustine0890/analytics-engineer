# %%
import pandas as pd
import numpy as np
import altair as alt
alt.data_transformers.disable_max_rows()
from datetime import datetime
from scipy.stats import ttest_ind

# %% [markdown]
# # A/B test analysis

# %% [markdown]
# ## Assignments

# %%
data = pd.read_csv("data/assignments.csv")

# %%
data.head()

# %%
print(datetime.strptime(data.head(1)['ts'][0], '%Y-%m-%dT%H:%M:%SZ').strftime("%Y-%m-%d"))

# %%
data['dt'] = data['ts'].map(lambda x: datetime.strptime(x, '%Y-%m-%dT%H:%M:%SZ').strftime("%Y-%m-%d"))

# %%
data.head()

# %%
data.describe()

# %%
data.groupby(['groupid']).count()

# %%
data_count = data.groupby(['groupid','dt']).count().reset_index()

# %%
data_count.head()

# %%
alt.Chart(data_count).mark_line(size=3).encode(
    alt.X('dt'),
    alt.Y('userid'),
    color='groupid:O',
    tooltip=['userid']
).properties(
    width=600,
    height=400
)

# %% [markdown]
# ## Pre-test metrics

# %% [markdown]
# ### User activity

# %%
data_act = pd.read_csv("data/activity_all.csv")

# %%
data_act.head()

# %%
data_act.groupby(['groupid','dt']).describe()

# %%
data_act.query('activity_level > 0').groupby(['dt', 'groupid']).count().reset_index().head()

# %%
alt.Chart(data_act.query('activity_level > 0').groupby(['dt', 'groupid']).count().reset_index()).mark_line(size=3).encode(
    alt.X('dt'),
    alt.Y('userid'),
    color='groupid:O',
    tooltip=['userid']
).properties(
    width=600,
    height=400
)

# %%
(
    data_act.query('activity_level > 0 and groupid == 0 and dt >= "2021-11-01"')
    .groupby(['dt','groupid']).count().reset_index()[['groupid','activity_level']].describe()
)

# %%
(
    data_act.query('activity_level > 0 and groupid == 1 and dt >= "2021-11-01"')
    .groupby(['dt','groupid']).count().reset_index()[['groupid','activity_level']].describe()
)

# %%
data_act.query('dt >= "2021-11-01"').groupby(['groupid']).describe()

# %%
data_act.query('dt < "2021-11-01"').groupby('groupid').describe()

# %%
data_act_count = data_act.query('activity_level > 0').groupby(['groupid','dt']).count().reset_index()

# %%
data_act_count.head()

# %%
alt.Chart(data_act_count).mark_line(size=3).encode(
    alt.X('dt'),
    alt.Y('userid'),
    color='groupid:O',
    tooltip=['userid']
).properties(
    width=600,
    height=400
)

# %% [markdown]
# ### Comparing the activity between the groups

# %% [markdown]
# By the activity levels

# %%
data_act.query('groupid == 0')['activity_level'].to_numpy()

# %%
res = ttest_ind(data_act.query('groupid == 0 and dt >= "2021-11-01"')['activity_level'].to_numpy(),
                data_act.query('groupid == 1 and dt >= "2021-11-01"')['activity_level'].to_numpy()).pvalue

print(res)

# %%
"{:.100f}".format(res)

# %% [markdown]
# By the number of active users

# %%
before = data_act_count.query('dt < "2021-11-01"')

# %%
after = data_act_count.query('dt >= "2021-11-01"')

# %%
before.head()

# %% [markdown]
# Checking for the pretest bias on activity.

# %%
np.mean(before.query('groupid == 0')['userid'].to_numpy())

# %%
np.mean(before.query('groupid == 1')['userid'].to_numpy())

# %%
res = ttest_ind(before.query('groupid == 0')['userid'].to_numpy(), before.query('groupid == 1')['userid']
                .to_numpy()).pvalue

print(res)

# %%
"{:.100f}".format(res)

# %%
np.mean(after.query('groupid == 0')['userid'].to_numpy())

# %%
np.mean(after.query('groupid == 1')['userid'].to_numpy())

# %%
res = ttest_ind(after.query('groupid == 0')['userid'].to_numpy(), after.query('groupid == 1')['userid']
                .to_numpy()).pvalue

print(res)

# %%
"{:.100f}".format(res)

# %% [markdown]
# ### Click through rate (CTR)

# %%
data_ctr = pd.read_csv("data/ctr_all.csv")

# %%
data_ctr.head()

# %%
data_ctr_avg = data_ctr.groupby(['groupid','dt']).mean().reset_index()

# %%
alt.Chart(data_ctr_avg).mark_line(size=5).encode(
    alt.X('dt'),
    alt.Y('ctr'),
    color='groupid:O',
    tooltip=['ctr']
).properties(
    width=600,
    height=400
)

# %%
before = data_ctr.query('dt < "2021-11-01"')[['groupid', 'ctr']]

# %%
after = data_ctr.query('dt >= "2021-11-01"')[['groupid', 'ctr']]

# %%
after

# %%
before.query('groupid == 0')['ctr'].to_numpy().mean()

# %%
before.query('groupid == 1')['ctr'].to_numpy().mean()

# %%
after.query('groupid == 0')['ctr'].to_numpy().mean()

# %%
after.query('groupid == 1')['ctr'].to_numpy().mean()

# %%
before.query('groupid == 0')['ctr'].to_numpy().std()

# %%
before.query('groupid == 1')['ctr'].to_numpy().std()

# %%
after.query('groupid == 0')['ctr'].to_numpy().std()

# %%
after.query('groupid == 1')['ctr'].to_numpy().std()

# %%
res = ttest_ind(before.query('groupid == 0')['ctr'].to_numpy(), before.query('groupid == 1')['ctr']
                .to_numpy()).pvalue

print(res)

# %%
res = ttest_ind(after.query('groupid == 0')['ctr'].to_numpy(), after.query('groupid == 1')['ctr']
                .to_numpy()).pvalue
print(res)

# %%
"{:.100f}".format(res)


