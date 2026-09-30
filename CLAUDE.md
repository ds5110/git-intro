# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a teaching repository for DS 5110 demonstrating best practices for reproducible data science pipelines. It serves as a template for students to structure their assignments using command-line workflows with Make, Git, and Python.

## Key Principles

- **Command-line reproducibility**: All workflows must be executable from the command line. Jupyter notebooks are not allowed for assignments or projects due to reproducibility issues (fine for prototyping).
- **Make-based pipelines**: Use Make to orchestrate all data processing, analysis, and visualization steps.
- **Modular code organization**: Source code lives in `./src`, figures in `./figs`, data in `./data` (gitignored).
- **One file per question**: For assignments, each question gets its own Python file (e.g., `src/q1.py`, `src/q2.py`).
- **DRY principle**: Shared code belongs in modules that get imported (see `src/readit.py` as example).

## Documentation

Most of the repo is course documentation for students (DS 5110 and a web dev course):

- `README.md`: reproducibility and assignment-submission guidelines, with the example pipeline
- `setup.md`: development environment (Unix-like shell/WSL, conda, vscode, make, git, Node)
- `git.md`, `conda.md`, `node.md`: command-line git, conda (miniforge), and Node/npm
- `llm-policy.md`: policy for using LLMs and coding agents
- `colab.md`: Google Colab notes (prototyping only)
- `classroom50.md`: Classroom50 cheatsheet for instructors & TAs (replaced GitHub Classroom in 2026)

Conventions for editing the docs:

- Write cheatsheets that link to authoritative docs; don't duplicate step-by-step instructions that will drift.
- Verify time-sensitive claims (Node LTS dates, GitHub Action and nvm versions, tool behavior) against current sources before writing them, and check links.
- Keep the author's first-person, opinionated voice and lowercase "github" style.
- Course specifics: miniforge/conda-forge only (avoid pip); students use their northeastern.edu email with their existing github account; assignments go through Classroom50 with repo links submitted in Canvas; the web dev course uses a JS front end with a FastAPI back end.
- This repo is the author's personal notes: "update" commit messages are intentional, so don't suggest changing them.

## Development Commands

### Running the example pipeline
```bash
make q1                  # Creates figs/q1.png using data/Wage.csv
make data/Wage.csv       # Downloads the ISL Wage dataset (runs automatically via q1 target)
make clean               # Removes downloaded data (figs are committed and kept)
```

### Environment setup
```bash
conda env create -f environment.yml    # Create 'ds' environment
conda activate ds                      # Activate environment
```

The conda environment includes Python 3.13, NumPy 2.2, Pandas 2.2, Seaborn, GeoPandas, and related scientific Python packages.

## Code Architecture

### Data Pipeline Pattern
The repository demonstrates a standard Make-based data science pipeline:

1. **Data acquisition** (`make data/Wage.csv`): Downloads CSV from authoritative source using curl
2. **Processing/Analysis** (`make q1`): Python scripts import local modules and read data
3. **Output generation**: Scripts save figures to `./figs` for embedding in README.md

### Module Structure
- `src/readit.py`: Reusable utility module (`read_csv`) for reading CSV data via pandas
- `src/q1.py`: Example analysis script that imports `read_csv` from the `readit` module and creates visualizations
- Future scripts should follow this pattern: import shared functionality rather than duplicating code

### Makefile Dependencies
The Makefile uses dependency chains (e.g., `q1: data/Wage.csv`) to automatically trigger data downloads before running analysis. `q1` and `clean` are declared `.PHONY` because they don't produce files with those names.

## Assignment Workflow

When adding new questions/analyses:
1. Create `src/qN.py` for the new question
2. Add corresponding Make target with appropriate dependencies
3. Import shared utilities from existing modules or create new ones in `./src`
4. Save outputs to `./figs` and embed in README.md with HTML or markdown syntax
5. Document the command in README.md showing how to reproduce the result
