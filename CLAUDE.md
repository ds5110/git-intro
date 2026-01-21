# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a teaching repository for DS 5110 demonstrating best practices for reproducible data science pipelines. It serves as a template for students to structure their assignments using command-line workflows with Make, Git, and Python.

## Key Principles

- **Command-line reproducibility**: All workflows must be executable from the command line. Jupyter notebooks are discouraged for assignment submission due to reproducibility issues.
- **Make-based pipelines**: Use Make to orchestrate all data processing, analysis, and visualization steps.
- **Modular code organization**: Source code lives in `./src`, figures in `./figs`, data in `./data` (gitignored).
- **One file per question**: For assignments, each question gets its own Python file (e.g., `src/q1.py`, `src/q2.py`).
- **DRY principle**: Shared code belongs in modules that get imported (see `src/readit.py` as example).

## Development Commands

### Running the example pipeline
```bash
make q1                  # Creates figs/q1.png using data/Wage.csv
make data/Wage.csv       # Downloads the ISL Wage dataset (runs automatically via q1 target)
make clean               # Removes downloaded data
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
- `src/readit.py`: Reusable utility module for reading CSV data via pandas
- `src/q1.py`: Example analysis script that imports `readit` module and creates visualizations
- Future scripts should follow this pattern: import shared functionality rather than duplicating code

### Makefile Dependencies
The Makefile uses dependency chains (e.g., `q1: data/Wage.csv`) to automatically trigger data downloads before running analysis. The `.PHONY: data` declaration ensures targets work even if a `data/` directory exists.

## Assignment Workflow

When adding new questions/analyses:
1. Create `src/qN.py` for the new question
2. Add corresponding Make target with appropriate dependencies
3. Import shared utilities from existing modules or create new ones in `./src`
4. Save outputs to `./figs` and embed in README.md with HTML or markdown syntax
5. Document the command in README.md showing how to reproduce the result
