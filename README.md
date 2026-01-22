# git-intro

Recommendations for data science development environment

* Command line reproducibility (required)
* GitHub for assignments & projects (required)
* Colab & Jupyter (okay for prototyping & pedagogy, not for assignments & projects)

## Contents

* [README.md](README.md) (this document): guidelines for github-classroom assignment submission
* [setup.md](setup.md): opinionated recommendations (with references) for a development environment
* [conda.md](conda.md): intro & cheat sheet for package management (cross-platform, polyglot, open-source)
* [git.md](git.md): intro and references for command-line git
* [github-classroom.md](github-classroom.md): github-classroom workflow (for instructors & TAs)
* Additional resources from an awesome TA: [Useful for DS 5110](https://github.com/charVANder/Useful-for-DS5110)

## Reproducibility

* Create reproducible repos
  * Reproducibility is paramount -- if someone else can't reproduce your results, there's no point.
    * Computational notebooks (Jupyter, RStudio, etc.) have well-known reproducibility problems,
    > they can be confusing and foster poor coding practices. And they are difficult to share, collaborate on 
    and reproduce. A 2019 study found that just 24% of 863,878 publicly available Jupyter notebooks on GitHub 
    could be successfully re-executed, and only 4% produced the same results. Reference: https://www.nature.com/articles/d41586-021-01174-w
    * For that reason, Jupyter notebooks are not allowed in this class for assignments or projects.
    * ...but they're great for prototyping, in-class exercises and publishing books,
    like [this awesome data-science text](https://github.com/jakevdp/PythonDataScienceHandbook)!
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
* Document your repository
  * Everything must be reproducible from the command line -- provide clear instructions.
  * Document authoritative data source(s), and show how to access the data from those sources.
  * If necessary, provide sample/simulated data cleansed of PII to enable testing/verification.
* Acknowledge authoritative sources
  * Cite all data sources and provide links to the original/authoritative sources whenever possible.
  * If you get code and/or ideas from someone else, make sure you have their permission and 
  that you acknowledge their contribution.
  * Acknowledging your predecessors has a side benefit: it's a good way to avoid plagiarism. 
  Note: in addition to hallucinating (lying?), LLMs often fail to acknowledge.
* Write clean code in a well-organized repo
  * Strive for self-documenting code (e.g., follow [PEP 8](https://peps.python.org/pep-0008/) in Python). But that's not all...
  * Choose an appropriate layout for your project repository (see below for assignments in this class).
  * Apply the DRY principle (Don't Repeat Yourself). 
  For example, if multiple files use the same code, then put reused code in a module and import it.
* Use [.gitignore](https://git-scm.com/docs/gitignore) for big and/or private data
  * Don't add large data files or private data (e.g., passwords) to your git history! 
  * Instead, provide instructions for downloading file(s) into `./data` and make sure 
  to `.gitignore` that directory or the files in it (see [git.md](git.md)).
  Or you may want to look into [git-lfs](https://docs.github.com/en/repositories/working-with-files/managing-large-files/configuring-git-large-file-storage).
  * Size is important because Github has a [50 MB limit for files](https://docs.github.com/en/enterprise-cloud@latest/repositories/working-with-files/managing-large-files/about-large-files-on-github).
  Be warned: if you accidentally commit a large and/or private file, you'll have to get it out 
  ([not fun](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)).

## For assignments and projects

* Use [Make](https://www.gnu.org/software/make/)
  * Make makes it particularly easy to provide clear instructions for every step in a pipeline, including data access.
  * If you're not sure why, then read: [Why Use Make?](https://bost.ocks.org/mike/make/) by the legendary Mike Bostock
  * Use the 6-month rule: document things so that, after 6 months away, you can instantly pick up where you left off.
  Side benefit: someone else with your skills should be able to reproduce your results.
* For assignments...
  * Put source code in `./src` and figures in `./figs`. 
  * Use one file for each question, not one file for all questions.
  * Present results in the README.md and provide instructions for reproducing them from the command-line.
  * Format your results nicely with [markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax).
* For projects...
  * Use miniforge and share your conda environment with a YML file (see [conda.md](conda.md)).
  * Assume the audience for your README.md has your technical skill level.
  * Use `./docs` for a public facing [github pages](https://docs.github.com/en/pages) site, 
  and make sure it's understandable to a general audience.
  (That's for portfolio projects, but not homework or in-class exercises.)
  * Consider adding [a license](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository) to your repo.
* For project websites and automated workflows, you have choices...
  * Plan on using [github pages](https://docs.github.com/en/pages/quickstart) to showcase your project
  to a general audience, like the C-suite for the company where you want a job. (Note: While I highly
  recommend github pages, I don't like Jekyll. Instead, I highly recommend 
  [Observable Framework](https://observablehq.com/framework/deploying#deploying) for deploying
  a multi-page site with interactive visualizations.)
  * There are many tools for automating workflows. They're never free for production/secure sites.
  To automate the workflow for your publicly available github-pages site, 
  I recommend [github actions](https://docs.github.com/en/actions). It's free for small projects.

## Example assignment solution

Suppose Question 1 of the assignment asks you to reproduce the first chart in Figure 1.1 of 
[ISL](https://www.statlearning.com/). Here's an acceptable solution...

### Step 1: Data access

Download the CSV file that's used in Figure 1.1 of [ISL](http://statlearning.com) with the following command
```
make data/Wage.csv
```

* Note: this is automatic when you type `make q1` because of the Makefile configuration.
* This step is necessary when cloning this repo because `data` is in the .gitignore file.
* If you don't have the requisite software, like `make`, then check out [setup.md](setup.md)
* If you're not familiar with git, then check out [git.md](git.md).

### Question 1

The graphic below reproduces Figure 1.1 of ISL. Recreate it with the following command:
```
make q1
```

<img src="figs/q1.png" width=350>

* Note that the makefile has all the command-line commands for the entire pipeline.
* Note that the demo code imports a local module (part of DRY).
* This markdown file embeds `figs/q1.png` using vanilla HTML, which allows you to set the width:
```
<img src="figs/q1.png" width=350>
```
* If you're okay with the default width, you can use standard markdown syntax:
```
![alternative to HTML](figs/q1.png)
```
**Refs:**

* [github flavored markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
* [gfm spec](https://github.github.com/gfm/)
* [embed a PNG in markdown](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#images)
* [math in markdown](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions)

$$
\int e^x dx = e^x + \mathrm{const}
$$
