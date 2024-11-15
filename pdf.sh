#!/bin/bash

php ./tools/generateDocs.php
chromium --no-sandbox --headless --gpu --no-pdf-header-footer --print-to-pdf=./temp.pdf ./temp.html
pdftk 'temp.pdf' update_info_utf8 'metas.txt' output 'CultosSalvajes.pdf'
rm metas.txt
rm temp.pdf