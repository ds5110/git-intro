
# git-intro

A demo repository for assignment submission.

## Clone a repo

```
git clone <URL from the github.com GUI>
```

## Update a repo

* Usually a good idea to sync your repo before making changes.
```
git pull
```
* Remember to keep big files and directories out of version control with `.gitignore`
* Commit your changes locally and push them back to the origin on github:
```
git add .
git commit -m "some informative message about what you did"
git push origin main
```

## Document for reproducibility

Results must be reproducible. Provide clear instructions for every step in the data-processing pipeline, including data access. For example:

* Step 1: Download the CSV file from the [ISL](http://statlearning.com) website with the following command

```
make data
```

* You need to do this when you first clone the repo because CSV files are .gitignored.
* Note: If you keep a local copy of a dataset, be sure to provide appropriate attribution.
* Be very clear about anything you did to process the data. 
* This repo uses "make"
  * One nice thing about *make* is that you can edit the Makefile without having to edit this README.
  * One annoying thing about *make* is that indents in the Makefile must be tabs -- spaces don't work.
* If you're using Windows, then consider [WSL](https://learn.microsoft.com/en-us/windows/wsl/install).
  * In that case, make will be installed with the Linux distribution
* Step 2: Recreate the chart below with
```
make q1
```

Here's the first chart in Figure 1.1 of ISLR2, embedded with HTML.

<img src="figs/q1.png" width=500>

This demonstrates another way to embed a PNG...

![another image](figs/q1.png)

## Saving an environment

You can create a `requirements.txt` or an `environment.yml`; they use slightly different syntax with conda.
I created an environment.yml by first running this command
```
conda list -e > environment.yml
```
Then I used the following for hints on editing/trimming the file to include only the critical modules and version numbers.
```
conda env export --from-history
```
And I settled on this for my environment.yml...
```
channels:
  - conda-forge
  - defaults
dependencies:
  - seaborn=0.11.2
  - pyqt
```

## Creating an environment

You can create an environment from a .yml file as follows:
```
conda env create --name myenv -f environment.yml
```
Or create it from a requirements.txt as follows:
```
conda create --name myenv --file requirements.txt
```
Remove an environment with:
```
conda env remove --name myenv
```
* Ref: [Creating an environment from an enviroment.yml file](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-from-an-environment-yml-file) -- conda.io
