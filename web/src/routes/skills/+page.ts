

// Fetch skills from this JSON
export const prerender = true;

// src/routes/+page.ts
import type { PageLoad } from './$types';

const endpoint = 'https://gist.githubusercontent.com/Lissy93/f3f3ad8c35449043f4e68449a05afd4d/raw/9d5db47f33cd1ad324c4ab5ca06fe943a7cd9fc6/cv-data.json';

export const load: PageLoad = async () => {
  const response = await fetch(endpoint);
  return await response.json();
};
