import yaml from 'js-yaml';
import type { PageLoad } from './$types';

export const prerender = true;

export const load: PageLoad = async () => {
	const response = await fetch('https://raw.githubusercontent.com/Lissy93/cv/HEAD/resume.yml');
	const yamlText = await response.text();
	const data = yaml.load(yamlText);
	return data;
};
