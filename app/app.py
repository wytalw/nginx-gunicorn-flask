""" hello.py """

from flask import Flask, jsonify, render_template,url_for

app = Flask(__name__)

@app.route('/')
@app.route('/<name>')
def hello(name=None):
    # return jsonify({
    #     'hello': 'world'
    # })
    bg_img = url_for('static',filename='bg.jpg')
    return render_template('hello.html', name=name,bg_img=bg_img)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
