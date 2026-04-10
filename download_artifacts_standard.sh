#!/bin/bash

rm -rf artifacts/downloads
mkdir -p artifacts/downloads
rm -rf artifacts/standard
mkdir -p artifacts/standard

: "${GODOT_VERSION:=4.6.1}"
: "${RELEASE_NAME:=stable}"

export GODOT_VERSION_STUB="${GODOT_VERSION}-${RELEASE_NAME}"

echo $GODOT_VERSION_STUB

wget -q -O artifacts/downloads/linux.x86_64.zip "https://downloads.godotengine.org/?version=${GODOT_VERSION}&flavor=${RELEASE_NAME}&slug=linux.x86_64.zip&platform=linux.64" \
& wget -q -O artifacts/downloads/linux.arm64.zip "https://downloads.godotengine.org/?version=${GODOT_VERSION}&flavor=${RELEASE_NAME}&slug=linux.arm64.zip&platform=linux.arm64" \
& wget -q -O artifacts/downloads/export_templates.tpz "https://downloads.godotengine.org/?version=${GODOT_VERSION}&flavor=${RELEASE_NAME}&slug=export_templates.tpz&platform=templates" \
& wait

unzip artifacts/downloads/linux.arm64.zip -d artifacts/standard/ \
&& unzip artifacts/downloads/linux.x86_64.zip -d artifacts/standard/ \
&& unzip artifacts/downloads/export_templates.tpz -d artifacts/standard/

mkdir -p artifacts/standard/arm64
mkdir -p artifacts/standard/amd64

mv artifacts/standard/Godot_v${GODOT_VERSION_STUB}_linux.arm64 artifacts/standard/arm64/godot
mv artifacts/standard/Godot_v${GODOT_VERSION_STUB}_linux.x86_64 artifacts/standard/amd64/godot
