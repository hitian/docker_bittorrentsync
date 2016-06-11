###run BitTorrentSync in Docker Container

BitTorrentSync version: Linux x64 v2.3.7


###build: 

`docker build -t bitsync .`

###run:

`docker run -it --name bitsync -p 8888:8888 -p 55555:55555 -v /dir/for/config:/config -v /dir/for/data:/data -d bitsync`

### Webui

http://127.0.0.1:8888/
