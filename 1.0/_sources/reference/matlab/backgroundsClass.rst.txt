.. _backgroundsClass:

=================
Backgrounds Class
=================


The `backgroundsClass` holds data describing how background noise should be accounted for in the experiment. This data is the type of background (which can
be either constant, a function, or from data), the source of the background, and any relevant parameters.

- For a constant resolution, the source will be the name of a background parameter (added via `projectClass.addBackgroundParam`;
- for a data resolution, it will be the name of a data object (added via `projectClass.addData`) with an optional offset background parameter in the `value_1` field;
- for a function resolution, it will be the name of a custom file (added via `projectClass.addCustomFile`) with up to five background parameters used
  in the function in fields `value_1` through to `value_5`.


.. default-domain:: mat
.. autoclass:: API.projectClass.backgroundsClass
    :members:
