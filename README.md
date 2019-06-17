# deployment-webhook

## This is a Simple Container Deployment Controller based on https://github.com/Praisebetoscience/dockerhub-webhook.
It implements a Flask Webserver waiting for Docker Hub web hook called after Image is pushed to a repository. Shell script is executed after web hook call is received. Web hook URL has a form:

```
http://<your-domain>:<port>/hubhook?key=<APIKEY>
```

Configuration is included in:
> config.py

Please edit `APIKEY` if necessary. `HOOKS` dictionary defines reaction to received web hook calls. Key defines Image repository name (**without** namespace and tag) and a script to execute.
Default configuration defines what to do when Docker Hub calls the web hook with repository name of `auto-flask`, the script to call is `scripts/redeploy.sh`.
If you change Configuration then please build the Image with:
```
docker built -t <your-namespace>/deployment-webhook:1.0 .
```

Start the Container on your Deployment Host (for example Docker Machine on AWS) with this command:
```
$ docker run -it --rm -p <port>:5000 -v /var/run/docker.sock:/var/run/docker.sock <your-namespace>/deployment-webhook:1.0
```

Use following Webhook URL form in Docker Hub:
```
http://<external-fqdn-of-your-docker-host>:<port>/hubhook?key=ujuZJEqKtesX5Eev
```
