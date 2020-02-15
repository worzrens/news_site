FROM python:3.5.2


ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt



