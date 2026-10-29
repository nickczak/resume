# Nicholas Sobchak — Résumé

Two one-page versions share the same education and project history:

| Source / PDF | Intended use | Emphasis |
| --- | --- | --- |
| `mainCpp.tex` / `mainCpp.pdf` | Northrop Grumman and systems software roles | C++ data structures, concurrency, native integration, testing |
| `mainJS.tex` / `mainJS.pdf` | APL and backend/security-focused software roles | Python, authentication, cloud infrastructure, encrypted token storage |

Files use `main` followed by the language focus: `mainCpp` for C++ systems work
and `mainJS` for the JavaScript/TypeScript full-stack track, tailored here to
backend/security roles. Each PDF is built from the matching `.tex` source.
The APL version describes implemented security features in QuickQuill and On The Money; Hashword remains a UI prototype
and is not presented as a completed security project. KG-RAG is omitted pending
documented implementation and results.

Portfolio: <https://nickczak.github.io/portfolio/>

## Build

Requires [Tectonic](https://tectonic-typesetting.github.io/) and Poppler utilities
(`pdfinfo`, `pdftotext`) for the build checks.

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

The portfolio displays the C++ / Systems résumé and offers one matching PDF
download. Build both versions and synchronize the website download with:

```sh
./build.sh --sync-portfolio
```

The script checks that both PDFs are one page, then copies the C++ version to
`../portfolio/public/nicholas-sobchak-resume.pdf` and the legacy
`mainJS_421_revised.pdf` URL. Both specialized PDFs stay in this repository.
Run `./build.sh` to build without copying.

Keep the web résumé in `../portfolio/src/pages/resume.astro` aligned with the C++
version. Attach `mainCpp.pdf` for Northrop/systems referrals and `mainJS.pdf` for
APL/backend/security referrals. Inspect the rendered PDFs after content changes;
text extraction alone cannot catch layout problems.
