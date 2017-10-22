# nginx-gunicorn-flask with python3

FROM python
LABEL author="xuqinghan"
LABEL purpose = ''


RUN apt update
RUN apt install -y nginx supervisor
RUN pip3 install gunicorn
RUN pip3 install setuptools

ENV PYTHONIOENCODING=utf-8

# Build folder
RUN mkdir -p /deploy/app
WORKDIR /deploy/app
#only copy requirements.txt.  othors will be mounted by -v
COPY app/requirements.txt /deploy/app/requirements.txt
RUN pip3 install -r /deploy/app/requirements.txt

# Setup nginx
RUN rm /etc/nginx/sites-enabled/default
COPY nginx_flask.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/nginx_flask.conf /etc/nginx/sites-enabled/nginx_flask.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Setup supervisord
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY gunicorn.conf /etc/supervisor/conf.d/gunicorn.conf

# run sh. Start processes in docker-compose.yml
#CMD ["/usr/bin/supervisord"]
CMD ["/bin/bash"]
