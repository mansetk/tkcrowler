FROM python:3.7.3

WORKDIR /app
COPY ./src /app/src
CMD ["sh", "/app/docker_startup.sh"]
