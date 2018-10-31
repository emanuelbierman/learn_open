#!/bin/bash

read -p "Enter lesson url: " url
git clone $url
# strip path
url=${url##*/}
# strip .git
url=${url%%.*}
# strip trailing carriage return
url="${url//'\r'}"
echo "Note: in order to change directories into the lesson automatically, run this script as a source instead (include \`. \` at the beginning of your command)"
echo "Moving into the lesson directory..."
cd ${url}
echo "Opening in atom..."
atom ./$url
echo "Installing dependencies..."
bundle install
echo "All set!"
echo "Note: opening in Atom currently generates a spurious blank file with the lesson name inside the lesson directory. You may safely close this generated blank file without saving."
echo "Note: if there are dependency compatibility issues you may need to run \`rvm use 2.3.3\`"