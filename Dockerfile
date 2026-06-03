FROM ghcr.io/forwardemail/forwardemail.net-selfhosted:latest

LABEL org.opencontainers.image.source="https://github.com/therealelyayo/forwardemail-serverlets"
LABEL org.opencontainers.image.description="Serverlets AI - self-hosted email (rebranded)"

# Overwrite upstream branding files with patched versions
COPY config/meta.js           /app/config/meta.js
COPY config/utilities.js      /app/config/utilities.js
COPY config/phrases.js        /app/config/phrases.js
COPY app/views/_schema.pug    /app/app/views/_schema.pug
COPY app/views/_wikipedia.pug /app/app/views/_wikipedia.pug
