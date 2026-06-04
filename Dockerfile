FROM ghcr.io/forwardemail/forwardemail.net-selfhosted:latest

LABEL org.opencontainers.image.source="https://github.com/therealelyayo/forwardemail-serverlets"
LABEL org.opencontainers.image.description="Serverlets AI - self-hosted email (rebranded)"

# ── Branding: config ─────────────────────────────────────────────────────────
COPY config/meta.js           /app/config/meta.js
COPY config/utilities.js      /app/config/utilities.js
COPY config/phrases.js        /app/config/phrases.js

# ── Branding: templates ──────────────────────────────────────────────────────
COPY app/views/_schema.pug    /app/app/views/_schema.pug
COPY app/views/_wikipedia.pug /app/app/views/_wikipedia.pug
COPY app/views/_nav.pug       /app/app/views/_nav.pug
COPY app/views/_footer.pug    /app/app/views/_footer.pug
COPY app/views/_meta.pug      /app/app/views/_meta.pug

# ── Branding: logos & favicons (source assets) ───────────────────────────────
COPY assets/img/favicon.ico               /app/assets/img/favicon.ico
COPY assets/img/favicon.svg               /app/assets/img/favicon.svg
COPY assets/img/favicon-16x16.png         /app/assets/img/favicon-16x16.png
COPY assets/img/favicon-32x32.png         /app/assets/img/favicon-32x32.png
COPY assets/img/apple-touch-icon.png      /app/assets/img/apple-touch-icon.png
COPY assets/img/logo-square.svg           /app/assets/img/logo-square.svg
COPY assets/img/logo-square-30-30.svg     /app/assets/img/logo-square-30-30.svg
COPY assets/img/logo-square-180x180.png   /app/assets/img/logo-square-180x180.png
COPY assets/img/android-chrome-192x192.png /app/assets/img/android-chrome-192x192.png
COPY assets/img/android-chrome-512x512.png /app/assets/img/android-chrome-512x512.png

# ── Branding: overwrite pre-built (hashed) assets in /app/build/ ─────────────
# These are the files actually served by the web process
COPY assets/img/favicon.ico               /app/build/favicon.ico
COPY assets/img/favicon.svg               /app/build/img/favicon.svg
COPY assets/img/favicon-16x16.png         /app/build/img/favicon-16x16.png
COPY assets/img/favicon-32x32.png         /app/build/img/favicon-32x32.png
COPY assets/img/apple-touch-icon.png      /app/build/img/apple-touch-icon.png
COPY assets/img/logo-square.svg           /app/build/img/logo-square.svg
COPY assets/img/logo-square-30-30.svg     /app/build/img/logo-square-30-30.svg
COPY assets/img/logo-square-180x180.png   /app/build/img/logo-square-180x180.png
