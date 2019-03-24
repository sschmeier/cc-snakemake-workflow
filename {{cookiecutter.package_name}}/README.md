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

# Install snakemake
conda install snakemake>5.4.0
```


## Install test data

```bash
git clone https://gitlab.com/schmeierlab/workflows/ngs-test-data.git
```

## Snakemake

Develop your workflow using the `Snakefile` file. 


```bash
# Do a dryrun of the workflow, show rules, order, and commands
snakemake -np --use-conda --use-singularity

# Run the snakemake workflow and commands 
snakemake -p --use-conda --use-singularity --cores 10 2> logs/run.stderr > logs/run.stdout

# If necessary bind more folders for singularity outside of your home
snakemake -p --use-conda --use-singularity --cores 10 --singularity-args "--bind /mnt/disk1" 2> logs/run.stderr > logs/run.stdout

# show a detailed summary of the produced files and used commands
snakemake -D

# To delete all created files use
snakemake -p clean
```
