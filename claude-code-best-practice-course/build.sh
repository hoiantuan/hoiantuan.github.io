#!/bin/bash
# Assembles the course from parts.
# Run from the course directory: bash build.sh
set -e

echo "Building language files..."
cat _base.html modules/en/*.html _footer.html > index.html
echo " - Built index.html (English) ✅"

cat _base.html modules/vi/*.html _footer.html > index_vi.html
echo " - Built index_vi.html (Vietnamese) ✅"

cat _base.html modules/ja/*.html _footer.html > index_ja.html
echo " - Built index_ja.html (Japanese) ✅"

echo "All builds completed."
