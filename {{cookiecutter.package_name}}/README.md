# PROJECT: {{cookiecutter.package_name}}

- AUTHOR: {{cookiecutter.author_name}} ({{cookiecutter.author_email}})
- DATE: {{cookiecutter.date}} 

## INSTALL


```bash
# Install miniconda
# LINUX:
curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
# MACOSX:
curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash Miniconda3-latest-MacOSX-x86_64.sh

# Add conda dir to PATH
echo 'export PATH="~/miniconda3/bin:$PATH"' >> ~/.bashrc
echo 'export PATH="~/miniconda3/bin:$PATH"' >> ~/.zshrc

# Make env
# this environment contains the bare base of what is required to run snakemake
conda env create --name snakemake --file envs/snakemake.yaml
conda activate snakemake

# Update conda and packages if you wish
conda update conda
conda update --all

# We are using now individual environments per task.
# This is facilitated with snakemake --use-conda
# A rule in the Snakefile now can contain a "conda" directive
# which specifies the conda environemnt to use.
# Conda environments used are stored in envs/

# e.g. to be able to run the example workflow, install
conda install samtools bwa freebayes
```

## USE SNAKEMAKE

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