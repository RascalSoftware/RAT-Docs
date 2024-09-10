"""Sphinx directive for building code from snippets."""

from contextlib import redirect_stdout
from io import StringIO

from docutils import nodes
from matlab.engine import start_matlab, MatlabEngine

from sphinx.application import Sphinx
from sphinx.util.docutils import SphinxDirective
from sphinx.util.typing import ExtensionMetadata


class OutputDirective(SphinxDirective):
    """A directive for getting the output of some code."""

    has_content = True
    optional_arguments = 1

    def run(self) -> list[nodes.Node]:
        language = self.arguments[0]
        if language == "Python":
            if not hasattr(self.state, "snippets_env"):
                self.state.snippets_env = {}
            output_print = write_python_output(
                "\n".join(self.content), self.state.snippets_env
            )
        if language == "Matlab":
            if not hasattr(self.state, "matlab_engine"):
                self.state.matlab_engine = start_matlab()
            output_print = write_matlab_output(
                "\n".join(self.content), self.state.matlab_engine
            )

        output = nodes.literal_block(output_print, output_print)
        output["language"] = "text"

        return [output]


def setup(app: Sphinx) -> ExtensionMetadata:
    app.add_directive("output", OutputDirective)


def write_python_output(code: str, env: dict | None) -> str:
    """Run arbitrary Python code and return the output.

    Parameters
    ----------
    code : str
        The code to be run.
    env : dict or None
        The predefined environment.

    Returns
    -------
    str
        The output of running the code.

    """
    if env is None:
        env = {}
    with StringIO() as buf:
        with redirect_stdout(buf):
            exec(code, None, env)

        return buf.getvalue()


def write_matlab_output(code: str, engine: MatlabEngine) -> str:
    """Run arbitrary MATLAB code and return the output.

    Parameters
    ----------
    code : str
        The code to be run.
    engine : MatlabEngine
        The predefined MATLAB engine.

    Returns
    -------
    str
        The output of running the code.

    """
    with StringIO() as buf:
        engine.eval(code, nargout=0, stdout=buf)

        return buf.getvalue()
