# Whisper Makefile

Contains a Makefile to install whisper.
Currently, it is setup to work on Windows systems only.

## Prerequisites

- you have a Windows system
- you have [python](https://www.python.org/downloads/) installed (>= version 3.10)
- you have [ffmpeg](https://ffmpeg.org/) installed

### CUDA

In case your system supports [cuda](https://developer.nvidia.com/cuda-downloads), install the drivers.
You can check if the cuda driver is correctly installed by executing this command

```bash
nvidia-smi
```

## Installation

Ensure you have [make](https://gnuwin32.sourceforge.net/packages/make.htm) installed.

- for an installation with CUDA support run
    ```powershell
    make
    ```
- for an installation without CUDA support run
    ```powershell
    make install_base
    ```

## How to run whisper

After activating the `.venv` environment by running

```powershell
.\.venv\Scripts\Activate.ps1
```

You can use the `whisper` CLI. 
To create subtitles for a file you simply run

```powershell
whisper <input filename or path>
```

Run `whisper --help` for more all possible arguments.

## Notes

Here are the sources for the command in case updates are needed

- the plain whisper installation is documented on their [webpage](https://github.com/openai/whisper#setup)
- the pytorch command was built using the [pytorch website](https://pytorch.org/get-started/locally/#with-cuda-1)
