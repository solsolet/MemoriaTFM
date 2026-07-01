from pathlib import Path
import subprocess
import sys
import re
import unicodedata

ROOT = Path(__file__).parent

CONFIG = ROOT / "Config"
OUTPUT = ROOT / "Output"

MANIFEST = CONFIG / "manifest.txt"
METADATA = CONFIG / "metadata.yaml"

BUILD_MD = OUTPUT / "_build.md"
PDF = OUTPUT / "TFM.pdf"


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
            
            # 1. Eliminar comentaris d'Obsidian (%% comentari %%)
            contingut_net = re.sub(re.compile(r"%%.*?%%", re.DOTALL), "", contingut)
            
            # 2. Funció definitiva ajustada als IDs Kebab-case de Pandoc
            def transformar_enllaç(match):
                desti = match.group(1).strip()  # ex: "Marc teòric"
                text_visible = match.group(2).strip()  # ex: "monetització"
                
                # Eliminem accents i diacrítics (ex: "teòric" -> "teoric")
                desti_net = "".join(
                    c for c in unicodedata.normalize('NFD', desti)
                    if unicodedata.category(c) != 'Mn'
                )
                
                # Convertim exactament a la lògica de Pandoc: minúscules i espais per guions
                desti_formatat = desti_net.lower().replace(" ", "-")
                
                return f"[{text_visible}](#{desti_formatat})"
            
            # 3. Convertir [[#Seccio|Text]] o [[Seccio|Text]] al format de Pandoc [Text](#seccio)
            contingut_net = re.sub(r'\[\[(?:#)?([^|\]]+)\|([^\]]+)\]\]', transformar_enllaç, contingut_net)
            
            out.write(contingut_net.rstrip())
            out.write("\n\n\\newpage\n\n")


def generar_pdf():
    print("Compilant la memòria directa amb Pandoc...")
    subprocess.run(
        [
            "pandoc",
            str(BUILD_MD),
            "--metadata-file",
            str(METADATA),
            "--citeproc",
            "--resource-path=.",
            "-o",
            str(PDF), # Recorda canviar-ho per str(PDF) si és el nom de la teua variable
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

    print("\n✔ PDF generat correctament.\n")


if __name__ == "__main__":
    main()