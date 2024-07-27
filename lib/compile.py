import argparse
import os
import subprocess
import logging

# Configure logging
logging.basic_config(level=logging.ERROR)
logger = logging.getLogger(__name__)

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

def generate_pdf(input_tex, output_pdf):
    """
    Generates a PDF from a LaTeX file using pdflatex.
    
    Args:
        input_tex (str): Path to the input .tex file.
        output_pdf (str): Path to the output PDF file.
    """
    try:
        # Ensure the output directory exists
        output_dir = os.path.dirname(output_pdf)
        os.makedirs(output_dir, exist_ok=True)

        # Run pdflatex command
        result = subprocess.run(
            ['pdflatex', '-output-directory', output_dir, input_tex],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        )

        # Move the generated PDF to the desired location
        output_filename = os.path.join(output_dir, os.path.splitext(os.path.basename(input_tex))[0] + '.pdf')
        if os.path.isfile(output_filename):
            os.rename(output_filename, output_pdf)
            print(f"PDF successfully generated at {output_pdf}")
        else:
            logger.error("PDF generation failed.")
            logger.error(result.stderr.decode())

    except subprocess.CalledProcessError as e:
        logger.error(f"pdflatex command failed with return code {e.returncode}")
        logger.error(e.output)
    except Exception as e:
        logger.error(f"An error occurred: {e}")

def main():
    parser = argparse.ArgumentParser(description="Generate a PDF from a LaTeX file using pdflatex.")
    parser.add_argument('--input', required=True, help="Path to the input LaTeX (.tex) file")
    parser.add_argument('--output', required=True, help="Path to the output PDF file")
    
    args = parser.parse_args()
    
    generate_pdf(args.input, args.output)

if __name__ == '__main__':
    main()
