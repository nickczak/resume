# Résumé
Check out Nicholas' Résumé!

There are two versions: `mainCpp.tex` and `mainJS.tex`.

## Build locally with hot reload

Requires [Tectonic](https://tectonic-typesetting.github.io/).

View the PDF with hot reload entirely in the terminal:

```sh
# 1. Install zathura if you don't have it (auto-reloads the PDF on file change)
sudo dnf install -y zathura zathura-pdf-mupdf

# 2. Compile on every save (in one terminal)
./dev.sh mainJS.tex   # or: ./dev.sh mainCpp.tex

# 3. Open the PDF (in another terminal)
zathura mainJS.pdf    # or: zathura mainCpp.pdf
```

`dev.sh` watches the target file and recompiles it with Tectonic whenever it
changes. zathura notices the updated PDF and reloads it instantly, so every
save is reflected in the viewer immediately.

## One-off build

```sh
tectonic mainCpp.tex
xdg-open mainCpp.pdf
```
