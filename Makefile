.DEFAULT_GOAL := install

.PHONY: install_base
install_base:
	@python -m venv .venv
	./.venv/Scripts/pip.exe install -U openai-whisper

.PHONY: install
install: install_base
	./.venv/Scripts/pip.exe install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
