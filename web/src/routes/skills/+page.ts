import type { PageLoad } from './$types';
import additionalData from '../../../static/data/additional-data.json';

export const prerender = true;

export const load: PageLoad = () => {
	return additionalData;
};
