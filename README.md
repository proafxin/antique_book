# vetus

`vetus` (Latin for *old*) is a LaTeX document class that gives a document the
look of a classic, antique mathematical monograph — in the spirit of the old
German books by Landau, Bachmann and Riemann.

The class must be compiled with **LuaLaTeX** or **XeLaTeX**: it relies on
`fontspec`/`unicode-math` and a set of bundled OpenType fonts (Century Modern
for text, New Computer Modern for sans/mono/maths). Under pdfLaTeX it falls
back to Computer Modern and prints a warning.

## Design

The *only* invariant of the class is its fonts. Everything else is opt-in, so
that without options `vetus` behaves like the standard `book` class (with the
antique fonts). Turn features on as you need them:

```latex
\documentclass[titles,toc,header,delimiters]{vetus}
```

| Option | Effect |
| --- | --- |
| `titles` | Antique numbering and chapter/section *title blocks*: Roman chapter numbers, `‡`-prefixed equations, `§`-prefixed sections, and centred uppercase "CHAPTER N." chapter/section titles. |
| `toc` | Antique, centred table of contents (the "CONTENTS" heading and centred chapter entries). Hyperlinks the entries when `hyperref` is loaded. |
| `header` | Running page header: authors (comma separated) on even pages, current section on odd pages, page number on the right. |
| `delimiters` | Parentheses, braces, brackets, `\binom` and the `pmatrix`/`vmatrix`/`cases` environments are drawn from the body font and scaled to their content. Also provides `\parenthesis`, `\curlybrace` and `\squarebracket`. |
| `background` | Tiles `background.png` behind every page for an old-paper look. |

Any other option (e.g. `oneside`, `a4paper`) is passed straight through to
`book`.

## Always-on font features

* Century Modern text fonts with automatically scaled small caps
  (`\textsc`) taken from the dedicated small-caps face.
* New Computer Modern sans, mono and maths.
* Old-style large operators: `\sum`, `\prod` and `\int` are drawn from the
  text font.

## Installation

For local use, keep `vetus.cls` and the bundled `*.otf` font files together
with your document (or anywhere on your `TEXINPUTS`/`OSFONTDIR`). Avoid copying
the fonts into your TeX distribution's directories.

## Fonts and licensing

`NewCMSans10-Book.otf` and `NewCMMono10-Book.otf` are not bundled; they ship
with TeX Live / MiKTeX (the `newcomputermodern` package) and are found
automatically.

> **Note for redistribution / CTAN:** the Century Modern fonts and the modified
> `NewCMMath-Book-custom2.otf` carry their own licenses. Confirm those licenses
> permit redistribution and modification before publishing this class with the
> fonts included. See `LICENSE`.
