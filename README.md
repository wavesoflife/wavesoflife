# Waves of Life With Jesus

A faith-based Jekyll blog by Zayra, deployed on GitHub Pages.

## Quick Start

```bash
bundle install
bundle exec jekyll serve
```

Then open http://localhost:4000 in your browser.

## Adding Your Logo

Place your logo image at `assets/images/logo.png`. It will appear in the header automatically (56×56px, displayed as a circle).

## Adding Custom Fonts

If you have licensed copies of **TAN Mon Cheri** and **Nickainley**:
1. Create `assets/fonts/`
2. Add `TAN-MonCheri.woff2`, `TAN-MonCheri.woff`, `Nickainley-Normal.woff2`, `Nickainley-Normal.woff`

The CSS already references them via `@font-face`. Until the files are present, the site uses beautiful serif/cursive fallback fonts.

## Writing a New Post

1. Duplicate `_posts/2025-01-15-your-post-title-here.md`
2. Rename it to `_posts/YYYY-MM-DD-your-title.md`
3. Update the front matter (title, date, tags, excerpt)
4. Write your content using Markdown
5. Commit and push — GitHub Pages rebuilds automatically

## Deploying to GitHub Pages

Push this repository to GitHub. In **Settings → Pages**, set the source to the `main` branch (root). Your site will be live at `https://<username>.github.io/<repo>/`.
