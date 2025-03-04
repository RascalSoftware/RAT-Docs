.. _incoherent:

============================
Incoherent Summing (Domains)
============================

When a sample contains domains of different compositions, how these are handled depends on the size of the domains relative to the lateral neutron coherence length (nC).
When domains are smaller than nC, we create the SLD profile as an average SLD of the domains, and calculate the reflectivity as normal. 
If the domains are larger that nC, instead we have to calculate the reflectivity from each domain separately, and then average them. It is to calculate the latter type of 
domain that the ``"domains"`` calculation type is used. As with a ``"normal"`` reflectivity calculation, we can handle domains with each of our calculation types:

.. toctree::
   :maxdepth: 2

   domainsStanlay
   domainsCustomModels