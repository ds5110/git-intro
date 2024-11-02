# git-intro

This README has guidelines for creating a reproducible data-science pipeline.

DS 5110 assignments must be reproducible from the command-line -- Jupyter notebooks are not allowed.

Other documents in this repo have recommmendations for [setting up a development environment](setup.md) that works on all platforms.

## Reproducibility

* Create reproducible pipelines
  * Reproducibility is paramount -- if someone else can't reproduce your results, there's no point.
  * [Jupyter notebooks have reproducibility problems](https://www.nature.com/articles/d41586-021-01174-w),
  so they're not acceptable for assignment submission.
  * ...but they're great for prototyping, in-class exercises and publishing books, like 
  [this one](https://github.com/jakevdp/PythonDataScienceHandbook)!
  * Related comments from one of our part-time MSDS students who's also a corporate executive 
  and spends most of her time working the real world...
    > I asked a Senior Engineer about Jupyter vs. command line, and why we use Notebooks and he said, "We run 
    > everything in the terminal. The only people on the team who use Notebooks are the data scientists and they 
    > aren't deploying anything to production. Frankly it's a pain in the rear to deal with their stuff when they 
    > send it over for us to scale and build into something that can be pushed to production. I wish they would stop 
    > using Notebooks but they are addicted.
    >
    > I had downloaded Github Desktop and was using that without realizing that is what I was doing, 
    > which also contributed to my confusion. I removed it.
* Document the entire data-processing pipeline
  * The entire pipeline must be reproducible from the command line, starting from the original data source(s).
  * Document your data source(s) and show how to access the original source(s).
* Use Make
  * Make makes it particularly easy to provide clear instructions for every step in the pipeline, including data access.
  * If you're not sure why, then read: [Why Use Make?](https://bost.ocks.org/mike/make/) by the legendary Mike Bostock
  * Use the 6-month rule: document things to that, after 6 months away, you can instantly pick up where you left off.
  * There are many tools for automating workflows. With some notable exceptions, they're often proprietary. For automated workflows, I recommend [Github Actions](https://docs.github.com/en/actions).
* Acknowledge
  * Cite original sources and and provide links to authoritative references.
  * Acknowledging your predecessors has a side benefit: it's a good way to avoid plagiarism.
* Write clean code
  * Strive for self-documenting code
  * Follow [PEP 8](https://peps.python.org/pep-0008/)
  * Apply the DRY principle (Don't Repeat Yourself)
    * For example, if multiple files use the same code, then put reused code in a module and import it.
* For assignments...
  * Put source code in `./src` and figures in `./figs`. 
  * Use one file for each question, not one file for all questions.
  * Use `./docs` for a github-pages site when appropriate (e.g., projects, but not for other assignments).
* If you need to download large data files...
  * Don't put the data into your git history! Github has a file-size limit of 50 MB.
  * Instead, download the file(s) into `./data` and make sure to `.gitignore` that directory (see [git.md](git.md)).
  * If you keep a local copy of data in your repo, provide clear instructions for accessing the file from the source.
  * Acknowledge the data source(s) and provide links to the original/authoritative source.
* For projects
  * Use miniconda and share your conda environment with a YML file (see [conda.md](conda.md))
  * Consider adding [a license](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository) to your repo.
* If you're not sure how to set up your development environment, see [setup.md](setup.md)

## Example assignment layout

Suppose the assignment asks you to reproduce the first chart in Figure 1.1 of ISLR. A solution follows.

### Step 1: Data access

Download the CSV file from the [ISL](http://statlearning.com) website with the following command
```
make data/Wage.csv
```

* Note: this is automatic when you type `make q1` because of the Makefile configuration.
* This step is necessary when cloning the repo because `data` is in the .gitignore file.
* If you don't have the requisite software, like `make`, then check out [setup.md](setup.md)
* If you're not familiar with git, then check out [git.md](git.md).

### Q1

The graphic below reproduces Figure 1.1 of ISL. Recreate it with the following command:
```
make q1
```

<img src="figs/q1.png" width=350>

* Note that the demo code imports a module.
* This markdown file embeds `figs/q1.png` using HTML:
```
<img src="figs/q1.png" width=350>
```
* With HTML, you can set the desired width.
* If you're okay with the default width, you can use standard markdown syntax:
```
![alternative to HTML](figs/q1.png)
```
Refs:
  * [github flavored markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
  * [gfm spec](https://github.github.com/gfm/)
  * [embed a PNG in markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#images)
  * [math in markdown](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions)

$$
\int e^x dx = e^x + \mathrm{const}
$$
