# CV Web App

> Interactive web version of my CV built with SvelteKit. Shows experience, skills, projects, and achievements in a nice format with navigation between sections.

This app is deployed to [cv.aliciasykes.com](https://cv.aliciasykes.com/).
And the code is in the [`web/`](https://github.com/Lissy93/cv/tree/main/web) folder of my [cv repo](https://github.com/Lissy93/cv).

## Quick Start

```bash
npm install     # Install dependencies
npm run dev     # Start dev server (http://localhost:5173)
npm run build   # Build for production
npm run preview # Preview production build
```

## Structure

- [`src/routes/`](https://github.com/Lissy93/cv/tree/main/web/src/routes) - Page routes (intro, experience, skills, etc.)
- [`src/components/`](https://github.com/Lissy93/cv/tree/main/web/src/components) - Reusable components
- [`src/styles/`](https://github.com/Lissy93/cv/tree/main/web/src/styles) - SCSS styling
- [`static/data/`](https://github.com/Lissy93/cv/tree/main/web/static/data) - Additional CV data

## Features

- Multi-page navigation between CV sections
- Responsive design that works on mobile
- PDF download functionality
- Dark/light theme support
- Built with modern web standards

Config files: [`svelte.config.js`](https://github.com/Lissy93/cv/blob/main/web/svelte.config.js), [`vite.config.ts`](https://github.com/Lissy93/cv/blob/main/web/vite.config.ts)

## Tech Stack
Built with SvelteKit, hosted on Vercel.

## Troubleshooting

If you get Rollup errors on Apple Silicon, just clear cache first:
```bash
rm -rf node_modules package-lock.json yarn.lock && npm install
```

## License
See [`LICENSE`](https://github.com/Lissy93/cv/blob/main/LICENSE).
