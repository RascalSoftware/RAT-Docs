============
Layers Class
============
Layers give physical information for each layer in a slab model (such as thickness, SLD, roughness and hydration).
Layers can be added as a group or individually. When added as a group, `addLayerGroup` method in projectClass iterates over the list of layers and
adds them one by one using `addLayer` method which is used to add individual layers.


.. default-domain:: mat
.. autoclass:: API.projectClass.layersClass
    :members:
