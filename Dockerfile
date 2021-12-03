FROM traefik:v2.5

# install required packages
RUN apk add git jq

# create and populate runtime directory
WORKDIR "/etc/traefik"
ADD . .
RUN mkdir -p logs && \
    sed -i -e 's#git@github.com:#https://github.com/#g' ".git/config"

# expose HTTP & HTTPs ports
EXPOSE 80
EXPOSE 443
