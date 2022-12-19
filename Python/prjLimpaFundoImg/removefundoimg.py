import os

from rembg import remove
from PIL import Image

#pasta = 'C:/Users/Public/Pictures/'
pasta = './'

for diretorio, subpastas, arquivos in os.walk(pasta):
    for arquivo in arquivos:
        img_path = os.path.join(diretorio, arquivo)
        new_name = 'new_' + arquivo
        file, ext = os.path.splitext(new_name)
        if (ext != 'png'):
            new_name = file + '.png'         
        img_path_output = os.path.join(diretorio,new_name)
        img = Image.open(img_path)
        img_clear = remove(img)
        img_clear.save(img_path_output)


### Base do código tirado do artigo:
### https://forum.casadodesenvolvedor.com.br/topic/45155-utilidades-com-python-como-remover-o-fundo-de-uma-imagem/