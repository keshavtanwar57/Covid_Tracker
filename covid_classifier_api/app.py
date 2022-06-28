from fastapi import FastAPI
import tensorflow as tf
import urllib.request
import numpy as np
from PIL import Image
import h5py
from pydantic import BaseModel


interpreter = tf.lite.Interpreter(model_path='./model_tflite_quant.tflite')
interpreter.allocate_tensors()

# Get input and output tensors.
input_details = interpreter.get_input_details()
output_details = interpreter.get_output_details()

# Test model on random input data.
input_shape = input_details[0]['shape']
output_shape = output_details[0]['shape']


class Item (BaseModel):
    url: str


app = FastAPI()


decodeLabel = {
    0: "Covid",
    1: "Normal",
    2: "Virus"
}


@app.get('/')
async def hello():
    return "welcome, Covid classifierr API is active"


@app.post('/pred')
async def pred_class(imgurl: Item):
    link = imgurl.url
    req = urllib.request.urlretrieve(link, "SavedImage")
    img = Image.open("SavedImage")
    image = img.convert("RGB")
    image = image.resize((256, 256))
    img = np.array(image, dtype='float32')
    img = img/255
    img = img.reshape((1, 256, 256, 3))

    interpreter.set_tensor(input_details[0]['index'], img)
    interpreter.invoke()
    predictions = interpreter.get_tensor(output_details[0]['index'])
    pred = np.argmax(predictions[0])

    res = decodeLabel[pred]
    prob = np.round(predictions[0][pred]*100, 2)
    dic = {'class': str(res), 'Probability': prob}
    return dic
