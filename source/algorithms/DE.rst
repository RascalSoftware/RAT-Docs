.. _DE:

======================
Differential Evolution
======================

Differential evolution (DE) is a method that optimizes a problem by iteratively trying to improve a candidate solution with regard to a given measure of quality. It is an
example of a `'genetic algorithm' <https://en.wikipedia.org/wiki/Genetic_algorithm>`_ , where the principles of Darwinian Evolution are used to 
'evolve' the correct solution from an initial set of guesses.

DE is used for multidimensional real-valued functions but does not use the gradient of the problem being optimized, which means DE does not 
require the optimization problem to be differentiable, as is required by classic optimization methods. 

DE optimizes a problem by maintaining a population of candidate solutions and creating new candidate solutions by combining existing ones according to simple formulae, 
and then keeping whichever candidate solution has the best score or fitness on the optimization problem at hand. In this way, the optimization problem is treated as a black box 
that merely provides a measure of quality given a candidate solution and the gradient is therefore not needed.

The way new candidate solutions are created is via taking two existing solutions, and 'mutating' them by adding a 'base vector' (usually random, see :ref:`Strategies<deStrategies>` below), a
'difference vector' calculated via the difference between the two points in a randomly-chosen parameter, and performing 'crossover', where random parameters are
copied between the parent solutions and the mutant (with a probability determined by ``crossoverProbability``, below).

The RAT implementation is based on a MATLAB implementation by Storn, Price, Neumaier and van Zandt, modified to be compilable to C++ using MATLAB Coder.

For more technical information, see the `Wikipedia page for differential evolution <https://en.wikipedia.org/wiki/Differential_evolution>`_. There is also
an entire textbook on differential evolution by Price, Storn and Lampinen (2005). [#price2005]_

Algorithm control parameters
----------------------------
The following parameters in the :ref:`Controls object<controlsInfo>` are specific to differential evolution:

- ``populationSize``: The number of candidate solutions that exist at any given time.
  The original MATLAB code (Storn et al.) suggests that this size is not particularly critical, and that
  a good initial guess is the number of fit parameters multiplied by 10. 

- ``numGenerations``: The maximum number of iterations to run.

- ``crossoverProbability``: The probability of exchange of parameters between individuals at each generation (value between 0 and 1).
  The original MATLAB code (Storn et al.) suggests that this should be high for most practical applications; it should be higher for correlated parameters,
  and lower for uncorrelated parameters.

- ``fWeight``: A weighting value controlling the step size of mutations. The algorithm is quite sensitive to the choice of step size.

  Storn, Price and Lampinen (2005) [#price2005]_ suggest 1 as an "empirically derived upper limit, in the sense that no function [they have seen] has required [fWeight] > 1".
  Zaharie (2002) [#zaharie2002]_ calculates that population variance decreases (and so the population eventually becomes homogeneous) if

  .. math:: F < \sqrt{\frac{1 - P_{cr}/2}{N_p}}


  where :math:`P_{cr}` is the crossover probability (``crossoverProbability``) and :math:`N_p` is the population size (``populationSize``). This expression
  gives a rule of thumb for a smallest 'good' value.

- ``strategy``: The algorithm used to generate new candidates (see :ref:`below<deStrategies>`).

- ``targetValue``: The value of chi-squared to aim for. The algorithm will terminate if this is reached.

- ``updateFreq``: The number of iterations between printing progress updates to the terminal. 

- ``updatePlotFreq``: The number of iterations between updates to live plots. 


.. _deStrategies :

Strategies
----------
The ``strategy`` control parameter selects between variations in the actual selection algorithm. New candidates are created 
using a 'base vector' to generate 'mutants' from existing points and the strategy defines how this base vector is calculated.
Each strategy has a shorthand notation used in the literature, which is given in parentheses. The options are:

#. **Random (DE/rand/1)**: The base vector is random.
#. **Local-to-best (DE/local-to-best/1)**: The base vector is a combination of one randomly-selected local solution and the best solution of the previous iteration.
   This approach tries to strike a balance between robustness and fast convergence.
#. **Best with jitter (DE/best/1 with jitter)**: The base vector is the best solution of the previous iteration, with a small random perturbation applied.
#. **Random with per-vector dither (DE/rand/1 with per-vector-dither)**: The base vector is random, with a random scaling factor applied to each mutant. This scaling
   factor is different for each mutant.
#. **Random with per-generation dither (DE/rand/1 with per-generation-dither)**: The base vector is random, with a random scaling factor applied to each mutant.
   This scaling factor is the same for every mutant, and randomised every generation.
#. **Random either-or algorithm (DE/rand/1 either-or-algorithm)**: The base vector is randomly chosen from either a pure random
   mutation, or a pure recombination of parent parameter values.


.. [#price2005] 
   Price, Kenneth V.; Storn, Rainer M.; Lampinen, Jouni A. (2005),
   "Differential Evolution: A Practical Approach to Global Optimisation".
   ISBN: 978-3-540-20950-8,
   URL: https://link.springer.com/book/10.1007/3-540-31306-0
.. [#zaharie2002]
   Zaharie, Daniela (2002),
   "Critical values for the control parameters of differential evolution algorithms".
   Journal: Proc. of MENDEL 2002, 8th Int. Conf. on Soft Computing 2002,
   URL: https://staff.fmi.uvt.ro/~daniela.zaharie/mendel02.pdf
