===============
Contrasts Class
===============
Contrast Class is a class to manipulate contrasts, which describe a single "experimental sample" (e.g. a level of deuteration).
While adding the contrast, the input(cell array) goes through some checks and if no input is given, the contrast is 
automatically named and counter is incremented. If only name was given, contrast is incremented and the cell array's name is set to current name.

The cell array of contrasts is sent to Contrast Class to get converted to a struct `parseContrastInput` method which gets attached to the class object.


.. default-domain:: mat
.. autoclass:: API.projectClass.contrastsClass
    :members:

.. autoclass:: API.projectClass.domainContrastsClass
    :members:
