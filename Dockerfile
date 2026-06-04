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

# ── Logos & favicons: /app/assets/img/ (source + inline SVG include) ─────────
COPY assets/img/favicon.ico                /app/assets/img/favicon.ico
COPY assets/img/favicon.svg               /app/assets/img/favicon.svg
COPY assets/img/favicon-16x16.png         /app/assets/img/favicon-16x16.png
COPY assets/img/favicon-32x32.png         /app/assets/img/favicon-32x32.png
COPY assets/img/apple-touch-icon.png      /app/assets/img/apple-touch-icon.png
COPY assets/img/logo-square.svg           /app/assets/img/logo-square.svg
COPY assets/img/logo-square-30-30.svg     /app/assets/img/logo-square-30-30.svg
COPY assets/img/logo-square-180x180.png   /app/assets/img/logo-square-180x180.png
COPY assets/img/android-chrome-192x192.png /app/assets/img/android-chrome-192x192.png
COPY assets/img/android-chrome-512x512.png /app/assets/img/android-chrome-512x512.png
COPY assets/img/ubuntu-one-mono-logo.svg           /app/assets/img/ubuntu-one-mono-logo.svg
COPY assets/img/ubuntu-one-mono-logo-dark.svg      /app/assets/img/ubuntu-one-mono-logo-dark.svg

# ── Logos & favicons: /app/build/img/ (unhashed served files) ────────────────
COPY assets/img/favicon.ico                /app/build/favicon.ico
COPY assets/img/favicon.svg               /app/build/img/favicon.svg
COPY assets/img/favicon-16x16.png         /app/build/img/favicon-16x16.png
COPY assets/img/favicon-32x32.png         /app/build/img/favicon-32x32.png
COPY assets/img/apple-touch-icon.png      /app/build/img/apple-touch-icon.png
COPY assets/img/logo-square.svg           /app/build/img/logo-square.svg
COPY assets/img/logo-square-30-30.svg     /app/build/img/logo-square-30-30.svg
COPY assets/img/logo-square-180x180.png   /app/build/img/logo-square-180x180.png
COPY assets/img/android-chrome-192x192.png /app/build/img/android-chrome-192x192.png
COPY assets/img/android-chrome-512x512.png /app/build/img/android-chrome-512x512.png
COPY assets/img/ubuntu-one-mono-logo.svg           /app/build/img/ubuntu-one-mono-logo.svg
COPY assets/img/ubuntu-one-mono-logo-dark.svg      /app/build/img/ubuntu-one-mono-logo-dark.svg

# ── Hashed filenames (fingerprinted by asset pipeline) ───────────────────────
COPY assets/img/favicon-16x16.png         /app/build/img/favicon-16x16-7c47f864ab.png
COPY assets/img/favicon-32x32.png         /app/build/img/favicon-32x32-e8ecadcbfb.png
COPY assets/img/favicon.svg               /app/build/img/favicon-d685871ef0.svg
COPY assets/img/favicon.ico               /app/build/img/favicon-e77e8d9e55.ico
COPY assets/img/favicon.ico               /app/build/favicon-bceac7d0a8.ico
COPY assets/img/apple-touch-icon.png      /app/build/img/apple-touch-icon-a6d7599fe0.png
COPY assets/img/logo-square-180x180.png   /app/build/img/logo-square-180x180-c59a3dcccc.png
COPY assets/img/logo-square-30-30.svg     /app/build/img/logo-square-30-30-b5af3e98d6.svg
COPY assets/img/logo-square.svg           /app/build/img/logo-square-710d76ea36.svg
COPY assets/img/android-chrome-192x192.png /app/build/img/android-chrome-192x192-1f4323532b.png
COPY assets/img/android-chrome-512x512.png /app/build/img/android-chrome-512x512-a210a36a8b.png
COPY assets/img/ubuntu-one-mono-logo.svg           /app/build/img/ubuntu-one-mono-logo-fea7511028.svg
COPY assets/img/ubuntu-one-mono-logo-dark.svg      /app/build/img/ubuntu-one-mono-logo-dark-dcb1014f50.svg
