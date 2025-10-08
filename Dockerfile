From python:3.11-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg build-essential libglib2.0-0 libsm6 libxrender1 ca-certificates
RUN useradd -m appuser
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip \
  && pip install --no-cache-dir -r /app/requirements.txt
COPY . /app
RUN chown -R appuser:appuser /app
USER appuser
CMD ["python", "VideoDataStreaming.py"]
