.. _table: https://uk.mathworks.com/help/matlab/tables.html

==========
Data Class
==========

Data Class is a class to helps add or set data. Data can be addded using `addData` method. The `addData` method expects a cell array of cell array. Like other methods there's
a check that directs different cases based on the length of inputs (1 meaning only name or data entered. If only name is entered, error prompted saying 'Single input is expected 
to be data name'. Case 2 being both name and data supplied and data is added accordingly). It uses `table`_ data type to do that. 
The dataTable is a `table`_ with 4 columns. The following are the 4 columns:

1. Name of the data
2. Second column is the data itself
3. Data range. The data range is a cell array with two elements, the first element is the minimum value of the data, and 
   the second element is the maximum value of the data. (optional)
4. Simulation range. The simulation range is a cell array with two elements, the first element is the minimum value of the 
   simulation, and the second element is the maximum value of the simulation. (optional)


*********
Reference
*********
.. default-domain:: mat
.. autoclass:: API.projectClass.dataClass
    :members:
