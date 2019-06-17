""" (Updated) dockerhub-webhook run.py"""
from dockerhook import app

app.run(debug=True, host='0.0.0.0')
