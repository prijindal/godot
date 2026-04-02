#!/bin/bash

rm -rf artifacts/downloads
mkdir -p artifacts/downloads
rm -rf artifacts/standard
mkdir -p artifacts/standard

cd artifacts/downloads

: "${GODOT_VERSION:=4.6.1}"
: "${RELEASE_NAME:=stable}"

export GODOT_VERSION_STUB="${GODOT_VERSION}-${RELEASE_NAME}"

echo $GODOT_VERSION_STUB

wget -q https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION_STUB}/Godot_v${GODOT_VERSION_STUB}_linux.x86_64.zip \
&& wget -q https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION_STUB}/Godot_v${GODOT_VERSION_STUB}_linux.arm64.zip \
&& wget -q https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION_STUB}/Godot_v${GODOT_VERSION_STUB}_export_templates.tpz

cd ../../

unzip artifacts/downloads/Godot_v${GODOT_VERSION_STUB}_linux.arm64.zip -d artifacts/standard/ \
&& unzip artifacts/downloads/Godot_v${GODOT_VERSION_STUB}_linux.x86_64.zip -d artifacts/standard/ \
&& unzip artifacts/downloads/Godot_v${GODOT_VERSION_STUB}_export_templates.tpz -d artifacts/standard/

mkdir -p artifacts/standard/arm64
mkdir -p artifacts/standard/amd64

mv artifacts/standard/Godot_v${GODOT_VERSION_STUB}_linux.arm64 artifacts/standard/arm64/godot
mv artifacts/standard/Godot_v${GODOT_VERSION_STUB}_linux.x86_64 artifacts/standard/amd64/godot
