#uwsgi --http localhost:8000 --wsgi-file count.py --callable app_dispatch

from func import f
from flask import Flask
from werkzeug.middleware.dispatcher import DispatcherMiddleware
from werkzeug.serving import run_simple
from prometheus_client import make_wsgi_app, Counter

c = Counter('my_counter', 'Description of access counter')

app = Flask(__name__)

@app.route('/')
def index():
	return 'index'

@app.before_request
def before_request():
	incval = f()
	c.inc(incval)

app_dispatch = DispatcherMiddleware(app, {
	'/metrics': make_wsgi_app()
})
