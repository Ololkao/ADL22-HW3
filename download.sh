wget https://www.cmlab.csie.ntu.edu.tw/~briankao/ADL22/mt5-small.zip -O model.zip && unzip model.zip -d output

# wget https://www.cmlab.csie.ntu.edu.tw/~briankao/ADL22/data.zip -O data.zip && unzip data.zip -d .cache/ckiptagger
python tw_rouge/tw_rouge/twrouge.py
