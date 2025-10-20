FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY . /app/
WORKDIR /app/
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir --upgrade --requirement requirements.txt

COPY . .

CMD python3 -m maythusharmusic
