#!/bin/bash
# Assembles the course from parts.
# Run from the course directory: bash build.sh
set -e

# EN Build
awk '/<!-- MODULES_CONTENT -->/{system("cat modules/en/*.html");next}1' _base.html > index_temp.html
cat index_temp.html _footer.html > index.html

# VI Build
awk '/<!-- MODULES_CONTENT -->/{system("cat modules/vi/*.html");next}1' _base.html > index_temp_vi.html
# Update active state in nav for VI
sed 's/class="active">EN/class="">EN/g' index_temp_vi.html | sed 's/href="index_vi.html">VI/href="index_vi.html" class="active">VI/g' > index_temp_vi2.html
cat index_temp_vi2.html _footer.html > index_vi.html

# JA Build
awk '/<!-- MODULES_CONTENT -->/{system("cat modules/ja/*.html");next}1' _base.html > index_temp_ja.html
# Update active state in nav for JA
sed 's/class="active">EN/class="">EN/g' index_temp_ja.html | sed 's/href="index_ja.html">JA/href="index_ja.html" class="active">JA/g' > index_temp_ja2.html
cat index_temp_ja2.html _footer.html > index_ja.html

# Cleanup
rm index_temp*

echo "Built index.html, index_vi.html, index_ja.html!"
