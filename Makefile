.ONESHELL:
SHELL = /bin/bash


#env - creates and configures the environment.
.PHONY : env
env :
	source /srv/conda/etc/profile.d/conda.sh
	conda env create -f environment.yml
	conda activate notebook
	conda install ipykernel
	conda install pmdarima
	python -m ipykernel install --user --name bartproject2 --display-name "bartproject2"
	
	
#html - build the JupyterBook normally
.PHONY : html	
html :
	jupyter-book build .
	
	
#all - run all jupyter notebooks
.PHONY : all
all:
	jupyter execute *.ipynb --kernel_name=bartproject2
	
	
#clean - clean up the figures and _build folders.
.PHONY : clean
clean :
	rm -rf figures/*
	rm -rf _build/*