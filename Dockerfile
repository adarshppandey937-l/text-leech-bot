# Purana buster hata kar naya 'bookworm' ya 'bullseye' use karein
FROM python:3.10-slim-bookworm

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends gcc libffi-dev musl-dev ffmpeg aria2 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

# Check karein ki 'Installer' file ka naam sahi hai ya 'requirements.txt' hona chahiye
RUN pip3 install --no-cache-dir --upgrade -r Installer

CMD gunicorn app:app & python3 modules/main.py
