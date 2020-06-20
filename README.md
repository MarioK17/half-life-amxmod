# half-life-amxmod
Basic configuration amxmod for half life server, precache models

## How to use

Copy the content into half-life installation. Change basics configs in the server.cfg file.

hostname "ROOM NAME"

sv_downloadurl "URL"

sv_downloadurl is the url where your player models are stored, this allow to download through HTTP.

There is a precache.amxx plugin which precache all your player models, so when someone enter your game, the models will be downloaded through your URL if they are missed in the client

./run.sh to run the game
