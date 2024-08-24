SHELL := /bin/bash

VENV := .venv
EGG_INFO := chat_api.egg-info

PYTHON ?= python3
VENV_PIP ?= $(VENV)/bin/pip3

$(VENV):
	@set -euo pipefail; \
	$(PYTHON) -m venv $(VENV); \
	$(VENV_PIP) install -Uq pip setuptools wheel; \
	$(VENV_PIP) install -Uqe .[test]; \
	$(VENV_PIP) list; \
	echo -e "Successfully created a new virtualenv $(VENV) in $$PWD";

.DEFAULT_GOAL: init
.PHONY: init
init: $(VENV)

.PHONY: clean
clean:
	@rm -rf $(VENV) $(EGG_INFO)
