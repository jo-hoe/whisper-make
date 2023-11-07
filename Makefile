.DEFAULT_GOAL := install-cuda

ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

# setup the virtual environment
.PHONY: venv
venv:
	@python -m venv .venv
	
# install dependecies
.PHONY: dependencies
dependencies:
	${ROOT_DIR}.venv/Scripts/pip install -U openai-whisper

.PHONY: update_whisper
update_whisper:
	${ROOT_DIR}.venv/Scripts/pip install openai-whisper --upgrade

# installs torch for Windows systems with Cuda
# see link below for how to install torch for other environments
# https://pytorch.org/get-started/locally/
.PHONY: install-cuda
install-cuda: venv dependencies
	${ROOT_DIR}.venv/Scripts/pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

.PHONY: install-cpu
install-cpu: venv dependencies
	${ROOT_DIR}.venv/Scripts/pip install torch torchvision torchaudio