import argparse
import logging
import os
import subprocess
from colorama import init, Fore

# Initialize colorama
init(autoreset=True)

print(f"{Fore.CYAN}➡️ Starting: Compiling LaTex files into a PDF")

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')
logger = logging.getLogger(__name__)

def compile_latex(input_tex: str, output_pdf: str, timeout: int = 60) -> None:
    """
    Compiles a LaTeX file into a PDF using xelatex.

    Args:
        input_tex (str): The path to the input LaTeX (.tex) file.
        output_pdf (str): The path to the output PDF file.
        timeout (int): The timeout in seconds for the LaTeX compilation process.
    """
    try:
        input_dir = os.path.dirname(input_tex)
        output_dir = os.path.dirname(output_pdf)
        base_name = os.path.basename(input_tex).replace('.tex', '.pdf')
        
        logger.info(f"Compiling {input_tex} to PDF...")

        # Change to the directory containing the input .tex file
        compile_cmd = ['xelatex', '-interaction=nonstopmode', os.path.basename(input_tex)]
        result = subprocess.run(compile_cmd, check=True, capture_output=True, text=True, timeout=timeout, cwd=input_dir)

        if result.returncode == 0:
            logger.info("Compilation successful.")
            # Ensure the output directory exists
            if not os.path.exists(output_dir):
                os.makedirs(output_dir)
            # Move the generated PDF to the desired output path
            compiled_pdf_path = os.path.join(input_dir, base_name)
            os.rename(compiled_pdf_path, output_pdf)
            print(f"{Fore.GREEN}✅ Success: PDF generated at {output_pdf}")
        else:
            logger.error("Compilation failed with errors.")
            print(f"{Fore.RED}❌ Error: Compilation failed.")
            print(result.stdout)
            print(result.stderr)
    except subprocess.CalledProcessError as e:
        logger.error(f"Compilation failed: {e}")
        print(f"{Fore.RED}❌ Error: Compilation failed: {e}")
    except subprocess.TimeoutExpired as e:
        logger.error("Compilation process timed out.")
        print(f"{Fore.RED}❌ Error: Compilation process timed out.")
    except Exception as e:
        logger.error(f"Unexpected error: {e}")
        print(f"{Fore.RED}❌ Error: Unexpected error: {e}")

def main():
    parser = argparse.ArgumentParser(description="Compile a LaTeX file into a PDF.")
    parser.add_argument('--input', required=True, help="Path to the input LaTeX (.tex) file")
    parser.add_argument('--output', required=True, help="Path to the output PDF file")
    
    args = parser.parse_args()
    
    input_tex = args.input
    output_pdf = args.output
    
    if not os.path.isfile(input_tex):
        logger.error(f"Input file not found: {input_tex}")
        print(f"{Fore.RED}❌ Error: Input file not found: {input_tex}")
        return

    if not output_pdf.endswith('.pdf'):
        logger.error("Output file must have a .pdf extension")
        print(f"{Fore.RED}❌ Error: Output file must have a .pdf extension")
        return

    compile_latex(input_tex, output_pdf)

if __name__ == '__main__':
    main()
