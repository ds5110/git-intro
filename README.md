
# git-intro

A demo repository for assignment submission

## updating a repo

First clone it.

```
git clone <url from the github.com GUI>
```

Then work on stuff locally and update it.

```
git add .
git commit -m "some informative message about what I did"
git push origin main
```

Add a `.gitignore` file to keep things from getting pushed to github.

### Reproducibility

Download the source CSV from the [ISLR2](http://statlearning.com) website with the following command

```
make csv
```

* If you make a local copy of a dataset, be sure to provide appropriate attribution.
* Be very clear about anything you did to process the data and reproduce reproduce all results.
* One nice thing about *make* is that you can edit the Makefile with having to edit this README.
* One annoying thing about *make* is that indents in the Makefile must be tabs -- spaces don't work.
* If you don't have `make` then you're probably using Windows. If so, consider [Cygwin](https://www.cygwin.com/).

### Presenting results

Here's the first chart in Figure 1.1 of ISLR2.

<img src="figs/q1.png" width=500>

This demonstrates another way to embed a PNG...

![another image](figs/q1.png)

Recreate this chart with
```
make app
```

## requirements

I created the requirements.txt by first running this command

```
conda list -e > requirements.txt
```

Then I edited it to include only the modules that I imported in my code, along with the python version.
```
conda list -e > requirements.txt
```

You can use the requirements.txt to create a conda environment and run code as follows:
```
conda create --name demo --file requirements.txt
conda activate demo
make app
conda deactivate
```

### github pages

* [github pages](https://pages.github.com/)
* Activate a github-pages site for a repository in Settings > Pages
* I do *NOT* recommend using Jekyll for this class.
