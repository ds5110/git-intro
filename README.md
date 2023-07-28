
# git-intro

A demo repository with guidelines for assignment submission.

## Reproducibility

* Reproducibility is paramount -- if someone else can't reproduce your results, there's no point.
* [Jupyter notebooks have reproducibility problems](https://www.nature.com/articles/d41586-021-01174-w)
so they're are not acceptable for assignment submission.
* ...but they're great for protoytping and in-class exercises!
* The entire pipeline must be reproducible on the command line, starting with the original data source.
* Document your data source(s) and provide appropriate and generous attribution for your results.
* Consider adding [a license](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository) for your repo.
* Document for the 6-month rule, i.e., when you come back in 6 months you should be able to pick up where you left off.
* Provide clear instructions for every step in the data-processing pipeline, including data access.
* If you need to download large data files, then put them in a `data` directory and make sure to ".gitignore" it.
* If you keep a local copy of data in your data, provide appropriate attribution and links to the original/authoritative data source.
* Apply DRY (Don't Repeat Yourself), e.g., if multiple files use the same code, then put reused code in a module and import it.
* While there may be more than one way to do everything, here's a recommendation for assignments...
  * Put source code in the `./src` and figures in a `./figs`
  * Use one file for each question/step, not one file for all questions/steps.
  * Make your code self documenting as much as possible.
* Use [make](https://bost.ocks.org/mike/make/) and Makefiles for the entire data-processing pipeline.

## For example

Suppose the assignment asks you to reproduce the first chart in Figure 1.1 of ISLR. The solution follows.

### Step 1: Data access

Download the CSV file from the [ISL](http://statlearning.com) website with the following command
```
make data/Wage.csv
```

* Note: this step is automatic if you start with Q1 (below) because of the way the Makefile is set up.
* This step is necessary when cloning the repo because CSV files are .gitignored.
* If you don't have requisite software, like "make", then check out [setup.md](setup.md)
* If you're not familiar with git, check out [git.md](git.md).

### Q1: Presentation of results

Recreate the chart below with
```
make q1
```

<img src="figs/q1.png" width=500>

* This markdown file embeds `figs/q1.png` in the markdown using HTML, which allows you to set the desired width.
```
<img src="figs/q1.png" width=500>
```
* If you're okay with the default width, you can use standard markdown syntax:
```
![alternative to HTML](figs/q1.png)
```
Ref: [embed a PNG in markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#images).

## Share your environment (if needed)

If you're new to `conda`, then check out [conda.md](conda.md) for detailed recommendations rearding conda environments.
If you're using special software or you need a specific version of a common package, 
then provide a `yml` file.
You can create one from your current environment as follows...
```
conda env export > environment.yml
```
Ref: [Sharing an environment](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#sharing-an-environment)

You can create a fresh environment from the "envionment.yml" file as follows:
```
conda env create --name myenv -f environment.yml
```
Activate the environment with
```
conda activate myenv
```
and deactivate it with
```
conda deactivate myenv
```
Note: the environment.yml file in this repo also has instructions for installing make and git.

And the Makefile has instructions for installing microconda.

* Ref: [Creating an environment from an enviroment.yml file](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#creating-an-environment-from-an-environment-yml-file) -- conda.io
