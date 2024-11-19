.. _RAT: 

.. image:: _static/banner.png
    :alt: RAT banner

RAT is an acronym for Reflectivity Algorithms Toolbox, which is the calculation engine for the forthcoming RasCAL-2. As
with the original RasCAL, RAT is a toolbox for analysing neutron reflectivity data at multiple contrasts. It is designed
to be flexible, allowing analysis using traditional layer models, but also using user defined custom models. These models
do not assume any prerequisite, but instead allow complete freedom to the user to specify and parameterise their model
however they wish, either as an array of layers, or as a continuous SLD profile.
The original RasCAL was written in Matlab, and RAT is too. However, RAT is then converted to native C++ using Matlab Coder.
This has the advantage of the ease of use of Matlab for development, combined with the power and speed of C++. In addition,
because the engine is in C++ it can be called from other languages other than just Matlab. There is a Python interface under development.

The Matlab Interface described in this documentation means that for the first time RasCAL projects are fully scriptable,
meaning that full analysis can be provided via a script for publications for example, or analysis performed using RAT incorporated
into jupyter notebooks and so on.

RAT contains a number of enhancements as compared to legacy RasCAL, including:

* :ref:`Automatic parallelisation<parallelisation>` (MPI) either over contrasts or points using a simple flag
* Advanced interface microslicing using :ref:`adaptive resampling<resampling>`
* Option to write :ref:`custom models<customLanguages>` in Matlab, Python or C++
* Custom models for background and resolution functions (not yet functional)
* Fast Bayesian analysis using :ref:`DREAM<DREAM>` or the :ref:`external Paramonte Sampler<paramonte>`
* Parallel Bayes using Paramonte via 'mpiexcec'
* An integrated :ref:`Nested sampler<nestedSampling>` for Bayesian model selection
* Fully validated against ORSO examples
* Ability to :ref:`load and run RasCAL-1 projects<conversionFuncs>` (usually) without modification
* :ref:`Plotting routines<simplePlotting>` for easy visualisation of data and fits
* and more!

.. As well as this documentation, there are extensive examples in the RAT/examples folder
   TODO Add a link to the examples in the grid when the example pages are created.


.. grid:: 1 1 3 3

    .. grid-item-card::

        Getting started with RAT
        ^^^
        Follow these guides to get started:

        * :ref:`install`: Learn how to install RAT.

        * :ref:`guide`: Learn the core principles of RAT with examples.


    .. grid-item-card::

        Go deeper into RAT
        ^^^
        Learn more by diving into the RAT reference:
        
        * :ref:`matlab_api`: Detailed information about all of RAT's MATLAB API.


    .. grid-item-card::

        Get more help
        ^^^

        The easiest way to get help with the project is to start discussions or open an issue on Github_.


.. toctree::
   :hidden:

   Home <self>

.. toctree::
   :hidden:
   :titlesonly:
   
   install
   guide
   reference/matlab/index


.. _Github: https://github.com/RascalSoftware/RAT
