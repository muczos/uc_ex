from flask import Flask
from flask import render_template
import socket
import os

app = Flask(__name__)

color_codes = {
    "red": "#e74c3c",
    "green": "#16a085",
    "blue": "#2980b9",
    "darkblue": "#130f40",
}

main_color = os.environ.get('MAIN_COLOR') or 'darkblue'
nginx1_color = os.environ.get('NGINX1_COLOR') or 'darkblue'
nginx2_color = os.environ.get('NGINX2_COLOR') or 'darkblue'

@app.route("/")
def index():
    return render_template('hello.html', name=socket.gethostname(), color=color_codes[main_color])

@app.route("/1/")
def nginx1():
    return render_template('hello.html', name=socket.gethostname(), color=color_codes[nginx1_color])

@app.route("/2/")
def route_n2():
    return render_template('hello.html', name=socket.gethostname(), color=color_codes[nginx2_color])

if __name__ == "__main__":
    app.run(port=8080)
