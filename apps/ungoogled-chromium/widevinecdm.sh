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
echo "Resolving latest go-crx3 release..."
GO_CRX3_RELEASE_JSON="$(curl -fsSL https://api.github.com/repos/m1k1o/go-crx3/releases/latest || true)"
GO_CRX3_URL="$(
    printf '%s' "$GO_CRX3_RELEASE_JSON" \
    | jq -r '.assets[]?.browser_download_url | select(test("linux_amd64\\.tar\\.gz$"))' \
    | head -n1
)"

if [ -z "$GO_CRX3_URL" ]; then
    GO_CRX3_URL="https://github.com/m1k1o/go-crx3/releases/download/v1.6.1/go-crx3_1.6.1_linux_amd64.tar.gz"
    echo "GitHub API did not return a usable release asset, using fallback: $GO_CRX3_URL"
fi

echo "Downloading $GO_CRX3_URL"
curl -fL -o go-crx3.tar.gz "$GO_CRX3_URL"
tar -xzf go-crx3.tar.gz

# Unpack with go-crx3
./go-crx3 unpack widevinecdm.crx
mkdir -p "$TARGET_DIR"
cp -ar widevinecdm/* "$TARGET_DIR"
