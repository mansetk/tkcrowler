FROM python:3.7.3

ADD src /
ADD requirements.txt /

RUN pip3 install -r requirements.txt

ENTRYPOINT [ "uwsgi", "--http", "localhost:8000", "--wsgi-file", "src/app.py", "--callable", "app_dispatch" ]
