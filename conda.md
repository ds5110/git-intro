# conda

Opinionated recommendations for setting up and using
[conda](https://docs.conda.io/en/latest/).

Conda is a system-level binary package and environment manager that runs on all 
major operating systems and platforms.

You can get conda from [Anaconda](https://www.anaconda.com/docs/getting-started/getting-started) 
or [miniconda](https://www.anaconda.com/docs/getting-started/miniconda/main), so you may already have it.
I recommend [conda-forge](https://conda-forge.org/) and [miniforge](https://github.com/conda-forge/miniforge) instead (see below).

#### Why conda-forge and miniforge?

* There's been a growing division between Anaconda (proprietary) and 
  conda-forge (open source). The minimal installer for Anaconda is miniconda; it's open counterpart is miniforge.
* They all use conda, which is an environment and package manager.
* Conda gets sofware from [channels](https://docs.conda.io/projects/conda/en/stable/user-guide/concepts/channels.html).
  Anaconda and conda-forge use different channels.
  Anaconda's channel is missing some important scientific computing software.
* Don't mix channels.
  If you do, then you risk mysterious errors or dependency resolution problems that can be hard to debug
  ("impossible" might be a more appropriate word).
  That said, if you're already using conda and it works for you, then you may not need this document.
* Problems developed in 2024 when Anaconda's "default" channel developed incompatibilities with conda-forge.
  That's more recent than some popular data science books, which don't mention miniforge, such as
  * Jake VanderPlas, the author of 
  [Python Data Science Handbook, 2nd Ed (2022)](https://github.com/jakevdp/PythonDataScienceHandbook)
  * Wes McKinney lead developer of Pandas and author of 
  [Python for Data Analysis, 3rd Ed (2022)](https://wesmckinney.com)
* If you already have conda, then you may want to 
  [transition away from defaults](see: https://conda-forge.org/docs/user/transitioning_from_defaults/)

#### What about pip?

* And then there's pip!
  * Jake VanderPlas talks about pip & conda in an old (2016) but still interesting and relevant blog post:
  [Conda myths and misconceptions](https://jakevdp.github.io/blog/2016/08/25/conda-myths-and-misconceptions/)
* Avoid pip if you can. And if you can't, then at least be careful about it.
  * See: [Using pip in an environment](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#using-pip-in-an-environment) -- conda.io
  * This link has best practices for using conda and pip

## First things first

Recommendations below assume that you're using Linux, MacOS or WSL. If not, then see [setup.md](setup.md).

## 1. Install miniforge

Download the installer -- https://conda-forge.org/download/ -- and install as directed.

* I used the command-line install: `bash Miniforge3-$(uname)-$(uname -m).sh`
* miniforge includes Python 3.x and a minimal distribution of Python friends.

## 2. Use conda environments

* What's a conda environment? A: 
  [conda environment](https://docs.conda.io/projects/conda/en/stable/glossary.html#conda-environment) -- docs.conda.io
* See: [conda user guide](https://docs.conda.io/projects/conda/en/latest/user-guide/index.html) -- docs.conda.io
* I've added some [common conda commands](#common-conda-commands) below.

### 3. Don't mix channels

See the discussion above.
```
conda config --show channels              # lists channels
```

## Common conda commands

### Create and activate a conda environment

You can create an environment called "myenv" with a specific version of python:
```
conda create -n myenv python=3.9
```
Activate the environment and verify
```
conda activate myenv
python --version
```
Deactivate the environment
```
conda deactivate
```

**References:**

* [Manage environments](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) -- conda.io
* [Creating an environment with commands](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-with-commands)
* vscode instructions for conda environments: https://code.visualstudio.com/docs/python/environments

### Install libraries in a conda environment

You can use conda to create multiple environments with various installed libraries.

* You can create a new environment called "myenv" and install (by hand) the 
  latest scikit-learn and friends from conda-forge
```
conda create --name myenv
conda activate myenv
conda install -c conda-forge::python
conda install -c conda-forge::scikit-learn
conda install -c conda-forge::seaborn
conda install -c conda-forge::pandas
conda install -c conda-forge::matplotlib
conda install -c conda-forge::make
```
* Rather than install by hand, I recommend YML files (see below)
* Once installed, activate the "myenv" environment
```
conda activate myenv
```
* And deactivate the currently activated environment
```
conda deactivate
```
* List all installed environments
```
conda env list
```

### Remove an environment

```
conda remove --name myenv --all
```

Ref: [Remove an environment](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#removing-an-environment) -- conda.io

### YML files

Use YML files to [manage](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html),
and [share](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#sharing-an-environment) your conda environments.
I created an environment.yml for this repo with:
```
conda env export --from-history
```
Here's my latest [environment.yml](environment.yml).

### Create an environment from a yml file

Create an environment called "myenv" from a YML file:
```
conda env create --name myenv -f environment.yml
```
Ref: [Creating an environment from an enviroment.yml file](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-from-an-environment-yml-file) -- conda.io

### Web dev

For web development (e.g., [Observable Framework](https://observablehq.com/framework/)), see [node.md](node.md)

For Python back ends you can use this framework.yml file:
```
name: framework
channels:
  - conda-forge
dependencies:
  - werkzeug
  - flask
  - uvicorn
```
and install with
```
conda env create -f framework.yml
```

### Geospatial

* Geospatial software has dependencies that can cause problems.
  It can get especially bad if you mix package managers!
* see: [geopandas install](https://geopandas.org/en/stable/getting_started/install.html)
* see also: [using multiple channels](https://conda-forge.org/docs/user/tipsandtricks.html#using-multiple-channels)

### Conda docs

* [conda docs](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
* [conda cheatsheet](https://docs.conda.io/projects/conda/en/latest/_downloads/843d9e0198f2a193a3484886fa28163c/conda-cheatsheet.pdf)
