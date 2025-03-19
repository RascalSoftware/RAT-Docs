.. _bayesTutorial:

Bayesian Analysis
=================

RAT has two Bayesian algorithms available, :ref:`Nested Sampling<nestedSampling>`
and :ref:`DREAM<DREAM>`.

These algorithms use statistical techniques to estimate the true value of fit parameters.
The nested sampler also calculates Bayesian evidence, which may be used to compare hypotheses or models.

The central idea here is that the probability of a parameter :math:`X`'s true value being :math:`x` is
related to its chi-squared fit: [#sivia1998]_

.. math:: P(X=x | I) \propto \exp(-\chi^2 / 2)

where :math:`I` is the background information from the project. This means we can explore this
likelihood function to learn statistical information about the experiment and model.

.. warning::
   This tutorial expects that you are familiar with setting up a project
   and controls; see the :ref:`introduction` and :ref:`project class<project>` tutorials.

Setting up a Bayesian analysis
------------------------------

To set up the Bayesian algorithm itself, simply set the procedure in the **Controls** object
to either ``"ns"`` or ``"dream"``:

.. tab-set::
    :class: tab-label-hidden
    :sync-group: code

    .. tab-item:: Matlab
        :sync: Matlab

        .. output:: Matlab

            controls = controlsClass();
            controls.procedure = 'ns';
            % or controls.procedure = 'dream';

    .. tab-item:: Python
        :sync: Python

        .. output:: Python

            controls = RAT.Controls(procedure='ns')
            # or RAT.Controls(procedure='dream');
            # for an existing controls object you can use
            #   controls.procedure = 'ns' 
            # etc.


Each of these algorithms have their own controls settings, as all procedures do.
See the :ref:`Nested Sampling<nestedSampling>` and :ref:`DREAM<DREAM>` pages for an outline of these.

This is sufficient to run the algorithm. However, you may also want to use information
about your parameters in the optimisation. All parameters in the **Project** object
(parameters, background parameters, scalefactors, bulk in/out, etc.) can be given
a prior which will be used in the algorithm. This prior represents our initial understanding
of the parameter.

The options for prior type are:
- ``"uniform"``: A uniformly distributed prior. Represents ignorance about the true value of the parameter.
- ``"gaussian"``: A Gaussian (normal) distribution, with given mean and variance.
  Represents that we have reason to believe the true value lies around some value :math:`\mu` with variance :math:`\sigma^2`.
- ``"jeffreys"``: A Jeffreys' prior, which represents ignorance similarly to uniform, but is also invariant
  to changes of scale.

For Gaussian priors, :math:`mu` and :math:`sigma` are given to represent the mean and standard deviation of the distribution.

You can give the prior (alongside :math:`mu`, and :math:`sigma` if relevant) when you create the parameter:

.. tab-set-code::
    .. code-block:: Matlab
        % this Gaussian prior has a mean of 0 and standard deviation of 1
        problem.addParameter('My new param', 1, 2, 3, true, "gaussian", 0, 1);
        problem.addParameter('My scale param',10,20,30,true, "jeffreys");

    .. code-block:: Python

        problem.parameters.append(name='My new param', min=1, value=2, max=3, prior_type="gaussian", mu=0, sigma=1)
        problem.parameters.append(name='My scale param', min=10, value=20, max=30, fit=False, prior_type="jeffreys")


You can also change these values in existing parameters, just as you would for the minimum, value, maximum, and fit.

Running and plotting a Bayesian analysis
----------------------------------------

Running a Bayesian analysis is the same as running RAT normally. Here we'll do a DREAM analysis
on the project from the :ref:`introduction`:

.. tab-set-code::
    .. code-block:: Matlab

        [problem, results] = RAT(problem, controls);
        disp(results)

    .. code-block:: Python

        problem, results = RAT.run(problem, controls);
        print(results)


.. tab-set::
    :class: tab-label-hidden
    :sync-group: code

    .. tab-item:: Matlab
        :sync: Matlab

        .. output:: Matlab

            problem = load('source/tutorial/data/twoContrastExample.mat');
            problem = problem.problem;
            controls = controlsClass();
            controls.procedure = "dream";
            [problem, results] = RAT(problem, controls);
            disp(results)
             
    .. tab-item:: Python 
        :sync: Python

        .. output:: Python

            import RATapi as RAT

            problem = RAT.Project.load("source/tutorial/data/two_contrast_example.json")
            controls = RAT.Controls(procedure="dream")
            problem, results = RAT.run(problem, controls)
            print(results)


The results object contains additional results from the Bayesian analysis. The main thing
you may want to do with this is create a corner plot of the posterior distributions:

.. tab-set-code::
    .. code-block:: Matlab

        cornerPlot(results); 

    .. code-block:: Python

        RAT.plotting.plot_corner(results)


.. image:: 
   :alt: A corner plot from the Bayesian analysis, showing the posterior
   histograms for each parameter and the contour plots for each pair of parameters.


Note that you can specify some specific parameters to create a smaller, more focused corner plot:

.. tab-set-code::
    .. code-block:: Matlab

        cornerPlot(results, 'params', ["Substrate Roughness", "Backs Value D2O", "Scalefactor 1"]); 

    .. code-block:: Python

        RAT.plotting.plot_corner(results, params=["Substrate Roughness", "Backs Value D2O", "Scalefactor 1"])


.. image:: 
   :alt: A smaller version of the previous corner plot, just giving the histograms
   and contour plots for substrate roguhness, the D2O background, and the scalefactor.


It is also possible to plot the histograms from the analysis as a grid:


.. tab-set-code::
    .. code-block:: Matlab

        plotHists(results); 

    .. code-block:: Python

        RAT.plotting.plot_hists(results)


.. image::
   :alt: A grid of histograms for each parameter of the analysis.


and also the Markov chains for each parameter:

.. tab-set-code::
    .. code-block:: Matlab

        plotChain(results); 

    .. code-block:: Python

        RAT.plotting.plot_chain(results)


.. image::
   :alt: A grid of MCMC chains for each parameter of the analysis.

.. [#sivia1998]
    D. S. Sivia, J. R. P. Webster,
    "The Bayesian approach to reflectivity data".
    DOI: 10.1016/S0921-4526(98)00259-2,
    URL: https://bayes.wustl.edu/sivia/98_20feb03.pdf,
