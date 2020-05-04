FROM python:3.7.3

WORKDIR /app
COPY ./src /app/src
CMD ["python3", "/app/src/app.py"]
