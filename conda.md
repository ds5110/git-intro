# conda

Opinionated recommendations for setting up and using Conda.

Conda is a system-level binary package and environment manager that runs on all 
major operating systems and platforms.

You can get conda from [Anaconda](https://www.anaconda.com/docs/getting-started/getting-started) 
or [miniconda](https://www.anaconda.com/docs/getting-started/miniconda/main), so you may already have it.
I no longer recommend them because I recommend the [conda-forge](https://conda-forge.org/) "channel", 
which has some scientific computing software that conflicts with Anaconda and miniconda's "defaults" channel.
You don't want to mix channels.
If you do, thenb you risk mysterious errors or dependency resolution problems that can be hard to debug
("impossible" might be more appropriate).
That said, if you're already using conda and it works for you, then you may not need this document.

## First things first

Recommendations below assume that you're using Linux, MacOS or WSL. If not, then see [setup.md](setup.md).

## miniforge

* Download the conda-forge installer -- https://conda-forge.org/download/
  * Install as directed (I used `bash Miniforge3-$(uname)-$(uname -m).sh`
  * It includes Python 3.x and a minimal distribution of Python friends.
* "Miniforge is the preferred conda-forge installer"
* If you already have conda, then you may want to [transition away from defaults](see: https://conda-forge.org/docs/user/transitioning_from_defaults/)

#### Why miniforge?

* There's been a growing division between Anaconda (proprietary) and 
  [Conda-Forge](https://conda-forge.org/) (open source).
  They are 2 different software "distributions" that use "conda".
  [Conda](https://docs.conda.io/en/latest/) is an environment and package manager for any language (not just Python).
* The minimal installer for Anaconda is miniconda. The open counterpart to miniconda is miniforge.
* Channel incompatibilies developed in 2024. Since incompatibilities are relatively recent, 
  you won't see them discussed in recent data science books that recommend miniconda, such as...
  * Jake VanderPlas, the author of 
  [Python Data Science Handbook](https://github.com/jakevdp/PythonDataScienceHandbook)
  * Wes McKinney lead developer of Pandas and author of 
  [Python for Data Analysis, 3rd Ed (2022)](https://wesmckinney.com)

#### What about pip?

* And then there's pip!
  * Jake VanderPlas talks about pip & conda in an old (2016) but still interesting and relevant blog post:
  [Conda myths and misconceptions](https://jakevdp.github.io/blog/2016/08/25/conda-myths-and-misconceptions/)
* Avoid pip if you can. And if you can't, then at least be careful about it.
  * See: [Using pip in an environment](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#using-pip-in-an-environment) -- conda.io
  * The link has best practices for using conda and pip

## Use conda environments

* [conda environments](https://docs.conda.io/projects/conda/en/stable/glossary.html#conda-environment) -- docs.conda.io

### Channels

Conda installs from [channels](https://docs.conda.io/projects/conda/en/stable/user-guide/concepts/channels.html)

```
conda config --show channels              # lists channel(s)
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

* [Remove an environment](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#removing-an-environment) -- conda.io

### YML files

Use YML files to [manage](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html),
and [share](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#sharing-an-environment) your conda environments.
I created an environment.yml for this repo by first running this command
```
conda env export > environment.yml
```
Then I used the `--from-history` option to get hints on editing/trimming the file into something nice and short.
```
conda env export --from-history
```
Here's my latest [environment.yml](environment.yml).

### Create an environment from a yml file

Create an environment called "myenv" from a YML file:
```
conda env create --name myenv -f environment.yml
```
Remove the "myenv" environment with:
```
conda env remove --name myenv
```
* Ref: [Creating an environment from an enviroment.yml file](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-from-an-environment-yml-file) -- conda.io

### Web dev

For web development (e.g., [Observable Framework](https://observablehq.com/framework/)), see [node.md](node.md)

### Geospatial

* Geospatial software has dependencies that can cause problems.
  It can get especially bad if you mix package managers!
* see: [geopandas install](https://geopandas.org/en/stable/getting_started/install.html)
* see also: [using multiple channels](https://conda-forge.org/docs/user/tipsandtricks.html#using-multiple-channels)

### Conda docs

* [conda docs](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
* [conda cheatsheet](https://docs.conda.io/projects/conda/en/latest/_downloads/843d9e0198f2a193a3484886fa28163c/conda-cheatsheet.pdf)
