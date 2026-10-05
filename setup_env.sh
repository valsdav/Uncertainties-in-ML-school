#!/usr/bin/env bash
# ------------------------------------------------------------------
# PhD school -- uncertainty-aware NNs: local environment setup.
# Creates ./.venv, installs the packages the notebooks need
# (numpy, matplotlib, torch, jupyterlab) and starts Jupyter Lab.
#
# Usage:   bash setup_env.sh            # setup (first time) + launch
#          bash setup_env.sh --no-lab   # setup only
# Needs:   python >= 3.9
# ------------------------------------------------------------------
set -euo pipefail

PYTHON=${PYTHON:-python3}
VENV=.venv

if [ ! -d "$VENV" ]; then
    echo ">> creating virtual environment in $VENV"
    "$PYTHON" -m venv "$VENV"
fi
# shellcheck disable=SC1091
source "$VENV/bin/activate"

echo ">> upgrading pip"
pip install --upgrade pip --quiet

echo ">> installing packages (numpy, matplotlib, torch, jupyterlab)"
# CPU torch is all the tutorials need. On Linux, the CPU-only wheel saves
# ~2 GB of CUDA downloads; everywhere else the regular wheel is already fine.
if [[ "$(uname -s)" == "Linux" ]]; then
    pip install torch --index-url https://download.pytorch.org/whl/cpu
else
    pip install torch
fi
pip install numpy matplotlib jupyterlab

echo ">> environment ready: source $VENV/bin/activate"
if [[ "${1:-}" != "--no-lab" ]]; then
    echo ">> starting Jupyter Lab (Ctrl-C to stop)"
    jupyter lab
fi
