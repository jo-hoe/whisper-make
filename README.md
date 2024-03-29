# Whisper Makefile

[![Test Status](https://github.com/jo-hoe/whisper-make/actions/workflows/test.yml/badge.svg)](https://github.com/jo-hoe/whisper-make/actions?workflow=test)

This repository contains a Makefile to install [whisper](https://github.com/openai/whisper) CLI on Windows. Whisper allows you to generate and even translate subtitles for various media files.

Alternately you can also run the whisper cli directly via docker. See [jo-hoe/whisper-docker-cli](https://github.com/jo-hoe/whisper-docker-cli) for more details.

## Motivation

The installation is straightforward, but it needs multiple commands, which are not all on a single page summarized for Windows.
This repo automates the installation steps using a [virtual environment](https://docs.python.org/3/library/venv.html#).

## Prerequisites

- you have a Windows system
- you have [python](https://www.python.org/downloads/) installed (>= version 3.10)
- you have [ffmpeg](https://ffmpeg.org/) installed
- you have git installed

### CUDA

If your system supports [cuda](https://developer.nvidia.com/cuda-downloads), install the drivers.
You can check which Cuda version is installed with

```bash
nvcc --version
```

or using

```bash
nvidia-smi
```

## Installation

Make sure you have [make](https://gnuwin32.sourceforge.net/packages/make.htm) installed.

- for an installation with CUDA support run

    ```powershell
    make install_cuda
    ```

- for an installation without CUDA support run

    ```powershell
    make install_cpu
    ```

## How to run whisper

After activating the `.venv` environment by running.
Here is how to activate it on Windows:

```PowerShell
.\.venv\Scripts\Activate.ps1
```

You can use the `whisper` CLI.
To create subtitles for a file you run

```PowerShell
whisper <input filename or path>
```

Run `whisper --help` to get a description of the other arguments.

### Issues

Some models have an issue with the [subtitles going out of sync](https://github.com/openai/whisper/discussions/89).
Use the `--condition_on_previous_text False` parameter to address this issue.

Here is an example with this parameter and German input video, which will be translated into English subtitles.

```PowerShell
whisper 'pathToMyGermanVideo.mp4' --language German --task translate --condition_on_previous_text False
```

## Notes

Here are the sources for the Makefile commands

- the plain whisper installation is documented on their [webpage](https://github.com/openai/whisper#setup)
- the pytorch command was built using the [pytorch website](https://pytorch.org/get-started/locally/#with-cuda-1)
