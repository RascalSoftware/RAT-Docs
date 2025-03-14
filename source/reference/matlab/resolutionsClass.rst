.. _table: https://uk.mathworks.com/help/matlab/tables.html

=================
Resolutions Class
=================

The `resolutionsClass` holds data describing how instrument resolution should be accounted for in the experiment. This data is the type of resolution (which can
be either constant or from data) and the source of the resolution; for a constant resolution, this is the name of a resolution parameter (added via `projectClass.addResolutionParam`);
for data, this will be taken from the fourth column of the data array used by the contrast.


.. default-domain:: mat
.. autoclass:: API.projectClass.resolutionsClass
    :members:
