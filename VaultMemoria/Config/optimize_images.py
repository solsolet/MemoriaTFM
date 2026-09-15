from pathlib import Path
import subprocess
import re
import sys

ROOT = Path(__file__).resolve().parent.parent

SOURCE = ROOT / "Memoria" / "Assets"
DEST = ROOT / "Memoria" / "Assets-Optimized"


def trobar_imatges(markdown):
    """
    Busca les imatges utilitzades en el Markdown.
    Retorna les rutes relatives respecte de Memoria/Assets.
    """

    patró = r'!\[[^\]]*\]\(([^)]+)\)'
    resultats = set()

    for ruta in re.findall(patró, markdown):
        # Ignorem URLs externes
        if ruta.startswith(("http://", "https://")):
            continue

        # Eliminem possibles atributs després de la ruta
        ruta = ruta.split(" ")[0]

        ruta_path = Path(ruta)

        # Només ens interessen imatges que estiguen dins d'Assets
        parts = ruta_path.parts

        if "Assets" not in parts:
            continue

        index = parts.index("Assets")
        relativa = Path(*parts[index + 1:])

        resultats.add(relativa)

    return resultats


def optimizar_imagen(origen, destino):
    destino.parent.mkdir(parents=True, exist_ok=True)

    extensio = origen.suffix.lower()

    if extensio == ".png":
        destino = destino.with_suffix(".jpg")

        subprocess.run(
            [
                "magick",
                str(origen),
                "-background", "white",
                "-alpha", "remove",
                "-alpha", "off",
                "-strip",
                "-quality", "90",
                str(destino),
            ],
            check=True,
        )

    elif extensio in {".jpg", ".jpeg"}:
        destino = destino.with_suffix(".jpg")

        subprocess.run(
            [
                "magick",
                str(origen),
                "-strip",
                "-quality", "90",
                str(destino),
            ],
            check=True,
        )

    else:
        # Formats que no convertim
        destino = destino.with_suffix(extensio)

        subprocess.run(
            [
                "magick",
                str(origen),
                "-strip",
                str(destino),
            ],
            check=True,
        )

    return destino


def main():
    if len(sys.argv) != 2:
        print("Ús: python3 optimize_images.py fitxer.md")
        sys.exit(1)

    markdown_path = Path(sys.argv[1])

    if not markdown_path.exists():
        print(f"ERROR: no existeix {markdown_path}")
        sys.exit(1)

    markdown = markdown_path.read_text(encoding="utf8")

    imatges = trobar_imatges(markdown)

    print(f"S'han detectat {len(imatges)} imatges utilitzades.")

    DEST.mkdir(parents=True, exist_ok=True)

    for relativa in sorted(imatges):
        origen = SOURCE / relativa

        if not origen.exists():
            print(f"AVÍS: no existeix {origen}")
            continue

        destino = DEST / relativa

        resultat = optimizar_imagen(origen, destino)

        print(f"  {relativa} → {resultat.relative_to(DEST)}")

    print("\n✔ Optimització completada.")


if __name__ == "__main__":
    main()