FROM python:3.7.2


ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt



