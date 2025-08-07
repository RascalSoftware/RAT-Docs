Documentation
=============
This is the documentation for the [MATLAB](https://github.com/RascalSoftware/RAT) and [Python](https://github.com/RascalSoftware/python-RAT) versions of the RAT project. The installation instruction provided in assumption that you are using [conda](https://docs.conda.io/) for managing your python packages.

Build docs
----------
The documentation should be built using the provided Sphinx make file. The reStructuredText source is in the source 
folder while the build will be placed in a build folder. The build requires a python executable and the python packages 
in the requirements.txt. You need MATLAB version and python version or RAT software installed in your system.

    >>conda create -n RAT python=3.9
    >>conda activate RAT
    >>pip install -r requirements.txt

You also must have `pandoc` installed to build the Python example Jupyter notebooks. See the installation instructions [here](https://pandoc.org/installing.html). If not previously installed system-wide, install [pandoc](https://pandoc.org/) using conda:

    >>conda install -c conda-forge pandoc
    or
    >>pixi global install pandoc
    or
    >>micromamba install pandoc 

depending on [conda](https://docs.conda.io/) flavour you are using.

If not installed before, download the appropriate version of RAT from the GitHub [release](https://github.com/RascalSoftware/RAT/releases) page, and unzip the contents into a folder called API (This folder should be located within python-RAT directory, alongside main `.github` folder). For example on a Linux machine, the nightly can be downloaded as shown:

    >>wget https://github.com/RascalSoftware/RAT/releases/download/nightly/Linux.zip
    >>unzip Linux.zip -d API/

If RAT is installed, you may create symbolic link to the existing installation directory. E.g.,
if  MATLAB RAT software is installed in `[Users,home]/myFedID/RAT` folder, run:

    for Windows:
    >>cd c:\users\myFedID\Rat-doc
    >>mklink /j API c:\Users\myFedID\RAT 
    for linux/macOS;
    >>cd /home/myFedID/RAT-doc
    >>ln -s /home/myFedID/RAT  API
    
You also need [Python RAT API](https://github.com/RascalSoftware/python-RAT) to be build and available in your local RAT `conda` session. Build process will add modules necessary for generate python documentation to the python modules search path. Look [there](https://github.com/RascalSoftware/python-RAT/blob/main/README.md) on more information how to build python API.

To build the HTML docs, type the following into a terminal with access to the Python executable:  

    >>make html

[`matlabengine`](https://pypi.org/project/matlabengine/) is required to generate MATLAB code snippet outputs. If `matlabengine` is not installed, the outputs will be omitted and the following warning will be printed in the terminal:

    UserWarning: Could not create output as MATLAB engine was not available

If the MATLAB code outputs are needed, install the appropriate `matlabengine` for your installed MATLAB

    pip install matlabengine
