.. _parallelisation:

==========================
Parallelising Calculations
==========================

RAT has in-built parallelisation for speeding up calculations. It will either parallelise over points or contrasts and this is easily selectable from the **Controls** class.

************************
Internal Parallelisation
************************
The controls class allows selection of parallel calculations for all algorithms. The parallelisation can be either over ``"points"`` or ``"contrasts"``:

* ``"points"``: In this case, each reflectivity curve is split into a number of sections, and the reflectivity for each set of points is calculated by an individual thread. Only the Abeles reflectivity calculation itself is parallelised, and the rest runs sequentially on a single thread.
* ``"contrasts"``: Each contrast **in its entirety** gets its own calculation thread.

The parallelisation scheme is chosen from the controls class:

.. tab-set-code::
    .. code-block:: Matlab

        controls = controlsClass()

        % Choose no parallelisation
        controls.parallel = 'single';

        % Parallelise over points
        controls.parallel = 'points';

        % Parallelise over contrasts
        controls.parallel = 'contrasts';
    
    .. code-block:: Python

        controls = RAT.Controls()

        # Choose no parallelisation
        controls.parallel = 'single'

        # Parallelise over points
        controls.parallel = 'points'

        # Parallelise over contrasts
        controls.parallel = 'contrasts'

Generally speaking, unless you have an inordinate amount of points in your datafiles, the greatest speed increase always results from parallelising over contrasts. In fact, if the number of points in your data
is relatively small, parallelising over points can even slow things down because of the extra communication overhead! It is a good idea to verify which is fastest for a give problem at the start of an analysis.

