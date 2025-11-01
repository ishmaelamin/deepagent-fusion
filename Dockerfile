# Ubuntu 22.04 (or 24.04) with CUDA 12.9 Runtime + cuDNN 8.9.5

#1  Base image with CUDA 12.9
FROM nvcr.io/nvidia/cuda:12.9.1-runtime-ubuntu22.04 AS base

#2  Install system deps & Python
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3.10 \
        python3.10-venv \
        python3.10-dev \
        curl \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# 3 Create a virtual‑env (optional but clean)
RUN python3.10 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# 4 Install the wheels that match CUDA 12.9
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# 5 Copy your app code
WORKDIR /app
COPY . /app

# 6 Entry point (your choice)
CMD ["python", "main.py"]