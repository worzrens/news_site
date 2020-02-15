import django
django.setup()

import logging
import os
from celery import shared_task, task

from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from sendgrid import SendGridAPIClient
from sendgrid.helpers.mail import Mail

from back.tokens import account_activation_token
from back.models import User

from celery import Celery


logging.basicConfig(
    level=logging.INFO,
    format="%(levelname)s|%(filename)s| %(asctime)s - %(message)s",
    datefmt="%H:%M",
)


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'back.settings')

app = Celery('tasks')
app.conf.broker_url = os.environ.get("CELERY_BROKER_URL", "redis://localhost:6379/0")


def get_html_content(url, name):
    return """
<html>
   <head>
      <style> 
        .message {{
            margin: 20px;
            padding: 20px;
            text-align: center;
            font-size: 15px;
        }}
           
        a {{
          background-color: #f44336;
          border: none;
          padding: 20px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 16px;
          margin: 20px;
          cursor: pointer;
        }}
        a:visited {{
          background-color: #f44336;
          border: none;
          padding: 20px;
          text-align: center;
          text-decoration: none;
          display: inline-block;
          font-size: 16px;
          margin: 20px;
          cursor: pointer;
        }}
      </style>
   </head>
   <body link='white' alink='white' vlink='white'>
      <div style="background-color:#ececec;padding:0;margin:0 auto;font-weight:200;width:100%!important">
        <h4>
          Dear {name}, please click on the button below to verify your registration
        </h4>
        <a href="{url}">CONFIRM EMAIL ADDRESS</a>
      </div>
   </body>
</html>


<div>
  <div>
    <div>
      <div>

      </div>
    </div>
  </div>
</div>
""".format(url=url, name=name)


@app.task
def send_confirmation_letter(**kwargs):
    logging.info('Sending confirmation email')
    # current_site = get_current_site(request)
    uid = urlsafe_base64_encode(force_bytes(kwargs.get('user_pk')))
    token = account_activation_token.make_token(User.objects.get(pk=kwargs.get('user_pk')))
    activation_link = "{0}/?uid={1}&token={2}".format('http://0.0.0.0:8000/activate_user', uid, token)

    message = Mail(
        from_email='worzrens@gmail.com',
        to_emails=kwargs.get('user_email'),
        subject='Confirm registration',
        plain_text_content='To verify your account, go on {0}'.format(activation_link),
        html_content=get_html_content(activation_link, kwargs.get('user_name'))
    )
    try:
        sg = SendGridAPIClient(os.environ.get('EMAIL_API_KEY'))
        response = sg.send(message)
        logging.info(response.status_code)
        logging.info(response.body)
    except Exception as e:
        logging.error(e.message)
