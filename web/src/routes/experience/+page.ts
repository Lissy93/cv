import yaml from 'js-yaml';
import type { PageLoad } from './$types';

export const prerender = true;

const yamlEndpoint = 'https://raw.githubusercontent.com/Lissy93/cv/HEAD/resume.yml';
const jsonEndpoint =
	'https://raw.githubusercontent.com/Lissy93/cv/refs/heads/main/web/static/data/additional-data.json';
// const jsonEndpoint =
// 	'https://gist.githubusercontent.com/Lissy93/f3f3ad8c35449043f4e68449a05afd4d/raw/4ad57ecd293f659892d38cdc0e4683df1c67e560/cv-data.json';

const formatForCompare = (str: string) => {
	if (!str) {
		return '';
	}
	return str.toLowerCase().replace(/[^a-z0-9]/gi, '');
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const mergeJobData = (cvData: any[], websiteData: any[]) => {
	const formattedWebsiteData = websiteData.map((job) => ({
		...job,
		formattedCompany: formatForCompare(job.company)
	}));

	const combinedData = cvData.map((cvJob) => {
		const formattedCvName = formatForCompare(cvJob.name);
		const matchingJob = formattedWebsiteData.find(
			(webJob) => webJob.formattedCompany === formattedCvName
		);
		if (matchingJob) {
			return {
				company: cvJob.name,
				companyUrl: matchingJob.companyUrl,
				companyLogo: matchingJob.companyLogo,
				position: cvJob.position,
				startDate: cvJob.startDate,
				endDate: cvJob.endDate,
				datesWorked: matchingJob.datesWorked,
				responsibilities: matchingJob.responsibilities,
				projectType: matchingJob.projectType,
				projects: matchingJob.projects,
				technologies: matchingJob.technologies,
				highlights: cvJob.highlights
			};
		}

		return {
			company: cvJob.name,
			datesWorked: `${cvJob.startDate} - ${cvJob.endDate}`,
			...cvJob
		};
	});

	const combinedCompanyNames = combinedData.map((job) => formatForCompare(job.company));

	const additionalWebsiteJobs = formattedWebsiteData
		.filter((webJob) => !combinedCompanyNames.includes(webJob.formattedCompany))
		.map((webJob) => ({
			company: webJob.company,
			companyUrl: webJob.companyUrl,
			companyLogo: webJob.companyLogo,
			position: webJob.jobTitle,
			datesWorked: webJob.datesWorked,
			responsibilities: webJob.responsibilities,
			projectType: webJob.projectType,
			projects: webJob.projects,
			technologies: webJob.technologies
		}));

	return [...combinedData, ...additionalWebsiteJobs];
};

export const load: PageLoad = async () => {
	const [yamlResponse, jsonResponse] = await Promise.all([
		fetch(yamlEndpoint),
		fetch(jsonEndpoint)
	]);

	const yamlText = await yamlResponse.text();
	// eslint-disable-next-line @typescript-eslint/no-explicit-any
	const cvData = ((yaml.load(yamlText) as any) || {}).work;
	const websiteData = await jsonResponse.json();
	const combinedJobData = mergeJobData(cvData, websiteData.workExperience);

	return {
		combinedJobData
	};
};
