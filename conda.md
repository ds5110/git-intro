# conda

Recommendations for setting up and using Conda.

Conda is a system-level binary package and environment manager that runs on all 
major operating systems and platforms. 

I recommend [Miniconda](https://docs.conda.io/projects/conda/en/stable/glossary.html#miniconda),
which is a free installer for Conda.
Note: We'll do everything with open source software.
There's no need to pay any licensing fees.
For this and other reasons, 
I recommend the [conda-forge](https://conda-forge.org/docs/) distribution.
I do not recommend Anaconda.

Note: There's a Conda alternative called Mamba, which is recommended by some folks
(e.g., Berkeley: [Conda and Mamba](https://statistics.berkeley.edu/computing/conda)). 
As of May 2025, [Northeastern's Research Computing still recommends Conda](https://rc-docs.northeastern.edu/en/latest/software/packagemanagers/conda.html), so I will too, at least for now.

## First things first

Recommendations below assume that you're using Linux, 
macOS (basically Linux under the hood) or WSL (Windows Subsystem for Linux).

Windows users, before anything else: I highly recommend that you either buy a Mac or set up 
[WSL](https://learn.microsoft.com/en-us/windows/wsl/about) (see [setup.md](setup.md)).

## 1. Install miniconda

[Miniconda](https://docs.conda.io/projects/conda/en/stable/glossary.html#miniconda) 
is a free installer for Conda.
It includes Python 3.x and a minimal distribution of Python friends.
* I recommend the [command-line (terminal) install](https://www.anaconda.com/docs/getting-started/miniconda/install)
  * Windows users: if you're using WSL, then install the Linux version from the WSL terminal!!
* [Conda documentation](https://docs.conda.io/projects/conda/en/stable/)
  * Although I do not recommend Anaconda, you can use it if you already have it.
  * In a nutshell: Anaconda includes Conda and many other things. And it's missing some things.

#### Why miniconda?

* Recommended by Jake VanderPlas, the author of [Python Data Science Handbook](https://github.com/jakevdp/PythonDataScienceHandbook/blob/master/notebooks/00.00-Preface.ipynb)
  * Jake's [installation considerations](https://jakevdp.github.io/PythonDataScienceHandbook/00.00-preface.html#Installation-Considerations)
* Recommended by Wes McKinney lead developer of Pandas and author or [Python for Data Analysis, 3rd Ed (2022)](https://wesmckinney.com)
  * Section 1.4 of [Python for Data Analysis, 3rd Ed (2022)](https://wesmckinney.com/book/preliminaries.html#installation_and_setup) has the recommendation
* [Conda myths and misconceptions](https://jakevdp.github.io/blog/2016/08/25/conda-myths-and-misconceptions/)
  * This blog post by Jake VanderPlas comparing pip & conda is a bit old (2016) but still interesting/relevant
* Don't use pip. Or, at least, be careful about it.
  * See: [Using pip in an environment](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#using-pip-in-an-environment) -- conda.io
  * The link has best practices for using conda and pip
  * Another discussion of [conda and pip](https://www.anaconda.com/blog/understanding-conda-and-pip) -- anaconda.com

## 2. Install some basics

If you don't have it already [install `make`](https://anaconda.org/conda-forge/make/) from
the conda-forge channel (more on channels below)...
```
conda install conda-forge::make
```

## 3. Use conda environments

* [conda environments](https://docs.conda.io/projects/conda/en/stable/glossary.html#conda-environment) -- docs.conda.io

### Channels

Conda installs from [channels](https://docs.conda.io/projects/conda/en/stable/user-guide/concepts/channels.html)

* When you install miniconda3, it sets a "default" channel called "default".
* I recommend the "conda-forge" channel, which is open source. 
* You can set "conda-forge" as the default channel, as I've done.
* Anaconda is a distribution that has issues, which you can read about elsewhere. I don't use it.
* Beware of mixing channels, especially with geospatial software (more on that below).
```
conda config --show channels              # lists default channel(s)
conda config --add channels conda-forge   # set conda-forge as the default channel
```

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

* [Manage environments](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) -- conda.io
  * [Creating an environment with commands](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-with-commands)
* vscode: 
  * Warning: as vscode is getting better, this recommendation for configuring vscode may now be out of date.
  * You can manually specify the path to the conda executable to use for activation 
  (version 4.4+). To do so, open the Command Palette (⇧⌘P).
  * You get a dropdown menu and you can pick the conda environment of your choice
  * On a mac, the detault was in `/usr/bin`, so you need to select the miniconda version

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

* [Remove an environment](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#removing-an-environment) -- conda.io

### Share an environment

If you're using special software, or you need a specific version, then use 
[conda](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) 
and provide instructions with an `environment.yml` file.
I created an environment.yml for this repo by first running this command
```
conda env export > environment.yml
```
Then I used the `--from-history` option to get hints on editing/trimming the file into something nice and short.
```
conda env export --from-history
```
Here's my latest [environment.yml](environment.yml).

Ref: [Sharing an environment](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#sharing-an-environment)

### Create an environment from a yml file

You can create an environment from a .yml file as follows:
```
conda env create --name myenv -f environment.yml
```
Remove an environment with:
```
conda env remove --name myenv
```
* Ref: [Creating an environment from an enviroment.yml file](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-from-an-environment-yml-file) -- conda.io

### Web dev

To use [Framework](https://observablehq.com/framework/), and for web development in general, 
you need [Node.js](https://nodejs.org/en).
You can install Node.js from from nodejs.org, and it's also available from conda-forge.

My [framework.yml](framework.yml) has several things for web development, including Node.js,
Flask (a Python back-end framework) and yarn (an faster npm alternative).
```
conda env create -f framework.yml
```

then activate the environment
```
conda activate framework
```

then [install Observable Framework](https://observablehq.com/framework/) with
```
npx @observablehq/framework@latest create
```

### Geospatial

* Geospatial software has dependencies that can cause problems.
  It can get especially bad if you mix package managers!
* see: [geopandas install](https://geopandas.org/en/stable/getting_started/install.html)
* see also: [using multiple channels](https://conda-forge.org/docs/user/tipsandtricks.html#using-multiple-channels)

### Conda docs

* [conda docs](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
* [conda cheatsheet](https://docs.conda.io/projects/conda/en/latest/_downloads/843d9e0198f2a193a3484886fa28163c/conda-cheatsheet.pdf)
