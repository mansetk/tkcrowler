FROM python:3.7.3

ADD ./src/* /
ADD ./requirements.txt /

RUN pip3 install -r requirements.txt

ENTRYPOINT [ "uwsgi", "--http", "localhost:8000", "--wsgi-file", "app.py", "--callable", "app_dispatch", "--processes", "1", "--threads", "1" ]
