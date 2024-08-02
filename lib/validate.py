import argparse
import json
import logging
import os
import yaml
from jsonschema import validate, ValidationError
from jinja2 import Environment, FileSystemLoader, TemplateSyntaxError, select_autoescape
from colorama import init, Fore, Style

# Initialize colorama
init(autoreset=True)

print(f"{Fore.CYAN}➡️ Starting: Validating YAML data and Jinja template")

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')
logger = logging.getLogger(__name__)

def load_yaml(yaml_path: str) -> dict:
    """
    Load data from a YAML file.
    Args:
        yaml_path (str): The path to the YAML file.
    Returns:
        dict: The loaded YAML data.
    """
    try:
        with open(yaml_path, 'r') as file:
            return yaml.safe_load(file)
    except Exception as e:
        logger.error(f"Failed to load YAML file {yaml_path}: {e}")
        raise

def load_json(json_path: str) -> dict:
    """
    Load data from a JSON file.
    Args:
        json_path (str): The path to the JSON file.
    Returns:
        dict: The loaded JSON data.
    """
    try:
        with open(json_path, 'r') as file:
            return json.load(file)
    except Exception as e:
        logger.error(f"Failed to load JSON file {json_path}: {e}")
        raise

def validate_yaml_against_schema(yaml_data: dict, schema: dict) -> None:
    """
    Validate YAML data against a JSON schema.
    Args:
        yaml_data (dict): The YAML data to validate.
        schema (dict): The JSON schema to validate against.
    Raises:
        ValidationError: If the YAML data does not conform to the schema.
    """
    try:
        validate(instance=yaml_data, schema=schema)
        logger.info("YAML data is valid against the schema")
    except ValidationError as e:
        logger.error("YAML data validation error: {e}")
        raise

def fake_filter() -> str:
    return ''

def validate_jinja_template(template_path: str) -> None:
    """
    Validate a Jinja template for syntax errors.
    Args:
        template_path (str): The path to the Jinja template file.
    Raises:
        TemplateSyntaxError: If there are syntax errors in the template.
    """
    try:
        env = Environment(
            loader=FileSystemLoader(os.path.dirname(template_path)),
            autoescape=select_autoescape(['html', 'xml', 'tex', 'jinja2'])
        )

        filters_to_mock = ['latex_escape', 'format_date', 'markdown_to_latex']
        for filter_name in filters_to_mock:
            env.filters[filter_name] = fake_filter
        env.get_template(os.path.basename(template_path))
        logger.info("Jinja template syntax is valid")
    except TemplateSyntaxError as e:
        logger.error("Jinja template syntax error: {e}")
        raise

def main():
    parser = argparse.ArgumentParser(description="Validate a YAML file against a JSON schema and check Jinja template syntax.")
    parser.add_argument('--resume', required=True, help="Path to the YAML resume file")
    parser.add_argument('--schema', required=True, help="Path to the JSON schema file")
    parser.add_argument('--template', required=True, help="Path to the Jinja template file")
    
    args = parser.parse_args()
    
    if not os.path.isfile(args.resume):
        logger.error(f"Resume file not found: {args.resume}")
        print(f"{Fore.RED}❌ Error: Resume file not found: {args.resume}")
        return
    if not os.path.isfile(args.schema):
        logger.error(f"Schema file not found: {args.schema}")
        print(f"{Fore.RED}❌ Error: Schema file not found: {args.schema}")
        return
    if not os.path.isfile(args.template):
        logger.error(f"Template file not found: {args.template}")
        print(f"{Fore.RED}❌ Error: Template file not found: {args.template}")
        return

    try:
        yaml_data = load_yaml(args.resume)
    except Exception as e:
        print(f"{Fore.RED}❌ Error loading YAML file: {e}")
        return

    try:
        schema = load_json(args.schema)
    except Exception as e:
        print(f"{Fore.RED}❌ Error loading JSON schema file: {e}")
        return

    try:
        validate_yaml_against_schema(yaml_data, schema)
    except ValidationError:
        print(f"{Fore.RED}❌ YAML data is invalid against the schema.")
        return

    try:
        validate_jinja_template(args.template)
    except TemplateSyntaxError:
        print(f"{Fore.RED}❌ Jinja template syntax is invalid.")
        return

    print(f"{Fore.GREEN}✅ All validations passed successfully.")

if __name__ == '__main__':
    main()
