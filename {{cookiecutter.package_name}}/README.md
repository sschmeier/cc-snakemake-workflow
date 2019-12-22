# PROJECT: {{cookiecutter.package_name}}

- AUTHOR: {{cookiecutter.author_name}} ({{cookiecutter.author_email}})
- DATE: {{cookiecutter.date}} 

## Installation


```bash
# Install miniconda
# LINUX:
curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
# MACOSX:
curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh

# update conda base
conda update -n base conda

# Install snakemake
conda create -n snakemake  snakemake>={{cookiecutter.version}}
conda activate snakemake
```


## Install test data

```bash
git clone https://gitlab.com/schmeierlab/workflows/ngs-test-data.git
```

## Snakemake

Develop your workflow using the `Snakefile` file. 


### Adjust config.yaml

Currently it is required to submit config parameters via `--configfile config.yaml`.
Change `config.yaml` accordingly.

### Execute workflow

```bash
# Do a dryrun of the workflow, show rules, order, and commands
snakemake -np --configfile config.yaml

# Run the snakemake workflow and commands via conda and singularity 
snakemake -p --use-conda --use-singularity --cores 10 --configfile config.yaml 2> logs/run.stderr > logs/run.stdout

# If necessary bind more folders for singularity outside of your home
snakemake -p --use-conda --use-singularity --cores 10 --singularity-args "--bind /mnt/disk1" --configfile config.yaml 2> logs/run.stderr > logs/run.stdout

# show a detailed summary of the produced files and used commands
snakemake -D

# To delete all created files use
snakemake -p clean --configfile config.yaml
```
