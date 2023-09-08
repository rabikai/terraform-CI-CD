FROM python:slim

COPY requirements.txt .

ARG ENV_TO_REPLACE
ENV ENV_TO_REPLACE $ENV_TO_REPLACE

RUN apt-get update \
 && apt-get install sudo -y \
 && pip install -r requirements.txt \
 && rm requirements.txt

RUN useradd -ms /bin/bash -d /home/spx spx \
 && usermod -a -G spx spx \
 && echo "spx  ALL=(root) NOPASSWD: /usr/local/bin/python" >> /etc/sudoers \
 && echo "Defaults:spx env_keep += \"ENV_TO_REPLACE\"" >> /etc/sudoers 

USER spx

WORKDIR /home/spx

COPY rng.py .

CMD [ "sudo", "python", "./rng.py" ]