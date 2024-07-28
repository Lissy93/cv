import json
import yaml
import jsonschema
from jsonschema import validate, Draft7Validator
import logging
import argparse
import sys
from colorama import init, Fore, Style

# Initialize colorama
init(autoreset=True)

print(f"{Fore.CYAN}➡️ Starting: Validating resume data against schema")

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')
logger = logging.getLogger(__name__)

def load_yaml(file_path: str) -> dict:
    """
    Load the resume data from a YAML file.
    Args:
        file_path (str): The path to the YAML file containing resume data.
    Returns:
        dict: The loaded resume data.
    """
    try:
        with open(file_path, 'r') as file:
            return yaml.safe_load(file)
    except Exception as e:
        logger.error(f"Failed to load YAML file {file_path}: {e}")
        sys.exit(1)

def load_json(file_path: str) -> dict:
    """
    Load the schema data from a JSON file.
    Args:
        file_path (str): The path to the JSON file containing schema data.
    Returns:
        dict: The loaded schema data.
    """
    try:
        with open(file_path, 'r') as file:
            return json.load(file)
    except Exception as e:
        logger.error(f"Failed to load JSON file {file_path}: {e}")
        sys.exit(1)

def validate_resume(schema_path: str, resume_path: str):
    """
    Validate the resume data against the provided schema.
    Args:
        schema_path (str): The path to the schema JSON file.
        resume_path (str): The path to the resume YAML file.
    """
    schema = load_json(schema_path)
    resume = load_yaml(resume_path)
    
    validator = Draft7Validator(schema)
    errors = sorted(validator.iter_errors(resume), key=lambda e: e.path)
    
    if errors:
        logger.error(f"Error: {len(errors)} validation failures were found in {resume_path}")
        for error in errors:
            logger.error(f"Validation error: {error.message} at {'/'.join(map(str, error.path))}")
        print(f"{Fore.RED}❌ Error: {len(errors)} validation failures were found in {resume_path}")
        sys.exit(1)
    else:
        logger.info(f"Success: {resume_path} matches the schema")
        print(f"{Fore.GREEN}✅ Success: {resume_path} matches the schema")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Validate resume.yml against schema.json.')
    parser.add_argument('--schema', type=str, default='schema.json', help='Path to the schema file')
    parser.add_argument('--resume', type=str, default='resume.yml', help='Path to the resume file')

    args = parser.parse_args()
    validate_resume(args.schema, args.resume)
