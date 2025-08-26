import argparse
import re
import logging
import os
import yaml
from datetime import datetime
from jinja2 import Environment, FileSystemLoader, select_autoescape
from colorama import init, Fore, Style

# Initialize colorama
init(autoreset=True)

print(f"{Fore.CYAN}➡️ Starting: Generating LaTex files from Jinja templates and YAML data")

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')
logger = logging.getLogger(__name__)

def load_resume(yaml_path: str) -> dict:
    """
    Load the resume data from a YAML file.
    Args:
        yaml_path (str): The path to the YAML file containing resume data.
    Returns:
        dict: The loaded resume data.
    """
    try:
        with open(yaml_path, 'r') as file:
            return yaml.safe_load(file)
    except Exception as e:
        logger.error(f"Failed to load YAML file {yaml_path}: {e}")
        raise

def latex_escape(text: str) -> str:
    """
    Escapes characters for LaTeX.
    Args:
        text (str): The input text to be escaped.
    Returns:
        str: The escaped text.
    """
    latex_special_chars = {
        '&': r'\&',
        '%': r'\%',
        '$': r'\$',
        '#': r'\#',
        '_': r'\_',
        '{': r'\{',
        '}': r'\}',
        '~': r'\textasciitilde{}',
        '^': r'\textasciicircum{}',
        '\\': r'\textbackslash{}',
        '<': r'\textless{}',
        '>': r'\textgreater{}',
        '|': r'\textbar{}',
        '\'': r'\textquotesingle{}',
    }
    return ''.join(latex_special_chars.get(char, char) for char in text)

def markdown_to_latex(text):
    link_pattern = re.compile(r'\[([^\]]+)\]\(([^)]+)\)')
    return link_pattern.sub(r'\\href{\2}{\1}', text).replace('%', '\\%')

def format_date(date_str: str) -> str:
    """
    Formats a date string to 'Month Year'. If the format is unknown, returns the original string.
    Args:
        date_str (str): The input date string.
    Returns:
        str: The formatted date string.
    """
    formats = ['%d-%m-%Y', '%m-%Y', '%Y-%m-%d', '%Y-%m']
    for fmt in formats:
        try:
            return datetime.strptime(date_str, fmt).strftime('%B %Y')
        except ValueError:
            continue
    return date_str

def render_template(template_path: str, resume_data: dict) -> str:
    """
    Renders the LaTeX resume template with the provided resume data.
    Args:
        template_path (str): The path to the Jinja2 template file.
        resume_data (dict): The resume data.
    Returns:
        str: The rendered LaTeX resume.
    """
    env = Environment(
    loader=FileSystemLoader(os.path.dirname(template_path)),
    autoescape=select_autoescape(['html', 'xml'])
    )
    env.filters['latex_escape'] = latex_escape
    env.filters['format_date'] = format_date
    env.filters['markdown_to_latex'] = markdown_to_latex
    template = env.get_template(os.path.basename(template_path))
    
    # Generate compilation timestamp in PDF date format with fallback
    try:
        compilation_time = datetime.now()
        pdf_timestamp = compilation_time.strftime("D:%Y%m%d%H%M%S+00'00'")
    except Exception:
        # Fallback to a safe default if datetime fails
        pdf_timestamp = "D:20240101000000+00'00'"
    
    return template.render(
        basics=resume_data.get('basics', {}),
        personal_statement=resume_data.get('personal-statement', ""),
        work=resume_data.get('work', []),
        education=resume_data.get('education', []),
        skills=resume_data.get('skills', []),
        awards=resume_data.get('awards', []),
        achievements=resume_data.get('achievements', []),
        projects=resume_data.get('projects', []),
        extra_links=resume_data.get('extra-links', {}),
        compilation_timestamp=pdf_timestamp
    )

def main():
    parser = argparse.ArgumentParser(description="Generate a LaTeX resume from a YAML file and a Jinja2 template.")
    parser.add_argument('--resume', required=True, help="Path to the YAML resume file")
    parser.add_argument('--template', required=True, help="Path to the Jinja2 template file")
    parser.add_argument('--output', required=True, help="Path to the output LaTeX file")
    
    args = parser.parse_args()
    
    if not os.path.isfile(args.resume):
        logger.error(f"Resume file not found: {args.resume}")
        print(f"{Fore.RED}❌ Error: Resume file not found: {args.resume}")
        return
    if not os.path.isfile(args.template):
        logger.error(f"Template file not found: {args.template}")
        print(f"{Fore.RED}❌ Error: Template file not found: {args.template}")
        return

    try:
        resume_data = load_resume(args.resume)
    except yaml.YAMLError as e:
        logger.error(f"Error decoding YAML from {args.resume}: {e}")
        print(f"{Fore.RED}❌ Error decoding YAML from {args.resume}: {e}")
        return
    except Exception as e:
        logger.error(f"Error loading resume file {args.resume}: {e}")
        print(f"{Fore.RED}❌ Error: {e}")
        return

    try:
        rendered_resume = render_template(args.template, resume_data)
    except Exception as e:
        logger.error(f"Error rendering template: {e}")
        print(f"{Fore.RED}❌ Error rendering template: {e}")
        return

    try:
        with open(args.output, 'w') as output_file:
            output_file.write(rendered_resume)
        logger.info(f"Resume successfully generated at {args.output}")
        print(f"{Fore.GREEN}✅ Success: Resume successfully generated at {args.output}")
    except Exception as e:
        logger.error(f"Error writing to output file {args.output}: {e}")
        print(f"{Fore.RED}❌ Error writing to output file {args.output}: {e}")

if __name__ == '__main__':
    main()
