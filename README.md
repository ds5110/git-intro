# git-intro

Guidelines for creating a reproducible data-science pipeline.

DS 5110 assignments must be reproducible from the command-line -- Jupyter notebooks are not allowed.

This repo also has recommmendations for setting up a platform-independent development environment.

## Contents

* [README.md](README.md) (this document): guidelines for github-classroom assignment submission in DS 5110
* [setup.md](setup.md): opinionated recommendations (with references) for a development environment
* [conda.md](conda.md): cheat sheet & intro to package management (cross-platform, polyglot, open-source)
* [git.md](git.md): intro and extensive references for learning and using git on the command line
* [github-classroom.md](github-classroom.md): github-classroom workflow for instructors & TAs

## Reproducibility

* Create reproducible pipelines
  * Reproducibility is paramount -- if someone else can't reproduce your results, there's no point.
  * [Jupyter notebooks have reproducibility problems](https://www.nature.com/articles/d41586-021-01174-w),
  so they're not acceptable for assignment submission.
  * ...but they're great for prototyping, in-class exercises and publishing books,
  like [this awesome 5110 text](https://github.com/jakevdp/PythonDataScienceHandbook)!
  * Related comments from one of our part-time MSDS students who's also a corporate executive 
  and spends most of her time working in the real world...
    > I asked a Senior Engineer about Jupyter vs. command line, and why we use Notebooks and he said, "We run 
    > everything in the terminal. The only people on the team who use Notebooks are the data scientists and they 
    > aren't deploying anything to production. Frankly it's a pain in the rear to deal with their stuff when they 
    > send it over for us to scale and build into something that can be pushed to production. I wish they would stop 
    > using Notebooks but they are addicted."
    >
    > I had downloaded Github Desktop and was using that without realizing that is what I was doing, 
    > which also contributed to my confusion. I removed it.
* Document the entire pipeline
  * The **entire** pipeline must be reproducible from the command line, from data source(s) to final result.
  * Document your data source(s) and show how to access the original source(s). 
  * If necessary, provide sample/simulated data
  to enable testing/verification by others.
* Acknowledge, acknowledge, acknowledge
  * Cite all data sources and provide links to the original/authoritative sources.
  * If you get code and/or ideas from someone else, make sure you have their permission and 
  that you acknowledge their contribution.
  * Acknowledging your predecessors has a side benefit: it's a good way to avoid plagiarism. 
  (LLMs often fail to acknowledge.)
* Write clean code in a well-organized repo
  * Strive for self-documenting code (e.g., follow [PEP 8](https://peps.python.org/pep-0008/)). But that's not all...
  * Choose an appropriate layout for your project repository (see below for 5110 assignments).
  * Apply the DRY principle (Don't Repeat Yourself). 
    * For example, if multiple files use the same code, then put reused code in a module and import it.
* Use [Make](https://www.gnu.org/software/make/)
  * Make makes it particularly easy to provide clear instructions for every step in a pipeline, including data access.
  * If you're not sure why, then read: [Why Use Make?](https://bost.ocks.org/mike/make/) by the legendary Mike Bostock
  * Use the 6-month rule: document things so that, after 6 months away, you can instantly pick up where you left off.
  Side benefit: someone else with your skills should be able to reproduce your results.
* Use [.gitignore](https://git-scm.com/docs/gitignore) for big and/or private data
  * Don't add large data files or private data (e.g., passwords) to your git history! 
  * Size is important because Github has a [50 MB limit for files](https://docs.github.com/en/enterprise-cloud@latest/repositories/working-with-files/managing-large-files/about-large-files-on-github), 
  so if you commit a large file, you'll have to get it out ([not fun](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)).
  * Instead, provide instructions for downloading file(s) into `./data` and make sure 
  to `.gitignore` that directory (see [git.md](git.md)).
  * ...or you may want to look into [git-lfs](https://docs.github.com/en/repositories/working-with-files/managing-large-files/configuring-git-large-file-storage).
  * Whatever you do, provide clear instructions for downloading/acquiring the file 
  from an authoritative source and acknowledge that source.
* For assignments...
  * Put source code in `./src` and figures in `./figs`. 
  * Use one file for each question, not one file for all questions.
  * Present results in the README.md and provide instructions for reproducing them from the command-line.
  * Format your results nicely with [markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
* For projects...
  * Use miniconda and share your conda environment with a YML file (see [conda.md](conda.md)).
  * Assume the audience for your README.md has your technical skill level.
  * Use `./docs` for a public facing github-pages site, and make sure it's understandable to a general audience.
  (That's for portfolio projects, but not homework or in-class exercises.)
  * Consider adding [a license](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository) to your repo.
* For project websites and automated workflows, you have choices...
  * Plan on using [github pages](https://docs.github.com/en/pages/quickstart) to showcase your project
  to a general audience, like the C-suite for the company where you want a job.
  * There are many tools for automating workflows. They're never free for production/secure sites.
  * To automate your publicly available github-pages site, 
  I recommend [Github Actions](https://docs.github.com/en/actions). It's free for small projects.
  * If you need to scale things up and/or deploy securely: [Observable Cloud](https://observablehq.com/platform/cloud).
* If you find any mistakes in this repo, please let me know.

## Example assignment layout

Suppose the assignment asks you to reproduce the first chart in Figure 1.1 of 
[ISL](https://www.statlearning.com/). A solution follows...

### Step 1: Data access

Download the CSV file from the [ISL](http://statlearning.com) website with the following command
```
make data/Wage.csv
```

* Note: this is automatic when you type `make q1` because of the Makefile configuration.
* This step is necessary when cloning this repo because `data` is in the .gitignore file.
* If you don't have the requisite software, like `make`, then check out [setup.md](setup.md)
* If you're not familiar with git, then check out [git.md](git.md).

### Q1

The graphic below reproduces Figure 1.1 of ISL. Recreate it with the following command:
```
make q1
```

<img src="figs/q1.png" width=350>

* Note that the makefile has all the command-line commands for the entire pipeline.
* Note that the demo code imports a local module (critical for the DRY princple).
* This markdown file embeds `figs/q1.png` using vanilla HTML, which allows you to set the width:
```
<img src="figs/q1.png" width=350>
```
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
