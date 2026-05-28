FROM searxng/searxng:latest

USER root

COPY ./settings.yml /etc/searxng/settings.yml
