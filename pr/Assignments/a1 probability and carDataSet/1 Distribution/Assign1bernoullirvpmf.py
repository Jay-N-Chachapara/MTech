# -*- coding: utf-8 -*-
"""BernoulliRVPMF.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1vJuRKm7Bvcs3FaVE6X26Bi7LcyfYI5jd
"""

"""
Assignment1
Enrollement No. : MT21MCS013 Jay
"""
from scipy.stats import bernoulli
import matplotlib.pyplot as plt
import numpy as np

fig, ax = plt.subplots(1, 1)

p = 0.9

x = np.arange(bernoulli.ppf(0.01, p),
              bernoulli.ppf(0.99, p))
data_bern = bernoulli.rvs(size=5000,p=0.6)
rv = bernoulli(p)
ax.bar(data_bern, rv.pmf(data_bern),label="Benouli PMF")
ax.legend(loc='best', frameon=False)
plt.show()