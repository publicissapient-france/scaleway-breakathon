from flask import Flask, jsonify, request
import torch
import torchvision as tv
import sys
from PIL import Image
from pprint import pprint
from model import Model
import operator


app = Flask(__name__)


@app.route('/predict', methods=['POST'])
def predict():
    if request.method == 'POST':
        file = request.files['file']
        img = Image.open(request.files['file'].stream)
        ckpt = torch.load('./model.pth', map_location='cpu')
        classes = ckpt['classes']
        model = Model()
        model.load_state_dict(ckpt['model'])

        # img = Image.open(sys.argv[1])
        tfm = tv.transforms.Compose([
            tv.transforms.Grayscale(3),
            tv.transforms.ToTensor(),
            tv.transforms.Normalize([0.5] * 3, [0.5] * 3),
        ])
        img = tfm(img)

        model.eval()
        with torch.no_grad():
            pred = torch.nn.functional.softmax(model(img[None]), dim=1)

        answer = {nm: prob.item() for nm, prob in zip(classes, pred[0])}
        print(answer)
        return jsonify(int(max(answer.items(), key=operator.itemgetter(1))[0].split(' - ')[0]))