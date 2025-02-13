# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html
# -- Path setup --------------------------------------------------------------
# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
import os
import sys
import shutil
import datetime
from urllib.parse import urljoin
from pathlib import Path
# -- Project information -----------------------------------------------------
# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
exclude_patterns = []
current_dir = os.path.dirname(os.path.abspath(__file__))
# matlab_src_dir is required for sphinxcontrib-matlabdomain
matlab_src_dir = os.path.abspath(os.path.join(current_dir, '..', 'API'))
if not os.path.isdir(matlab_src_dir) or not os.path.isfile(os.path.join(matlab_src_dir, 'version.txt')):
    raise FileNotFoundError(f'A RAT MATLAB release could not be found in {matlab_src_dir}. ' 
                            'Please download and extract the RAT release to the API folder.')
sys.path.insert(0, matlab_src_dir)

import RATapi
sys.path.insert(0, os.path.dirname(os.path.abspath(RATapi.__file__)))
project = 'RAT'
copyright = u'2022-{}, ISIS Neutron and Muon Source'.format(datetime.date.today().year)
author = 'Arwel Hughes, Sethu Pastula, Alex Room, Rabiya Farooq, Paul Sharp, Stephen Nneji'

# The full version, including alpha/beta/rc tags
sys.path.insert(0, os.path.dirname(os.path.abspath(".")))
sys.path.insert(0, os.path.dirname(os.path.abspath("..")))
from version import get_doc_version
doc_version = get_doc_version()

# -- General configuration ---------------------------------------------------

# add extensions path for snippets
sys.path.append(os.path.abspath("./_ext"))

extensions = ['sphinxcontrib.matlab', 'sphinx.ext.napoleon', 'sphinx.ext.autodoc', 'sphinx.ext.autosummary', 'sphinxcontrib.autodoc_pydantic', 'sphinx_design', 'sphinx_copybutton', 'snippets', 'enum_tools.autoenum', 'nbsphinx']

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# -- Setup example files -----------------------------------------------------
PYTHON_RAT_RELEASE = "0.0.0.dev4"

if not os.path.isdir("./python_examples/data"):
    os.system(f'git clone --depth 1 --branch {PYTHON_RAT_RELEASE} https://github.com/RascalSoftware/python-RAT')
    print("Copying Jupyter notebooks...")
    for directory in ['normal_reflectivity', 'domains', 'absorption']:
        for file in Path(f"./python-RAT/RATapi/examples/{directory}/").glob('*'):
            shutil.copy(file, "./python_examples/notebooks/")

    shutil.copytree("./python-RAT/RATapi/examples/data", "./python_examples/data", dirs_exist_ok=True)

    shutil.rmtree("./python-RAT")

if not os.path.isfile("./matlab_examples/standardLaersDSPCSheet.html"):
    try:
        from matlab.engine import start_matlab
    except ImportError:
        print("Could not copy MATLAB live scripts as MATLAB is not installed.")
    else:
        print("Starting MATLAB Engine...")
        eng = start_matlab()
        for sheet in ['normalReflectivity/standardLayers/standardLayersDSPCSheet', 
                      'normalReflectivity/customLayers/customLayersDSPCSheet', 
                      'normalReflectivity/customXY/customXYDSPCSheet', 
                      'domains/standardLayers/domainsStandardLayersSheet', 
                      'domains/customLayers/domainsCustomLayersSheet',
                      'domains/customXY/domainsCustomXYSheet',
                      'miscellaneous/convertRascal1Project/convertRascal',
                      'miscellaneous/alternativeLanguages/customModelLanguagesSheet',]:
            filename = Path(sheet).name
            print(f"exporting {sheet}")
            eng.export(f"../API/examples/{sheet}.mlx", f"./matlab_examples/{filename}.html", nargout=0)


# -- Options for HTML output -------------------------------------------------
#set primary_domain = 'matlab'
primary_domain = None
matlab_keep_package_prefix = False
# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
html_theme = 'pydata_sphinx_theme'
bgcolor = 'white'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_favicon = "_static/logo.png"
html_static_path = ['_static']
html_css_files = ["custom.css"]
html_logo = '_static/logo.png'
 
url = os.environ.get('RAT_URL', '') 
        
html_theme_options = {'show_prev_next': False,
                      'pygment_light_style': 'tango',
                      'pygment_dark_style': 'monokai',
                      'navbar_start': ['navbar-logo', 'version-switcher'],
                      'switcher': {'json_url': urljoin(url, 'switcher.json'), 
                                   'version_match': doc_version,
                                   'check_switcher': False,},
                      'secondary_sidebar_items': {
                                '**': ['page-toc'],
                                'index': [],
                                'install': [],},
                     }
html_sidebars = {
    'install': []
}

copybutton_prompt_text = r">>> |>> "
copybutton_prompt_is_regexp = True

autodoc_typehints = "description"

nbsphinx_prolog = r"""
{% set docname = 'doc/' + env.doc2path(env.docname, base=None)|string %}

.. raw:: html

    <div class="admonition note">
      This page was generated from the notebook {{ env.docname.split('/')|last|e + '.ipynb' }} found in 
      <a class="reference external" href="https://github.com/RascalSoftware/python-RAT/blob/"""+PYTHON_RAT_RELEASE+r"""/RATapi/examples/">the Python-RAT repository. </a>
      <a href="{{ env.docname.split('/')|last|e + '.ipynb' }}" class="reference download internal" download>Download notebook</a>.
    </div>

.. note::

    To get the output project and results from this example in your Python session, run:

    .. code-block:: python

        from RATapi.examples import {{ env.docname.split('/')|last|e }}
        project, results = {{ env.docname.split('/')|last|e }}() 

-------------------------------------------------------------------------------------

"""

### autodoc_pydantic settings
# hide JSON schemas by default
autodoc_pydantic_model_show_json = False
autodoc_pydantic_settings_show_json = False

# don't show validators or config 
autodoc_pydantic_field_list_validators = False
autodoc_pydantic_model_show_config_summary = False
autodoc_pydantic_model_show_validator_summary = False
autodoc_pydantic_model_show_validator_members = False

# hide parameter list in class signature
autodoc_pydantic_settings_hide_paramlist = True

# do not show list of fields if they do not have docstrings
# (e.g. for models we use the main docstring)
autodoc_pydantic_model_undoc_members = False

# get field documentation from field docstrings
autodoc_pydantic_field_doc_policy = "docstring"
