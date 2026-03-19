import yaml from 'js-yaml';
import type { PageLoad } from './$types';
import resumeYaml from '../../../resume.yml?raw';

export const prerender = true;

export const load: PageLoad = () => {
	return yaml.load(resumeYaml) as Record<string, unknown>;
};
