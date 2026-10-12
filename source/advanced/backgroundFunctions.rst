====================
Function Backgrounds
====================

RAT supports function backgrounds, which use a custom function to describe the background for the experiment. 


The signature for background functions is shown in the code snippet below. The first argument `xdata` is a vector containing the q points over the simulation range, 
which should incorporate the q values of the supplied data and the second argument `params` is a vector containing the background parameters associated with the background, 
up to 5 can be related to a specific function background. The function should return an array with the background value for each of the input simulation points.

.. tab-set-code::
    .. code-block:: MATLAB

        function background = backgroundFunction(xdata, params)
            
            background = zeros(numel(xdata), 1);

        end

    .. code-block:: Python

        import numpy as np


        def background_function(xdata, params):

            background = np.zeros(len(xdata))
            return background

To define a function background, add the custom function, associated background parameters, then create the background as shown below 

.. tab-set-code::
    .. code-block:: MATLAB
       
        % Add the function background
        % Add the function to custom files, and its parameters to background
        % parameters
        problem.addCustomFile('Back Fun','backgroundFunction.m','matlab',pwd);

        problem.addBackgroundParam('Fn Ao',5e-7, 8e-6, 5e-5);
        problem.addBackgroundParam('Fn k',40, 70, 90);
        problem.addBackgroundParam('Fn Const',1e-7, 8e-6, 1e-5);

        % Add the Background
        problem.addBackground('Func Background','function','Back Fun','Fn Ao','Fn k','Fn Const');

    .. code-block:: Python

        problem.custom_files.append(name="Back Fun", filename="background_function.py", language="python")

        problem.background_parameters.append(name="Fn Ao", min=5e-7, value=8e-6, max=5e-5)
        problem.background_parameters.append(name="Fn k", min=40, value=70, max=90)
        problem.background_parameters.append(name="Fn Const", min=1e-7, value=8e-6, max=1e-5)

        problem.backgrounds.append(name="Func Background", type="function", source="Back Func", value_1="Fn Ao", value_2="Fn k", value_3="Fn Const")
                                  

An example of using Python and Matlab custom models can be found in examples folder. Look at DSPCScriptWithFunctionBackground.m and 
DSPC_function_background.py in Matlab and Python respectively.
