import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from readit import csv

df = csv('data/Wage.csv')

ax = sns.regplot(x="age", y="wage", data=df,
                 scatter_kws={"color": "gray", "s": 20},
                 line_kws={"color": "blue"},
                 order=4, ci=None)
fig = plt.gcf()
fig.set_size_inches(5, 6)

plt.savefig("figs/q1.png")
plt.show()
