#!/bin/bash

#set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

curl -O http://get.sensiolabs.org/sami.phar

php ./sami.phar update sami.php
mkdir _site
cp -R api _site/
cd _site

git init
git config user.name "gossi"
git config user.email "github@gos.si"

git remote add upstream "https://$GH_TOKEN@github.com/gossi/php-code-generator.git"
git fetch upstream
git reset upstream/gh-pages

touch .

git add -A .
git commit -m "rebuild API at ${rev}"
git push upstream HEAD:gh-pages
