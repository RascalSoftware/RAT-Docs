Documentation
=============
This is the documentation for the [MATLAB](https://github.com/RascalSoftware/RAT) and [Python](https://github.com/RascalSoftware/python-RAT) version of the RAT project. 

Build docs
----------
The documentation should be built using the provided Sphinx make file. The reStructuredText source is in the source 
folder while the build will be placed in a build folder. The build requires a python executable and the python packages 
in the requirements.txt. 

    conda create -n RAT python=3.9
    conda activate RAT
    pip install -r requirements.txt

In the terminal with access to the python executable 

    make html
