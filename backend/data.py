import os
from flask import Flask, request

app = Flask(__name__)


@app.route('/', methods=['POST', 'GET'])
def data():
    error = ""
    if request.method == 'POST':
        if request.form['inputName'] != "":
            name = request.form['inputName']
            return "Congratulations {}, this message was requested securely".format(name)
        else:
            error = "Please enter a name"
    return error


port = os.getenv('PORT', '5000')
if __name__ == "__main__":
    app.run(host='0.0.0.0', port=int(port))
