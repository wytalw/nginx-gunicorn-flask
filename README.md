## nginx-gunicorn-flask

This repository contains files necessary for building a Docker image of
Nginx + Gunicorn + Flask.

### changes:
+ using official python image[https://hub.docker.com/r/_/python/]
+ run by docker-compose
+ mount codes by -v
+ mount 3 .conf files by -v for nginx gunicorn supervisord


### Base Docker Image

* python


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/danriti/nginx-gunicorn-flask/) from public [Docker Hub Registry](https://registry.hub.docker.com/):

```bash
docker pull danriti/nginx-gunicorn-flask
```


### Usage

```run py docker-compose

```

After few seconds, open `http://<host>` to see the Flask app.
