#!/bin/bash

structure="documents/Lovecraft.md documents/cthulhu_mythos.md documents/dagon.md documents/nyarlathotep.md documents/nameless_city.md documents/azathoth.md documents/the_hound.md documents/festival.md documents/call_of_cthulhu.md documents/dream_lands.md"

pandoc documents/meta-pdf.yaml $structure -o output/Lovecraft_stories-$(date +%F).pdf --from markdown --to pdf --template sdd-base.latex --number-sections --listings --highlight-style pygments --top-level-division=chapter
pandoc --toc --toc-depth=2 --epub-cover-image=documents/resources/cthulhu.jpg --from markdown --to epub --css=templates/book.css --lua-filter=templates/pagebreak.lua --metadata title="Lovecraft's Short Stories" -o output/Lovecraft_short-$(date +%F).epub $structure
