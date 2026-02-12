#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR="$(realpath "$1")"
if [ -z "$TARGET_DIR" ]; then
    echo "Usage: $0 /path/to/install/WidevineCdm"
    exit 1
fi

TMPDIR=$(mktemp -d)
cd "$TMPDIR"

function cleanup {
    rm -rf "$TMPDIR"
}
trap cleanup EXIT

# Fetch manifest and extract URL
URL=$(python3 -c "
import json, urllib.request
data = json.load(urllib.request.urlopen('https://raw.githubusercontent.com/mozilla/gecko-dev/master/toolkit/content/gmp-sources/widevinecdm.json'))
for v in data['vendors'].values():
    for k, p in v['platforms'].items():
        if 'Linux_x86_64-gcc3' in k:
            print(p['fileUrl'])
            break
")

# Download CRX
curl -L -o widevinecdm.crx "$URL"

# Install go-crx3
GO_CRX3_TAG="${GO_CRX3_TAG:-}"
if [ -z "$GO_CRX3_TAG" ]; then
    echo "Resolving latest go-crx3 release tag..."
    GO_CRX3_TAG="$(curl -fsSL https://api.github.com/repos/m1k1o/go-crx3/releases/latest | jq -r '.tag_name // empty' || true)"
fi
if [ -z "$GO_CRX3_TAG" ]; then
    GO_CRX3_TAG="v1.6.1"
    echo "Could not resolve latest go-crx3 tag, using fallback tag: $GO_CRX3_TAG"
fi

GO_CRX3_VERSION="${GO_CRX3_TAG#v}"
GO_CRX3_ARTIFACT="go-crx3_${GO_CRX3_VERSION}_linux_amd64.tar.gz"
GO_CRX3_URL="https://github.com/m1k1o/go-crx3/releases/download/${GO_CRX3_TAG}/${GO_CRX3_ARTIFACT}"

echo "Downloading $GO_CRX3_URL"
curl -fL -o go-crx3.tar.gz "$GO_CRX3_URL"
tar -xzf go-crx3.tar.gz

# Unpack with go-crx3
./go-crx3 unpack widevinecdm.crx
mkdir -p "$TARGET_DIR"
cp -ar widevinecdm/* "$TARGET_DIR"
