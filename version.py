import os
import re


# The regex for major, minor and bugfix version, including alpha/beta/rc tags
VERSION_REGEX = re.compile(r"(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)"
                           r"(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)"
                           r"(?:\.(?:0|[1-9]\d*|\d *[a-zA-Z-][0-9a-zA-Z-]*))*))?"
                           r"(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?")
DOCS_PATH = os.path.abspath(os.path.dirname(__file__))
VERSION_FILE = os.path.join(DOCS_PATH, 'API', 'version.txt')


def get_doc_version():
    """Grabs doc version from environment variable otherwise fallback to version 
    file in RAT if not set"""
    doc_version = 'dev'
    version = os.environ.get('RAT_VERSION')
    if version is None:
        with open(VERSION_FILE, 'r') as version_file:
            version = version_file.read()

    if version != 'main':    
        major, minor, *other = list(VERSION_REGEX.match(version.replace(' ', '')).groups())
        doc_version = f'{major}.{minor}'
    
    return doc_version
 