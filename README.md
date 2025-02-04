Documentation
=============
This is the documentation for the [MATLAB](https://github.com/RascalSoftware/RAT) and [Python](https://github.com/RascalSoftware/python-RAT) versions of the RAT project. 

Build docs
----------
The documentation should be built using the provided Sphinx make file. The reStructuredText source is in the source 
folder while the build will be placed in a build folder. The build requires a python executable and the python packages 
in the requirements.txt. 

    conda create -n RAT python=3.9
    conda activate RAT
    pip install -r requirements.txt

Download the appropriate version of RAT from the GitHub [release](https://github.com/RascalSoftware/RAT/releases) page, and unzip the contents into a folder called API (This folder should be in the root directory). For example on a Linux machine, the nightly can be downloaded as shown 

    wget https://github.com/RascalSoftware/RAT/releases/download/nightly/Linux.zip
    unzip Linux.zip -d API/


To build the html docs, in the terminal with access to the python executable, type  

    make html

matlabengine is required to generate MATLAB code snippet outputs. If matlabengine is not installed the outputs will be omitted and the following warning will be printed in the terminal

    UserWarning: Could not create output as MATLAB engine was not available

If the MATLAB code outputs are needed, install the appropriate matlabengine for your installed MATLAB

    pip install matlabengine
