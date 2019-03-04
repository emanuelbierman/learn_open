#!/bin/bash
# run with `source ./learn.sh`
read -p "Enter lesson url: " url
git clone $url
# strip path
url=${url##*/}
# strip .git
url=${url%%.*}
# strip trailing carriage return
url="${url//'\r'}"

echo "Moving into the lesson directory..."
cd ${url}

echo "Opening in atom..."
atom ./$url

echo "Installing dependencies..."
bundle install

echo "Running 'learn' command..."
learn
echo "All set!"

echo "Note: in order for this script to change directories into the lesson automatically, run this script as a source instead (include \`. \` or \`source\` at the beginning of your command)"
echo "Note: opening in Atom currently generates a spurious blank file with the lesson name inside the lesson directory. You may safely close this generated blank file without saving."
echo "Note: if there are dependency compatibility issues you may need to run \`rvm use 2.3.3\`"
echo "Note: if you have an issue with bundler compatibility, run these commands:"
echo "      gem install bundler -v '1.5.0'"
echo "      gem install json -v '1.8.6'"
echo "      gem install byebug"
echo "      bundle _1.5.0_ update"

echo "Happy coding!"
# url="${url//'\r'}"
# echo "cd ${url//'\n'}"
# cd "${url//'\r'}"
# cd "${url//'\n'}"
