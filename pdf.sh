#!/bin/bash

php ./tools/generateDocs.php > ./metas.txt
chromium --no-sandbox --headless --gpu --no-pdf-header-footer --print-to-pdf=./CultosSalvajes.pdf ./temp.html
pdftk 'CultosSalvajes.pdf' update_info_utf8 'metas.txt' output 'temp.pdf'
rm metas.txt
./tools/pagination.sh temp.pdf CultosSalvajes.pdf
rm temp.pdf
rm temp.html