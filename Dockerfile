# Compatible with Jetpack 6.2
FROM nvcr.io/nvidia/pytorch:25.02-py3-igpu

WORKDIR /app

RUN pip install --upgrade --no-cache-dir pip && \
    pip install --no-cache-dir \
    transformers \
    accelerate \
    sounddevice

COPY speech_recognition.py .

ENV HF_HOME="/huggingface/"



ENTRYPOINT ["python", "speech_recognition.py"]

RUN apt-get update && apt-get install -y --no-install-recommends \
    libportaudio2 \
    && rm -rf /var/lib/apt/lists/
