import argparse
import json
import logging
import os
from datetime import datetime
from jinja2 import Environment, FileSystemLoader, select_autoescape

# Configure logging
logging.basicConfig(level=logging.ERROR)
logger = logging.getLogger(__name__)

def load_resume(json_path):
    with open(json_path, 'r') as file:
        return json.load(file)

def latex_escape(text):
    """
    Escapes characters for LaTeX.
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
        '\'': r'\textquotesingle{}',
    }
    return ''.join(latex_special_chars.get(char, char) for char in text)

def format_date(date_str):
    """
    Formats a date string to 'Month Year'. If the format is unknown, returns the original string.
    """
    formats = ['%d-%m-%Y', '%m-%Y', '%Y-%m-%d', '%Y-%m']
    for fmt in formats:
        try:
            return datetime.strptime(date_str, fmt).strftime('%B %Y')
        except ValueError:
            continue
    return date_str

def render_template(template_path, resume_data):
    env = Environment(
        loader=FileSystemLoader(os.path.dirname(template_path)),
        autoescape=select_autoescape(['html', 'xml', 'tex', 'jinja2'])
    )
    env.filters['latex_escape'] = latex_escape
    env.filters['format_date'] = format_date
    template = env.get_template(os.path.basename(template_path))
    return template.render(
        basics=resume_data.get('basics', {}),
        work=resume_data.get('work', []),
        education=resume_data.get('education', []),
        skills=resume_data.get('skills', []),
        awards=resume_data.get('awards', []),
        achivments=resume_data.get('achivments', [])
    )

def main():
    parser = argparse.ArgumentParser(description="Generate a LaTeX resume from a JSON file and a Jinja2 template.")
    parser.add_argument('--resume', required=True, help="Path to the JSON resume file")
    parser.add_argument('--template', required=True, help="Path to the Jinja2 template file")
    parser.add_argument('--output', required=True, help="Path to the output LaTeX file")
    
    args = parser.parse_args()
    
    if not os.path.isfile(args.resume):
        logger.error(f"Resume file not found: {args.resume}")
        return
    if not os.path.isfile(args.template):
        logger.error(f"Template file not found: {args.template}")
        return

    try:
        resume_data = load_resume(args.resume)
    except json.JSONDecodeError as e:
        logger.error(f"Error decoding JSON from {args.resume}: {e}")
        return

    try:
        rendered_resume = render_template(args.template, resume_data)
    except Exception as e:
        logger.error(f"Error rendering template: {e}")
        return

    with open(args.output, 'w') as output_file:
        output_file.write(rendered_resume)
    print(f"Resume successfully generated at {args.output}")

if __name__ == '__main__':
    main()
