import json
import jsonschema
from jsonschema import validate

def load_json(file_path):
    with open(file_path, 'r') as file:
        return json.load(file)

def validate_resume(schema_path, resume_path):
    schema = load_json(schema_path)
    resume = load_json(resume_path)
    try:
        validate(instance=resume, schema=schema)
        print("Validation successful: resume.json is valid against schema.json.")
    except jsonschema.exceptions.ValidationError as err:
        print("Validation error: resume.json is not valid against schema.json.")
        print(f"Error details: {err.message}")
        exit(1)

if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description='Validate resume.json against schema.json.')
    parser.add_argument('--schema', type=str, default='schema.json', help='Path to the schema file')
    parser.add_argument('--resume', type=str, default='resume.json', help='Path to the resume file')

    args = parser.parse_args()
    validate_resume(args.schema, args.resume)
