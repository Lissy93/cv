.PHONY: all validate generate

PYTHON := $(shell which python3 2>/dev/null || which python)

all: install_requirements validate generate

install_requirements:
	$(PYTHON) -m pip install -r lib/requirements.txt

validate:
	$(PYTHON) lib/validate.py --schema schema.json --resume resume.json

generate:
	$(PYTHON) lib/generate.py --resume resume.json --template template.jinja --output resume.tex
