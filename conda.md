# conda

Instructions for setting up and using conda environments

Conda is an open-source package management system and environment management system 
that runs on all platforms. For Windows users, I recommend first setting up
[WSL](https://learn.microsoft.com/en-us/windows/wsl/about) (see [setup.md](setup.md)).

## 1. Install miniconda

[Miniconda](https://docs.conda.io/projects/conda/en/stable/glossary.html#miniconda) is a free 
installer for conda.
It includes a minimal distribution of Python and friends.

* I recommend the [command-line install](https://docs.conda.io/projects/miniconda/en/latest/)
  * Main [miniconda install instructions](https://docs.conda.io/projects/conda/en/stable/user-guide/install/index.html)
  * Note: you can install miniconda or anaconda, the references below describe the differences. I prefer miniconda.
    * anaconda includes conda, but not the other way around -- anaconda is a distribution
* [conda documentation](https://docs.conda.io/projects/conda/en/stable/)
* Note: I created a shell script to install miniconda on my Mac (24 Nov 2023)...
  ```
  bash my_install.sh
  ```

### Why miniconda?

* Recommended by Jake VanderPlas, the author of [Python Data Science Handbook (PDS)](https://github.com/jakevdp/PythonDataScienceHandbook/blob/master/notebooks/00.00-Preface.ipynb)
  * [This link](https://jakevdp.github.io/PythonDataScienceHandbook/00.00-preface.html#Installation-Considerations) points to a Jupyter notebook on github, where you'll see a recommendation to use miniconda.
  * It's the first edition of the book, which was updated in 2022.  The more recent edition makes the same recommendation.
* Recommended by Wes McKinney lead developer of Pandas and author or [Python for Data Analysis, 3rd Ed (2022)](https://wesmckinney.com)
  * Section 1.4 of [Python for Data Analysis, 3rd Ed (2022)](https://wesmckinney.com/book/preliminaries.html#installation_and_setup) has the recommendation
* [Conda myths and misconceptions](https://jakevdp.github.io/blog/2016/08/25/conda-myths-and-misconceptions/)
  * This blog post by Jake VanderPlas comparing pip & conda is a bit old (2016) but still interesting/relevant
* Don't use pip. Or, at least, be careful about it.
  * See: [Using pip in an environment](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#using-pip-in-an-environment) -- conda.io
  * The link has best practices for using conda and pip
  * Another discussion of [conda and pip](https://www.anaconda.com/blog/understanding-conda-and-pip) -- anaconda.com

## 2. Install some basics

If you don't have them already, you can install `make` and `git` with conda...
```
conda install -c conda-forge make
conda install -c conda-forge git
```

## 3. Use conda environments

* [conda environments](https://docs.conda.io/projects/conda/en/stable/glossary.html#conda-environment) -- docs.conda.io

### Channels

Conda installs from [channels](https://docs.conda.io/projects/conda/en/stable/user-guide/concepts/channels.html)

* In general, I recommend the open source "conda-forge" channel.
* conda-forge is not the default channel, but you can make it the default. 
* It's a good idea not to mix channels, especially with geospatial software (more info below).
```
conda config --show channels              # lists default channel(s)
conda config --add channels conda-forge   # set conda-forge as the default channel
```

### Create and activate a conda environment

Create an environment with a specific version of python
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

### Install libraries in an environment

You can use conda to create multiple environments with various installed libraries.

* create a new environment called "myenv" and install the latest scikit-learn and friends from conda-forge
```
conda create --name myenv
conda activate myenv
conda install -c conda-forge scikit-learn
conda install -c conda-forge seaborn
conda install -c conda-forge python
conda install -c conda-forge pandas
conda install -c conda-forge matplotlib
conda install -c conda-forge make
```

* deactivate an environment
```
conda deactivate
```

* activate the "myenv" environment
```
conda activate myenv
```

* list all environments
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
I settled on this for my environment.yml...
```
channels:
  - conda-forge
  - defaults
dependencies:
  - seaborn=0.11.2
  - pyqt
```
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

### geospatial

* geospatial software has dependencies that can cause problems if you mix channels
* see: [geopandas install](https://geopandas.org/en/stable/getting_started/install.html)
* see also: [using multiple channels](https://conda-forge.org/docs/user/tipsandtricks.html#using-multiple-channels)
* I use conda-forge, and this is an ENV.yml created for my "geo" environment...
```
$ conda env export --from-history>ENV.yml
$ cat ENV.yml
name: geo
channels:
  - conda-forge
  - defaults
dependencies:
  - python=3.10
  - conda==22.11.1
  - setuptools
  - pip
  - wheel
  - conda-content-trust
  - python.app
  - geopandas
  - contextily
  - pyqt
prefix: /Users/pbogden/miniconda3
```

* create a new environment called "newenv" from requirements.txt
```
conda create --name newenv --file requirements.txt --channel conda-forge
conda activate newenv
```

* [conda docs](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)
* [conda cheatsheet](https://docs.conda.io/projects/conda/en/latest/_downloads/843d9e0198f2a193a3484886fa28163c/conda-cheatsheet.pdf)
