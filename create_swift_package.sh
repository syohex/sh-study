#!/usr/bin/env bash
set -e

if ! command -v swift >/dev/null 2>/dev/null; then
    echo "Swift is not installed yet!!"
    exit 1
fi

PACKAGE_NAME=$1
if [[ $PACKAGE_NAME == "" ]]; then
    PACKAGE_NAME=$(basename $PWD)
fi

SWIFT_VERSION=$(swift --version | perl -wln -e 'm{^Swift version (\d+\.\d+)\.\d+} and print "${1}.0"')

cat <<EOF > Package.swift
// swift-tools-version:${SWIFT_VERSION}

import PackageDescription

let package = Package(
    name: "${PACKAGE_NAME}",
    dependencies: [],
    targets: [
        .executableTarget(
            name: "${PACKAGE_NAME}",
            dependencies: []),
    ]
)
EOF

mkdir -p "Sources/${PACKAGE_NAME}"
echo 'print("Hello")' > "Sources/${PACKAGE_NAME}/main.swift"
