FROM ghcr.io/forwardemail/forwardemail.net-selfhosted:latest

LABEL org.opencontainers.image.source="https://github.com/therealelyayo/forwardemail-serverlets"
LABEL org.opencontainers.image.description="Serverlets AI - self-hosted email (rebranded)"

# Core branding
COPY config/meta.js           /app/config/meta.js
COPY config/utilities.js      /app/config/utilities.js
COPY config/phrases.js        /app/config/phrases.js

# Schema / structured data
COPY app/views/_schema.pug    /app/app/views/_schema.pug
COPY app/views/_wikipedia.pug /app/app/views/_wikipedia.pug

# Navigation, footer, meta tags
COPY app/views/_nav.pug       /app/app/views/_nav.pug
COPY app/views/_footer.pug    /app/app/views/_footer.pug
COPY app/views/_meta.pug      /app/app/views/_meta.pug
