from pathlib import Path
import sys
import tempfile
from sphinx.application import Sphinx

cur_dir = Path(__file__).resolve().parent
src_dir = cur_dir / "source" 
build_dir = cur_dir / "build" / "html"
doctree_dir = cur_dir / "build" / "doctrees"
builder = "html"

with tempfile.TemporaryDirectory() as tmp_dir, open(Path(tmp_dir) / "doc.txt", "w+") as warning:
    app = Sphinx(src_dir, src_dir, build_dir, doctree_dir, builder, 
                 warning=warning, freshenv=True)

    # Run the build
    app.build()
    
    # Report warnings
    warning.seek(0)
    warn_text = warning.read()
    if warn_text:
        print(f"\nThe following warnings need to be addressed:\n\n{warn_text}", file=sys.stderr)
        sys.exit(1)
