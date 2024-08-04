import yaml from 'js-yaml';
export const prerender = true;
import type { PageLoad } from './$types';

const yamlEndpoint = 'https://raw.githubusercontent.com/Lissy93/cv/main/resume.yml';
const jsonEndpoint = 'https://gist.githubusercontent.com/Lissy93/f3f3ad8c35449043f4e68449a05afd4d/raw/9d5db47f33cd1ad324c4ab5ca06fe943a7cd9fc6/cv-data.json';

const formatForCompare = (str: string) => str.toLowerCase().replace(/[^a-z0-9]/gi, '');

const mergeJobData = (cvData, websiteData) => {
  const formattedWebsiteData = websiteData.map(job => ({
    ...job,
    formattedCompany: formatForCompare(job.company)
  }));

  const combinedData = cvData.map(cvJob => {
    const formattedCvName = formatForCompare(cvJob.name);
    const matchingJob = formattedWebsiteData.find(webJob => webJob.formattedCompany === formattedCvName);
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
    return cvJob;
  });

  const combinedCompanyNames = combinedData.map(job => formatForCompare(job.company));

  const additionalWebsiteJobs = formattedWebsiteData
    .filter(webJob => !combinedCompanyNames.includes(webJob.formattedCompany))
    .map(webJob => ({
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
  const cvData = yaml.load(yamlText).work;

  const websiteData = await jsonResponse.json();

  const combinedJobData = mergeJobData(cvData, websiteData.workExperience);

  return {
    combinedJobData
  };
};
