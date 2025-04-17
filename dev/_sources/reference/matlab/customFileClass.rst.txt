.. _table: https://uk.mathworks.com/help/matlab/tables.html

=================
Custom File Class
=================

RAT enables users to define their own custom files. They can be linked to RAT through Custom File class. Like other classes, the inputs are checked for
the right order and type.

The custom file table has the following columns:

1. Name of the row in the Custom File table
2. Name of the custom file
3. Language of the custom file
4. Path of the custom file

If the 4 columns are supplied, a new row (cell array of strings) is made using the supplied inputs. Then, `addCustomFile` method is used to append the row to the object.
This method takes care of the error checking and incrementing the count of the custom files. The contents of the class are displayed as a table.


.. note::
    RAT supports custom files in C++ (compiled to dynamic library), MATLAB, and Python.


*********
Reference
*********
.. default-domain:: mat
.. autoclass:: API.projectClass.customFileClass
    :members:
