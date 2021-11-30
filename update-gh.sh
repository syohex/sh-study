#!/usr/bin/env bash
set -e
set -x

VERSION=$1
if [[ $VERSION == "" ]]; then
    echo "Usage: update-gh version"
    exit 1
fi

BASE="gh_${VERSION}_linux_amd64.tar.gz"
DIR="gh_${VERSION}_linux_amd64"
URL="https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz"
curl -LO $URL

tar xf $BASE
cp ${DIR}/bin/gh ~/bin/gh
chmod +x ~/bin/gh

rm -f $BASE
rm -rf "$DIR"

mkdir -p ~/.zsh/completions
gh completion --shell zsh > ~/.zsh/completions/_gh

echo '########'
gh version
echo '########'
