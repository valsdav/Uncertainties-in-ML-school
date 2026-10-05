# Tutorial environment — uncertainty-aware neural networks

The notebooks need only **numpy, matplotlib, torch (CPU is enough), jupyterlab**.
Put the `*.ipynb` files in a folder and pick ONE of the routes below.

## Option A — local virtual environment (recommended)

```bash
bash setup_env.sh          # creates ./.venv, installs packages, starts Jupyter Lab
```

Next time, just:

```bash
source .venv/bin/activate
jupyter lab
```

(`bash setup_env.sh --no-lab` sets up without launching. On Windows, use WSL,
or run the same pip commands in an Anaconda/venv prompt.)

## Option B — Docker, zero local Python

With the provided `Dockerfile` (CPU-only torch, image ≈ 1.5 GB):

```bash
docker build -t uncertainty-school .
docker run -it --rm -p 8888:8888 -v "$PWD":/work uncertainty-school
```

then open the `http://127.0.0.1:8888/lab?token=...` link printed in the terminal.
Your current folder is mounted at `/work`, so edits persist on your machine.

### Option B' — no build at all

Use the official Jupyter PyTorch image directly:

```bash
docker run -it --rm -p 8888:8888 -v "$PWD":/home/jovyan/work \
    quay.io/jupyter/pytorch-notebook:latest
```

(Bigger download, nothing to build; notebooks appear under `work/`.)

## Check

In any notebook:

```python
import torch, numpy, matplotlib
print(torch.__version__)   # any recent version is fine; no GPU needed
```

Every notebook runs in a few minutes on a laptop CPU.
