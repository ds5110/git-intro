
# git-intro

A demo repository with guidelines for assignment submission.

## Reproducibility

* Reproducibility is paramount -- if someone else can't reproduce your results, there's no point.
  * [Jupyter notebooks have reproducibility problems](https://www.nature.com/articles/d41586-021-01174-w),
so they're are not acceptable for assignment submission.
  * ...but they're great for protoytping, in-class exercises and publishing!
* Document the entire data-processing pipeline
  * The entire pipeline must be reproducible on the command line, starting with the original data source.
  * Document your data source(s) and show how to access the original source(s) whenever possible.
* Use Make
  * If you're not sure why, then read: [Why Use Make](https://bost.ocks.org/mike/make/) by the legendary Mike Bostock
  * Provide clear instructions for every step in the data-processing pipeline, including data access.
  * Document for the 6-month rule: after 6 months away, you can instantly pick up where you left off.
* Acknowlgement is paramount
  * Acknowledge your predecessors (a side benefit: it's a good way to avoid plagiarism).
  * Cite your references, for many of the same reasons.
* If you need to download large data files, then put them in a `data` directory and make sure to ".gitignore" it.
  * If you keep a local copy of data in your repo, provide appropriate attribution.
  * And provide links to the original/authoritative data source.
* Apply the DRY principle (Don't Repeat Yourself)
  * For example, if multiple files use the same code, then put reused code in a module and import it.
* For assignments...
  * Put source code in the `./src` and figures in a `./figs`
  * Use one file for each question/step, not one file for all questions/steps.
  * Make your code self documenting as much as possible.
  * Follow [PEP 8](https://peps.python.org/pep-0008/)
* For projects, consider adding [a license](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository) to your repo, but not for assignments.

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

<img src="figs/q1.png" width=350>

* This markdown file embeds `figs/q1.png` using HTML:
```
<img src="figs/q1.png" width=350>
```
* With HTML, you can set the desired width.
* If you're okay with the default width, you can use standard markdown syntax:
```
![alternative to HTML](figs/q1.png)
```
Ref: [embed a PNG in markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#images).

## Share your environment (if needed)

If you're using special software or you need a specific version of a common package, 
then provide a `yml` file.
You can create one from your current environment as follows...
```
conda env export > environment.yml
```
Ref: [Sharing an environment](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html#sharing-an-environment)

* If you're new to `conda`, then check out [conda.md](conda.md) for detailed recommendations.
* Note: the environment.yml file in this repo also has instructions for installing make and git.
* And the Makefile has instructions for installing microconda.
