=============
Project Class
=============
The project class objects contain the experimental data and model information which is used in the reflectivity calculation and optimisation algorithms. The two classes
are `projectClass`, which is used for normal calculations, and `domainsClass`, which is used for domains calculations. The `domainsClass` contains additional information
relating to the structure of the domains (`domainRatio` and `domainContrasts`).

How to create and modify a project is explained in :ref:`the user guide<project>`.

The class itself mostly brings together the data structures describing the experimental model and data. These structures are:

.. toctree::
    :maxdepth: 1

    parametersClass
    resolutionsClass
    backgroundsClass
    dataClass
    layersClass
    customFileClass
    contrastsClass


The class is designed so that these data structures do not need to be accessed directly. For example, the bulk in parameters are stored in a `parametersClass`,
and the method `projectClass.addBulkIn` will pass its arguments to the `parametersClass.addParameter` method of the bulk in `parametersClass`. The same
applies to removing and changing data in each part of the project.

It is recommended that a project is created using the `createProject` function instead of creating a `projectClass` or `domainsClass` object directly; this function will validate
input arguments and allow the creation of both types of project from the same entrypoint.

.. default-domain:: mat
.. autofunction:: API.createProject

.. autoclass:: API.projectClass.projectClass
    :members:

.. autoclass:: API.projectClass.domainsClass
    :members:
