# Serverlets AI — Branding & Config Repository

This repo contains **only the files that override the upstream [Forward Email](https://github.com/forwardemail/forwardemail.net) Docker image**.  
Every file here is `COPY`'d on top of the base image at build time → pushed to `ghcr.io/therealelyayo/forwardemail-serverlets:latest` → deployed to the production server.

> **Workflow:** Edit a file here on GitHub → commit → GitHub Actions rebuilds the image automatically → pull & restart the container on the server.

---

## 📁 File Structure

```
forwardemail-serverlets/
│
├── Dockerfile                        ← Master build file. Lists every file that gets baked in.
│
├── .github/
│   └── workflows/
│       └── docker-build.yml          ← CI: builds & pushes image on every commit to main
│
├── config/                           ← Node.js config overrides
│   ├── meta.js                       ← ⭐ Site name, domain, URLs, social links, SEO defaults
│   ├── utilities.js                  ← Helper functions (branding text, sender name, etc.)
│   └── phrases.js                    ← Brand-specific text snippets used across the app
│
├── app/
│   └── views/                        ← Pug HTML templates
│       ├── _nav.pug                  ← ⭐ Top navigation bar (logo, links, signup button)
│       ├── _footer.pug               ← ⭐ Page footer (credits, links, copyright)
│       ├── _meta.pug                 ← HTML <head> tags: title, OG tags, meta description
│       ├── _schema.pug               ← Structured data / JSON-LD schema markup
│       └── _wikipedia.pug            ← Wikipedia-style info sidebar template
│
├── locales/
│   └── en.json                       ← ⭐ All English UI strings (page titles, button labels, copy)
│
└── assets/
    └── img/                          ← Logo & favicon files (all sizes + hashed variants)
        ├── logo-square-30-30.svg     ← ⭐ Nav bar logo (30×30, inline SVG)
        ├── logo-square.svg           ← Full-size logo SVG
        ├── logo-square-180x180.png   ← Large PNG logo
        ├── favicon.ico               ← Browser tab icon (ICO)
        ├── favicon.svg               ← Browser tab icon (SVG)
        ├── favicon-16x16.png         ← Favicon 16px
        ├── favicon-32x32.png         ← Favicon 32px
        ├── apple-touch-icon.png      ← iOS home screen icon (180×180)
        ├── android-chrome-192x192.png← Android icon 192px
        ├── android-chrome-512x512.png← Android icon 512px
        ├── ubuntu-one-mono-logo.svg        ← Logo shown on Ubuntu subdomain pages
        ├── ubuntu-one-mono-logo-dark.svg   ← Dark variant for Ubuntu subdomain pages
        │
        │   ── Hashed copies (same content, fingerprinted filename for cache-busting) ──
        ├── ubuntu-one-mono-logo-fea7511028.svg
        └── ubuntu-one-mono-logo-dark-dcb1014f50.svg
```

> **Note on hashed filenames:** The upstream asset pipeline fingerprints files with a content hash (e.g. `favicon-32x32-e8ecadcbfb.png`). These hashed files are referenced directly in the built HTML with SRI integrity checks. When replacing an image, you must update **both** the plain and hashed version — or rebuild the asset pipeline. The Dockerfile handles this by copying the same source file to both filenames.

---

## ✏️ Common Edits

### Change the site name or tagline
→ Edit **`config/meta.js`** — look for `title`, `description`, `keywords`  
→ Edit **`locales/en.json`** — search for the specific string shown on the page

### Change the nav bar or footer
→ Edit **`app/views/_nav.pug`** (navigation, logo area, top links)  
→ Edit **`app/views/_footer.pug`** (footer credits, links, copyright line)

### Replace the logo or favicon
→ Replace the files in **`assets/img/`** — keep the same filenames  
→ For SVG logos: the nav uses `logo-square-30-30.svg` as an **inline include** (paste SVG code directly)  
→ For PNGs/ICOs: just swap the file, same name

### Change page `<title>` or OG/meta tags
→ Edit **`app/views/_meta.pug`** for the template structure  
→ Edit **`locales/en.json`** for the actual title/description strings

### Change sender name or email copy
→ Edit **`config/utilities.js`** and **`config/phrases.js`**

---

## 🚀 Deploy a Change

1. **Edit the file** directly on GitHub (pencil icon) or clone and push
2. **Commit to `main`** — GitHub Actions triggers automatically
3. **Wait ~3–5 min** for the image build to complete (check the [Actions tab](../../actions))
4. **On the server**, run:
   ```bash
   cd /root/forwardemail.net/self-hosting
   docker compose -f docker-compose-self-hosted.yml pull
   docker compose -f docker-compose-self-hosted.yml up -d --force-recreate --no-deps web
   ```
   Or to roll out all app containers:
   ```bash
   docker compose -f docker-compose-self-hosted.yml up -d --force-recreate \
     web api caldav carddav smtp smtp_bree mx imap pop3 bree sqlite sqlite_bree
   ```

---

## 🖼️ Adding a New Logo File

If you add a **new** image file (not replacing an existing one):
1. Add it to `assets/img/` in this repo
2. Add a `COPY` line to `Dockerfile`:
   ```dockerfile
   COPY assets/img/your-new-file.png  /app/assets/img/your-new-file.png
   ```
3. Commit → auto-build → deploy

---

## 🔗 Links

| Resource | URL |
|---|---|
| Production site | https://serverlets.ai |
| API | https://api.serverlets.ai |
| CalDAV | https://caldav.serverlets.ai |
| CardDAV | https://carddav.serverlets.ai |
| Docker image | `ghcr.io/therealelyayo/forwardemail-serverlets:latest` |
| Upstream base image | `ghcr.io/forwardemail/forwardemail.net-selfhosted:latest` |
| GitHub Actions | [Actions tab](../../actions) |
