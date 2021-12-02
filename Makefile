traefik-linux:
	@mkdir -p bin && cd bin && \
		curl -L https://github.com/traefik/traefik/releases/download/v2.5.4/traefik_v2.5.4_linux_amd64.tar.gz | \
		tar vzxf - traefik

traefik-mac:
	@mkdir -p bin && cd bin && \
		curl -L  https://github.com/traefik/traefik/releases/download/v2.5.4/traefik_v2.5.4_darwin_amd64.tar.gz | \
		tar vzxf - traefik

traefik-windows:
	@echo "Download traefik windows release and put contents in "bin" directory"
	@exit 1

test:
	env