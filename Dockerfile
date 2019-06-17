FROM docker as docker

FROM python:3.6
WORKDIR /webhook
RUN git clone https://github.com/Praisebetoscience/dockerhub-webhook.git /webhook
RUN pip install -r requirements.txt
COPY config.py run-webhook.py /webhook/
COPY redeploy.sh /webhook/scripts/
RUN chmod +x /webhook/scripts/redeploy.sh
COPY --from=docker /usr/local/bin/docker /usr/local/bin/
CMD ["python", "run-webhook.py"]
