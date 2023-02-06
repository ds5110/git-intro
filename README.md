
# git-intro

A demo repository for assignment submission.

## General guidance

#### Document for reproducibility

* Results must be reproducible -- Jupyter notebooks are not acceptable.
* Provide clear instructions for every step in the data-processing pipeline, including data access.
* If you need to download data, then put it in a `data` directory and make sure to ".gitignore" it.
* If you keep a local copy of a dataset, be sure to provide appropriate attribution and links to the source.
* Use a Makefile -- with instructions for reproducing all results from command line.
  * One nice thing about *make* is that you can edit the Makefile without having to edit this README.
  * One annoying thing about *make* is that indents in the Makefile must be tabs -- spaces don't work.
* Put source code (one file per question) in the `src` directory.
* Apply DRY principles -- if multiple questions use the same code, then put reused code in a module and import it.

For example:

## Step 1: Download the data

Download the CSV file from the [ISL](http://statlearning.com) website with the following command

```
make data
```

* You need to do this when you first clone the repo because CSV files are .gitignored.
* If you don't have requisite software, check out [install.md](http://github.com/ds5010/spring-2023/install.md).
* If you're not familiar with git, check out [git.md](http://github.com/ds5010/spring-2023/git.md).

## Step 2: 

Recreate the chart below with
```
make q1
```

This is the first chart in Figure 1.1 of ISLR2.
Here the locally generated PNG is embedded in the markdown using HTML, which allows you to set the desired with.

<img src="figs/q1.png" width=500>

This next image demonstrates another way to embed a PNG in markdown.

![another image](figs/q1.png)

## Conda environments

If you're using special software that may need a separate download, then use conda and provide instructions
and a `requirements.txt` or an `environment.yml` (they require slightly different syntax).
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
