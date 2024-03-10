#!/bin/bash

structure="documents/Lovecraft.md documents/the_alchemist.md documents/ashes.md"

pandoc documents/meta-pdf.yaml $structure -o output/Lovecraft_stories-$(date +%F).pdf --from markdown --to pdf --template sdd-base.latex --number-sections --listings --highlight-style pygments --top-level-division=chapter
pandoc --toc --toc-depth=2 --from markdown --to epub --css=templates/book.css --lua-filter=templates/pagebreak.lua -o output/Lovecraft_short-$(date +%F).epub $structure
