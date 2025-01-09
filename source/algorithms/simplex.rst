.. _simplex:

===================
Nelder-Mead Simplex
===================

The Nelder-Mead simplex method is a popular heuristic for finding a local minimum of a function of several variables. It is a very intuitive
geometric method, and is probably easiest to understand by means of a visualisation (e.g. `this interactive explanation <https://alexdowad.github.io/visualizing-nelder-mead/>`_) 

For two variables, a simplex is a triangle, and the method is a pattern search that compares function values at the three vertices of a
triangle. The worst vertex, where :math:`f(x, y)` is largest, is rejected and replaced with a new
vertex. A new triangle is formed and the search is continued. The process generates
a sequence of triangles (which might have different shapes), for which the function
values at the vertices get smaller and smaller. The size of the triangles is reduced and
the coordinates of the minimum point are found.

The algorithm can extend to any number of dimensions, where to find the minimum of a function of N variables the simplex is then a generalized triangle (`a simplex <https://en.wikipedia.org/wiki/Simplex>`_)
in N dimensions. It is effective and computationally compact, and has the advantage of not requiring the gradient of the underlying function to be defined. 

The main advantage of simplex methods for reflectivity is that they are robust in the face of competing local minima, and quickly converge to 
the region where the true global minimum lies. Finding the absolute local minimum for high dimensional problems can be slow however (i.e. simplex methods
are really Global Minimisers, and can be slow to converge locally). 

The RAT implementation of Nelder-Mead Simplex is based on the `MATLAB implementation "fminsearch" <https://www.mathworks.com/help/matlab/ref/fminsearch.html>`_.

If you would like more technical information on Nelder-Mead simplex methods, consider the 
`Wikipedia page for the Nelder-Mead method <https://en.wikipedia.org/wiki/Nelder%E2%80%93Mead_method>`_
and the sources therein, or books such as Numerical Recipes (Press et al. 2007, chapter 10.5), 
which is available online `here <https://numerical.recipes>`_.

Algorithm control parameters
----------------------------
The following parameters in the :ref:`Controls object<controlsInfo>` are specific to the Nelder-Mead simplex:

- ``xTolerance``: The termination tolerance for step size. If the minimiser tries to take a step
  smaller than ``xTolerance`` *and* the tolerance bound on ``funcTolerance`` is satisfied, the algorithm terminates.

- ``funcTolerance``: The termination tolerance for function value change. If the minimiser tries to take a step where
  the change in chi-squared is less than ``funcTolerance`` *and* the tolerance bound on ``xTolerance`` is satisfied,
  the algorithm terminates.

- ``maxFunEvals``: The maximum number of function evaluations that can be performed before the algorithm terminates.

- ``maxIterations``: The maximum number of iterations that can be performed before the algorithm terminates.

- ``updateFreq``: How often the algorithm should print out its progress, in iterations. 

- ``updatePlotFreq``: If you are using live plotting, how often the plot should be updated. 

