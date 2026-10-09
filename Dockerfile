# Shared Couch front door: serves the catalog site and routes /<game>/ to each game service.
FROM caddy:2.8-alpine
COPY Caddyfile /etc/caddy/Caddyfile
COPY public /srv
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]
