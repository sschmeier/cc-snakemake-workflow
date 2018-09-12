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
source activate snakemake

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
snakemake -np --use-conda

# Run the snakemake workflow, log time and commands 
snakemake -Tp --use-conda --cores 4 2> run.log

# show a detailed summary of the produced files and used commands
snakemake -D

# To delete all created files use
snakemake -p clean
```

## Create a conda env for a particular tool

We keep the conda envs separate per tool, as to not get problems with
dependencies of different tools. We store yaml-files in directory `envs`.
`Snakemake` will create local conda envs when using `--use-conda` based
on the yaml-files. To create a new yaml-file for a tool do the following:

```bash
conda env create -n freebayes python=3 freebayes
source activate freebayes
conda env export > envs/freebayes.yaml
source deactivate
conda env remove -n freebayes
```

## Updating/testing tools of a conda env

If you wish to update tools in a conda environment in envs/ you need to create
and source the env and update the packages:

```bash
# e.g.
conda env create --name freebayes-test --file envs/freebayes.yaml
source activate freebayes-test
conda update --all
# now test it, then:
conda env export > envs/freebayes.yaml
source deactivate
conda env remove -n freebayes-test
```
