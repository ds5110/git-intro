# conda

Opinionated recommendations for setting up and using
[conda](https://docs.conda.io/en/latest/).

Conda is a system-level binary package and environment manager that runs on all 
major operating systems and platforms.

To get conda, I recommend [conda-forge](https://conda-forge.org/) and [miniforge](https://github.com/conda-forge/miniforge) (see below).

I do NOT recommend [Anaconda](https://www.anaconda.com/docs/getting-started/getting-started) 
or [miniconda](https://www.anaconda.com/docs/getting-started/miniconda/main).
They both use conda. If you're already using one of them, then you may be okay. 
In other words, if it ain't broke, don't fix it.  However, if you start encountering reproducibility 
problems it may be time to fix it.

## Why conda-forge and miniforge? Why not anaconda or miniconda?

* There's been a growing division between Anaconda (commercial licensing) and 
  conda-forge (open source). The minimal installer for Anaconda is miniconda; 
  its open source counterpart is miniforge.
  They all use conda, which is open source.
* Conda gets software from [channels](https://docs.conda.io/projects/conda/en/stable/user-guide/concepts/channels.html).
  Anaconda and conda-forge use different channels.
  Anaconda's channel is missing some important scientific computing software.
* Don't mix channels.
  If you do, then you risk mysterious errors or dependency resolution problems that can be hard to debug
  ("nearly impossible" might be a more appropriate term).
  That said, if you're already using conda and it works for you, then you may not need this document.
* Problems developed in 2024 when Anaconda's "default" channel developed incompatibilities with conda-forge.
  That's more recent than some popular data science books, which don't mention miniforge, such as
  * Jake VanderPlas, the author of 
  [Python Data Science Handbook, 2nd Ed (2022)](https://github.com/jakevdp/PythonDataScienceHandbook)
  * Wes McKinney, lead developer of Pandas and author of 
  [Python for Data Analysis, 3rd Ed (2022)](https://wesmckinney.com)
* If you're using anaconda or miniconda, then you may want to 
  [transition away from them](https://conda-forge.org/docs/user/transitioning_from_defaults/).

## What about pip?

* And then there's pip!
  * Jake VanderPlas talks about pip & conda in an old (2016) but still interesting and relevant blog post:
  [Conda myths and misconceptions](https://jakevdp.github.io/blog/2016/08/25/conda-myths-and-misconceptions/)
* Avoid pip, or at least be careful about it.
  * See: [Using pip in an environment](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#using-pip-in-an-environment) -- conda.io
  * This link has best practices for using conda and pip

## Recommendations

### 0. First things first

Recommendations below assume that you're using Linux, MacOS or WSL (WSL is for windows users).
If not, then see [setup.md](setup.md).

### 1. Install miniforge

Download the installer -- https://conda-forge.org/download/ -- and install as directed.

* I used the command-line install:
  ```
  curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
  bash Miniforge3-$(uname)-$(uname -m).sh
  ```
* When the installer asks whether to initialize conda, answer **yes**.
  Then open a new terminal. (If you get `conda: command not found`, that's usually why.)
* miniforge includes Python 3.x and a minimal distribution of Python friends.

### 2. Use conda environments

* What's a conda environment? A: 
  [conda environment](https://docs.conda.io/projects/conda/en/stable/glossary.html#conda-environment) -- docs.conda.io
* See: [conda user guide](https://docs.conda.io/projects/conda/en/latest/user-guide/index.html) -- docs.conda.io
* I've added some [common conda commands](#common-conda-commands) below.

### 3. Don't mix channels

See the discussion above.
```
conda config --show channels              # lists channels
```
With miniforge, you should only see `conda-forge`. If you see `defaults`, remove it:
```
conda config --remove channels defaults
```

## Common conda commands

### Create and activate a conda environment

You can create an environment called "myenv" with a specific version of python:
```
conda create -n myenv python=3.13
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
List all the installed environments
```
conda env list
```
Remove an environment
```
conda remove --name myenv --all
```

**References:**

* [Manage environments](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) -- conda.io
* [Creating an environment with commands](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-with-commands)
* [Remove an environment](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#removing-an-environment) -- conda.io
* vscode instructions for conda environments: https://code.visualstudio.com/docs/python/environments

### Install libraries in a conda environment

You can use conda to create multiple environments with various installed libraries.

* You can create a new environment called "myenv" and install (by hand) the
  latest scikit-learn and friends from conda-forge
```
conda create --name myenv
conda activate myenv
conda install scikit-learn seaborn pandas matplotlib make
```
* Install packages in one command when you can. Conda then solves for all of them together.
  Installing them one at a time is slower, and each install can downgrade or swap packages you already have.
* With miniforge, conda-forge is the only channel, so you don't need the `conda-forge::` prefix.
* Without version numbers, this isn't reproducible. For reproducibility, I recommend YML files.

### YML files

Use YML files to [manage](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html),
and [share](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#sharing-an-environment) your conda environments.
I'll often create an environment by hand with the latest software, and I can create
a YML file that recovers what I did with
```
conda env export --from-history > environment.yml
```
That only lists the packages you asked for, and only includes version numbers if you specified them.
For example, [environment.yml](environment.yml) pins python, numpy and pandas and leaves the rest unpinned.

To share an environment across operating systems (e.g., Mac vs. Linux/WSL), use `--from-history`
and pin the versions of the packages that matter, like [environment.yml](environment.yml) does.

To record the exact version of every installed package, use
```
conda env export --no-builds > environment.yml
```
That only reliably recreates the environment on the same OS.
Even without build strings, a full export lists OS-specific packages (e.g., macOS-only libraries)
that don't exist on other platforms.
(For exact, cross-platform lock files, look into [conda-lock](https://conda.github.io/conda-lock/) or [pixi](https://pixi.sh/).)

### Create an environment from a yml file

Create an environment called "myenv" from a YML file:
```
conda env create --name myenv -f environment.yml
```
Ref: [Creating an environment from an environment.yml file](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-from-an-environment-yml-file) -- conda.io

### Web dev

A typical web project has a JavaScript front end and a Python (e.g., FastAPI) back end.
Use Node and npm for the front end (e.g., [Observable Framework](https://observablehq.com/framework/); see [node.md](node.md)),
and a conda environment for the back end (below).
A Makefile can run both, so one command builds or starts the whole project.

For [FastAPI](https://fastapi.tiangolo.com/) (Python), you can use this fastapi.yml file:
```
name: fastapi
channels:
  - conda-forge
dependencies:
  - python=3.13
  - fastapi
```
and install with
```
conda env create -f fastapi.yml
conda activate fastapi
fastapi dev main.py     # run your app (main.py) with auto-reload
```
* On conda-forge, `fastapi` is the same as `pip install "fastapi[standard]"` in the FastAPI docs:
  it includes the `uvicorn` server and the `fastapi` command.
  (`fastapi-core` is the framework by itself.)
* So skip the `pip install` step in FastAPI tutorials -- you already have everything.

### Geospatial

* Geospatial software has dependencies that can cause problems.
  It can get especially bad if you mix package managers!
* see: [geopandas install](https://geopandas.org/en/stable/getting_started/install.html)
* see also: [using multiple channels](https://conda-forge.org/docs/user/tipsandtricks.html#using-multiple-channels)

### Conda docs

* [conda user guide](https://docs.conda.io/projects/conda/en/latest/user-guide/index.html)
* [conda cheatsheet](https://docs.conda.io/projects/conda/en/latest/user-guide/cheatsheet.html)
