
# git-intro

A demo repository with guidelines for assignment submission.

## Document for reproducibility

* Jupyter notebooks are not acceptable for assignment submission (but they're great for protoytping and in-class exercises!).
* Results must be reproducible from the original data source using the command line.
* Document for the 6-month rule.
* Document your data source and provide appropriate attribution.
* Provide clear instructions for every step in the data-processing pipeline, including data access.
* If you need to download large data files, then put them in a `data` directory and make sure to ".gitignore" it.
* If you keep a local copy of data, provide appropriate attribution and links to the original/authoritative data source.
* Apply DRY principles, e.g., if multiple files use the same code, then put reused code in a module and import it.
* While there may be more than one way to do everything, here's a recommendation for assignments...
  * Put source code in the `./src` and figures in a `./figs`
  * Use one file for each question/step, not one file for all questions/steps.
  * Use a Makefile to implement and document the entire data-processing pipeline.

## For example

Suppose the assignment asks you to reproduce the first chart in Figure 1.1 of ISLR2. The solution follows.

### Step 1: Data access

Download the CSV file from the [ISL](http://statlearning.com) website with the following command
```
make data/Wage.csv
```

* This step is automatic if you start with Q1 (below)
* This step is necessary when you first clone the repo because CSV files are .gitignored.
* If you don't have requisite software, like "make", then check out [setup.md](setup.md)
* If you're not familiar with git, check out [git.md](git.md).

### Q1: Presentation of results

Recreate the chart below with
```
make q1
```

<img src="figs/q1.png" width=500>

* The locally generated PNG is embedded in the markdown using HTML, which allows you to set the desired width.
```
<img src="figs/q1.png" width=500>
```
* You could use standard markdown syntax, but then you can't specify the width
```
![alternative to HTML](figs/q1.png)
```
Ref: [embed a PNG in markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#images).

## Share your environment (if needed)

[conda.md](conda.md) has detailed recommendations for using conda environments.
If you're using special software, or you need a specific version of a common package, then
provide instructions for using
[conda](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) 
with an `environment.yml` file.
For example, you can create an environment.yml for a repo with
```
conda env export > environment.yml
```
Ref: [Sharing an environment](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#sharing-an-environment)

### Create an environment from yml 

You can create an environment from a .yml file as follows:
```
conda env create --name myenv -f environment.yml
```
Then activate the environment with
```
conda activate myenv
```
and deactivate the environment with
```
conda deactivate myenv
```
* Ref: [Creating an environment from an enviroment.yml file](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-from-an-environment-yml-file) -- conda.io
