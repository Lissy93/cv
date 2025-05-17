

// Fetch skills from this JSON
export const prerender = true;

// src/routes/+page.ts
import type { PageLoad } from './$types';

const endpoint = 'https://gist.githubusercontent.com/Lissy93/f3f3ad8c35449043f4e68449a05afd4d/raw/4ad57ecd293f659892d38cdc0e4683df1c67e560/cv-data.json';

export const load: PageLoad = async () => {
  const response = await fetch(endpoint);
  return await response.json();
};
