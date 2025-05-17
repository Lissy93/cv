import argparse
import logging
import os
import yaml
from colorama import init, Fore
from typing import Any, Dict, List, Optional
from datetime import datetime

# Initialize colorama
init(autoreset=True)

print(f"{Fore.CYAN}➡️ Starting: Generating Markdown from resume.yml")

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')
logger = logging.getLogger(__name__)

def load_yaml(input_path: str) -> Dict[str, Any]:
    """
    Loads a YAML file and returns its contents as a dictionary.

    Args:
        input_path (str): The path to the input YAML file.

    Returns:
        Dict[str, Any]: The contents of the YAML file.
    """
    try:
        with open(input_path, 'r') as file:
            return yaml.safe_load(file)
    except Exception as e:
        logger.error(f"Failed to load YAML file: {e}")
        raise

def write_markdown(output_path: str, content: str) -> None:
    """
    Writes the given content to a markdown file.

    Args:
        output_path (str): The path to the output markdown file.
        content (str): The content to write.
    """
    try:
        with open(output_path, 'w') as file:
            file.write(content)
        logger.info(f"Markdown file written to {output_path}")
    except Exception as e:
        logger.error(f"Failed to write markdown file: {e}")
        raise

def format_section(title: str, items: List[str]) -> str:
    """
    Formats a section of the markdown file.

    Args:
        title (str): The title of the section.
        items (List[str]): The items to include in the section.

    Returns:
        str: The formatted markdown section.
    """
    if not items:
        return ""
    
    section = f"\n## {title}\n"
    section += "\n".join(items)
    section += "\n"
    return section

def format_date(date_str: str) -> str:
    """
    Formats a date string in the format YYYY-MM to a more readable format.

    Args:
        date_str (str): The date string to format.

    Returns:
        str: The formatted date string.
    """
    try:
        date = datetime.strptime(date_str, '%Y-%m')
        return date.strftime('%B %Y')
    except ValueError:
        return date_str

def generate_markdown(resume: Dict[str, Any]) -> str:
    """
    Generates markdown content from the resume data.

    Args:
        resume (Dict[str, Any]): The resume data.

    Returns:
        str: The generated markdown content.
    """
    md_content = []

    basics = resume.get('basics', {})
    if basics:
        email = basics.get('email', '')
        url = basics.get('url', '')
        location = basics.get('location', {}).get('address', '')
        md_content.append(f"<h1 align=\"center\">{basics.get('name', '')}</h1>")
        md_content.append(f"<p align=\"center\"><a href=\"mailto:{email}\">{email}</a> | <a href=\"{url}\">{url.replace('https://', '')}</a> | {location}</p>")

    personal_statement = resume.get('personal-statement', '')
    if personal_statement:
        md_content.append(f"\n\n## Personal Statement\n{personal_statement}\n")

    extra_links = resume.get('extra-links', {})
    extra_links_work = extra_links.get('work_history', {})
    extra_links_projects = extra_links.get('projects', {})

    education = resume.get('education', [])
    edu_items = [
        f"- **{edu['institution']}** ({format_date(edu.get('startDate', ''))} - {format_date(edu.get('endDate', ''))}): {edu.get('studyType', '')} in {edu.get('area', '')} <br>\n {edu.get('score', '')}"
        for edu in education
    ]
    md_content.append(format_section('Education', edu_items))

    work = resume.get('work', [])
    work_items = []
    for job in work:
        highlights = "\n".join([f"  - {highlight}" for highlight in job.get('highlights', [])])
        work_items.append(
            f"- **{job['name']}** ({format_date(job.get('startDate', ''))} - {format_date(job.get('endDate', ''))}): {job['position']} <br>\n {highlights}"
        )
    if extra_links_work:
        work_items.append(f"See all previous roles at [{extra_links_work['text']}]({extra_links_work['link']})")
    md_content.append(format_section('Work Experience', work_items))

    skills = resume.get('skills', [])
    skill_items = [
        f"- **{skill['name']}**: {', '.join(skill.get('keywords', []))}"
        for skill in skills
    ]
    if extra_links_projects:
        skill_items.append(f"See example projects built with each technology at <a href=\"{extra_links_projects['link']}\">{extra_links_projects['link']}</a>")
    md_content.append(format_section('Skills', skill_items))

    achievements = resume.get('achievements', [])
    achievement_items = [f"{achievement}\n" for achievement in achievements]
    md_content.append(format_section('Achievements', achievement_items))

    return ''.join(md_content)

def main():
    parser = argparse.ArgumentParser(description="Generate Markdown from a YAML resume.")
    parser.add_argument('--input', required=True, help="Path to the input YAML file")
    parser.add_argument('--output', required=True, help="Path to the output Markdown file")

    args = parser.parse_args()

    input_yaml = args.input
    output_markdown = args.output

    if not os.path.isfile(input_yaml):
        logger.error(f"Input file not found: {input_yaml}")
        print(f"{Fore.RED}❌ Error: Input file not found: {input_yaml}")
        return

    if not output_markdown.endswith('.md'):
        logger.error("Output file must have a .md extension")
        print(f"{Fore.RED}❌ Error: Output file must have a .md extension")
        return

    try:
        resume_data = load_yaml(input_yaml)
        markdown_content = generate_markdown(resume_data)
        write_markdown(output_markdown, markdown_content)
        print(f"{Fore.GREEN}✅ Success: Markdown generated at {output_markdown}")
    except Exception as e:
        logger.error(f"Failed to generate markdown: {e}")
        print(f"{Fore.RED}❌ Error: Failed to generate markdown: {e}")

if __name__ == '__main__':
    main()
