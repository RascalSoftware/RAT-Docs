================
Parameters Class
================

Parameters Class helps to add, set or remove parameters to the Project Class. The class has a constructor that gets initiated when Parameter class is called. This constructor 
sets important initial values to the class obj (object) like variable name, types, which are stored in a table. 

When adding parameters, they can be added individually or as a group (see below). When added as a group, `addParameterGroup` method in projectClass iterates over the 
list of parameters and adds them one by one using `addParameter` method which is used to add individual parameters.


.. default-domain:: mat
.. autoclass:: API.projectClass.parametersClass
    :members:
