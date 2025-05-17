

// Fetch skills from this JSON
export const prerender = true;

// src/routes/+page.ts
import type { PageLoad } from './$types';

const endpoint = 'https://gist.githubusercontent.com/Lissy93/f3f3ad8c35449043f4e68449a05afd4d/raw/5685c13f40bcb987763c694754951892023b5f9c/cv-data.json';

export const load: PageLoad = async () => {
  const response = await fetch(endpoint);
  return await response.json();
};
