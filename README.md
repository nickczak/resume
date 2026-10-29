# Nicholas Sobchak — Résumé

Two one-page versions share the same education and project history:

| Source / PDF | Intended use | Emphasis |
| --- | --- | --- |
| `mainCpp.tex` / `mainCpp.pdf` | Northrop Grumman and systems software roles | C++ data structures, concurrency, native integration, testing |
| `mainJS.tex` / `mainJS.pdf` | APL and backend/security-focused software roles | Python, authentication, cloud infrastructure, encrypted token storage |

The existing filenames are retained for compatibility. Both versions were revised
from the current JavaScript/TypeScript résumé. The APL version describes implemented
security features in QuickQuill and On The Money; Hashword remains a UI prototype
and is not presented as a completed security project. KG-RAG is omitted pending
documented implementation and results.

Portfolio: <https://nickczak.github.io/portfolio/>

## Build

Requires [Tectonic](https://tectonic-typesetting.github.io/).

```sh
tectonic mainCpp.tex
tectonic mainJS.tex
```

Check that each PDF is one page and inspect its layout after changing content:

```sh
pdfinfo mainCpp.pdf
pdfinfo mainJS.pdf
pdftotext -layout mainCpp.pdf -
pdftotext -layout mainJS.pdf -
```

For hot reload, run `./dev.sh mainCpp.tex` or `./dev.sh mainJS.tex`, then open
the matching PDF in a viewer that reloads on changes, such as zathura.

## Portfolio download

The portfolio exposes a single current PDF, using the systems software version.
After rebuilding it, synchronize the download from this repository:

```sh
cp mainCpp.pdf ../portfolio/public/nicholas-sobchak-resume.pdf
# Keep the previous download filename current for existing bookmarks.
cp mainCpp.pdf ../portfolio/public/mainJS_421_revised.pdf
```

Keep the web résumé in `../portfolio/src/pages/resume.astro` aligned with the PDF.
Attach the appropriate PDF directly when requesting a referral. Send the portfolio
URL above rather than the résumé source repository.
