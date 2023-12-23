include help.mk

.DEFAULT_GOAL := install-cuda

.PHONY: venv
venv: ## setup the virtual environment
	@python -m venv .venv
	
.PHONY: dependencies
dependencies: ## install dependecies
	${MAKEFILE_DIR}.venv/Scripts/pip install -U openai-whisper

.PHONY: update
update: ## updates whisper
	git -C ${MAKEFILE_DIR} pull 
	${MAKEFILE_DIR}.venv/Scripts/pip install openai-whisper --upgrade

## see link below for how to install torch for other environments
## https://pytorch.org/get-started/locally/
.PHONY: install-cuda
install-cuda: venv dependencies ## installs torch with Cuda
	${MAKEFILE_DIR}.venv/Scripts/pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121

.PHONY: install-cpu
install-cpu: venv dependencies  ## installs torch for CPU
	${MAKEFILE_DIR}.venv/Scripts/pip install torch torchvision torchaudio