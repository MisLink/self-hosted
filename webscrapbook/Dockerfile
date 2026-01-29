FROM python:3.14-slim

WORKDIR /app

EXPOSE 8080

ARG VERSION

RUN pip install webscrapbook==${VERSION} gunicorn[gevent]==24.1.1 --no-cache-dir

RUN wsb config --book --all

ENTRYPOINT ["gunicorn", "--chdir", "/app/.wsb", "app:application"]
