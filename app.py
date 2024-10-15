from flask import Flask, request

app = Flask(__name__)

@app.route('/', methods=['POST'])
def index():
    notbad_header = request.headers.get('NotBad')
    if notbad_header == 'true':
        return "ReallyNotBad", 200
    else:
        return "Invalid header value", 400

@app.route('/health', methods=['GET'])
def index():
    return 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8089)
