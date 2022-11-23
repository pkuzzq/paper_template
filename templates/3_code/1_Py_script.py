# %% imports
import os, sys, glob, re, itertools, collections, requests
import multiprocessing, joblib # parallelise list comprehensions
from pathlib import Path
from joblib import Parallel, delayed
# filler to import personal library
# sys.path.append('/home/alal/Desktop/code/py_libraries/')

# pyscience imports
import numpy as np
import pandas as pd
import datatable as dt
from datatable import f
import scipy as sp
import statsmodels.formula.api as smf

# viz
import matplotlib
import matplotlib.pyplot as plt
import seaborn as sns
sns.set(style="ticks", context="talk")
matplotlib.style.use(['seaborn-talk', 'seaborn-ticks', 'seaborn-whitegrid'])
font = {'family' : 'IBM Plex Sans',
                 'weight' : 'normal',
                 'size'   : 10}
plt.rc('font', **font)
plt.rcParams['figure.figsize'] = [10, 10]
%matplotlib inline
%config InlineBackend.figure_format = 'retina'

%load_ext autoreload
%autoreload 1

%load_ext watermark
%watermark --iversions

# %%
