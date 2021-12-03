FROM traefik:v2.5

WORKDIR /etc/traefik
ADD conf.d conf.d
ADD traefik.yml .

# expose HTTP & HTTPs ports
EXPOSE 80
EXPOSE 443
