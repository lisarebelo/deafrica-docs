# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?= -v
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

fetchnotebooks:
	[ -d sandbox/notebooks ] || git clone https://github.com/digitalearthafrica/deafrica-sandbox-notebooks.git sandbox/notebooks
	cd sandbox/notebooks && git checkout main && git reset --hard origin/main && git pull

buildtools:
	cd sandbox/notebooks/Tools && pip install . --no-dependencies

fetchtranslation:
    pip install poeditor || python ./download_translations.py
