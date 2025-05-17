// since there's no dynamic data here, we can prerender
// it so that it gets served as a static asset in production
import yaml from 'js-yaml';

export const prerender = true;

// src/routes/+page.ts
import type { PageLoad } from './$types';

export const load: PageLoad = async () => {
  // const response = await fetch('https://raw.githubusercontent.com/Lissy93/cv/main/resume.yml');
  const response = await fetch('https://raw.githubusercontent.com/Lissy93/cv/HEAD/resume.yml');
  const yamlText = await response.text();
  const data = yaml.load(yamlText);
  return data;
};
