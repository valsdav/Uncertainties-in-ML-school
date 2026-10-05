# PhD school -- uncertainty-aware NNs: tutorial environment.
# Build:  docker build -t uncertainty-school .
# Run  :  docker run -it --rm -p 8888:8888 -v "$PWD":/work uncertainty-school
# then open the http://127.0.0.1:8888/lab?token=... link printed in the terminal.
FROM python:3.12-slim

# CPU-only torch keeps the image ~1.5 GB instead of ~7 GB.
RUN pip install --no-cache-dir torch --index-url https://download.pytorch.org/whl/cpu \
 && pip install --no-cache-dir numpy matplotlib jupyterlab

WORKDIR /work
EXPOSE 8888
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
