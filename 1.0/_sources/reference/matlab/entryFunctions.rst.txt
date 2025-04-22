===================
RAT Entry Functions
===================
Once a project and controls class have been created, RAT is run via the `RAT` function:

.. code-block:: MATLAB
    :caption: Sample usage of RAT class.

        % Initialize the project class
        problem = createProject();

        % Initialize the controls class
        controls = controlsClass();

        % call the RAT function
        [problem,results] = RAT(problem,controls);


The RAT function turns the `projectClass` and `controlsClass` into relevant structs and cell arrays.

The `parseClassToStructs` function converts the user-friendly data input into an object that can be passed to compiled code.

Then, the `RATMain` function redirects the control flow based on what procedure is selected in `controlsClass`.


.. default-domain:: mat
.. autofunction:: API.RAT


.. autofunction:: API.RATMain


.. autofunction:: API.parseClassToStructs
