from pathlib import Path
import subprocess
import sys
import re

ROOT = Path(__file__).parent
CONFIG = ROOT / "Config"
OUTPUT = ROOT / "Output"

MANIFEST = CONFIG / "manifest.txt"
METADATA = CONFIG / "metadata.yaml"

BUILD_MD = OUTPUT / "_build.md"
PDF = OUTPUT / "TFM.pdf"
DOCX = OUTPUT / "TFM.docx"

# Rutes per als fitxers temporals de text
BUILD_MD_PROCESSED = OUTPUT / "_build_processed.md"


def llegir_manifest():
    fitxers = []

    with open(MANIFEST, encoding="utf8") as f:

        for linia in f:
            linia = linia.strip()
            if not linia:
                continue
            fitxers.append(ROOT / linia)

    return fitxers


def validar(fitxers):
    for fitxer in fitxers:
        if not fitxer.exists():
            print(f"ERROR: no existeix {fitxer}")
            sys.exit(1)


def construir_md(fitxers):
    with open(BUILD_MD, "w", encoding="utf8") as out:
        for fitxer in fitxers:
            contingut = fitxer.read_text(encoding="utf8")
            
            # Filtrem només els comentaris d'Obsidian (%% comentari %%) de forma segura
            contingut_net = re.sub(re.compile(r"%%.*?%%", re.DOTALL), "", contingut)
            
            out.write(contingut_net.rstrip())
            out.write("\n\n\\newpage\n\n")


def generar_pdf():

    print("1. Processant la bibliografia amb Pandoc cap a Markdown net...")
    # Pas A: Generem un fitxer Markdown provisional on la bibliografia d'APA ja està escrita en text pla
    subprocess.run(
        [
            "pandoc",
            str(BUILD_MD),
            "--metadata-file",
            str(METADATA),
            "--citeproc",
            "-t", "markdown",
            "-o", str(BUILD_MD_PROCESSED),
        ],
        cwd=ROOT,
        check=True,
    )

    print("2. Convertint les URLs de la bibliografia en enllaços reals...")
    # Pas B: Llegim el fitxer on està la bibliografia i convertim les adreces de text pla en enllaços clicables
    text_bibliografia = BUILD_MD_PROCESSED.read_text(encoding="utf8")
    
    # Busquem qualsevol URL que no estiga ja en un enllaç de Markdown i la convertim en un enllaç [url](url)
    text_amb_enllaços_reals = re.sub(r'(?<!\()(https?://[^\s\)]+)', r'[\1](\1)', text_bibliografia)
    
    # Tornem a guardar el text modificat
    BUILD_MD_PROCESSED.write_text(text_amb_enllaços_reals, encoding="utf8")

    print("3. Compilant el PDF final amb enllaços actius...")
    # Pas C: Convertim el document processat a PDF de forma totalment neta
    subprocess.run(
        [
            "pandoc",
            str(BUILD_MD_PROCESSED),
            "--metadata-file",
            str(METADATA),
            "-o", str(PDF),
        ],
        cwd=ROOT,
        check=True,
    )


def generar_docx():

    subprocess.run(
        [
            "pandoc",
            str(BUILD_MD_PROCESSED),
            "--metadata-file",
            str(METADATA),
            "--resource-path=.",
            "--reference-doc",
            str(CONFIG / "template.docx"),
            "-o",
            str(DOCX),
        ],
        cwd=ROOT,
        check=True,
    )


def main():
    OUTPUT.mkdir(exist_ok=True)

    fitxers = llegir_manifest()

    validar(fitxers)
    construir_md(fitxers)
    generar_pdf()
    print("4. Generant DOCX...")

    generar_docx()

    if BUILD_MD_PROCESSED.exists():
        BUILD_MD_PROCESSED.unlink()

    print("\n✔ PDF i docx generats correctament.\n")


if __name__ == "__main__":
    main()