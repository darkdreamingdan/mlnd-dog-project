import base64
import datetime

from IPython.core.display import display
from IPython.display import IFrame 
from mako.lookup import TemplateLookup

def generate_result(pic_type, img_path, predicted_breed):
    """
    Generate a result of predicted dog breed for display in Jupyter Notebook.
    Args:
        pic_type (str): Type of picture, either 'dog', 'human' or 'error'
        img_path (str): Path to the image provided by the user
        predicted_breed (str): The breed that was predicted based on the image
    Returns:
        str: A URI of the base64 encoded result in HTML
    """
    img_content = None
    with open(img_path, 'rb') as img:
        img_content = base64.b64encode(img.read())

    ts = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    lookup = TemplateLookup(['templates/'], output_encoding='utf-8', 
                            strict_undefined=True)
    template = lookup.get_template('dog.html.mako')
    
    raw_html = template.render( 
        pic_type=pic_type,
        img_content=img_content.decode(),
        timestamp=ts,
        breed=predicted_breed
    )

    return f'data:text/html;base64,{base64.b64encode(raw_html).decode()}'

def display_result(pic_type, img_path, predicted_breed):
    """
    Show the result in a Jupyter Notebook of the result of the predicted dog
    breed.  Does not support MS Edge or IE.
    
    Args:
        pic_type (str): Type of picture, either 'dog', 'human' or 'error'
        img_path (str): Path to the image provided by the user
        predicted_breed (str): The breed that was predicted based on the image
    """
    display(IFrame(
        src=generate_result(pic_type, img_path, predicted_breed), 
        width=400, 
        height=530 if pic_type == 'error' else 480
    ))
    