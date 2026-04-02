#!/bin/bash

rm -rf artifacts/downloads
mkdir -p artifacts/downloads
rm -rf artifacts/mono
mkdir -p artifacts/mono

cd artifacts/downloads

: "${GODOT_VERSION:=4.6.1}"
: "${RELEASE_NAME:=stable}"

export GODOT_VERSION_STUB="${GODOT_VERSION}-${RELEASE_NAME}"

echo $GODOT_VERSION_STUB

wget -q https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION_STUB}/Godot_v${GODOT_VERSION_STUB}_mono_linux_x86_64.zip \
&& wget -q https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION_STUB}/Godot_v${GODOT_VERSION_STUB}_mono_linux_arm64.zip \
&& wget -q https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION_STUB}/Godot_v${GODOT_VERSION_STUB}_mono_export_templates.tpz


cd ../../

unzip artifacts/downloads/Godot_v${GODOT_VERSION_STUB}_mono_linux_arm64.zip -d artifacts/mono/ \
&& unzip artifacts/downloads/Godot_v${GODOT_VERSION_STUB}_mono_linux_x86_64.zip -d artifacts/mono/ \
&& unzip artifacts/downloads/Godot_v${GODOT_VERSION_STUB}_mono_export_templates.tpz -d artifacts/mono/

mv artifacts/mono/Godot_v${GODOT_VERSION_STUB}_mono_linux_arm64 artifacts/mono/arm64
mv artifacts/mono/Godot_v${GODOT_VERSION_STUB}_mono_linux_x86_64 artifacts/mono/amd64

mv artifacts/mono/amd64/Godot_v${GODOT_VERSION_STUB}_mono_linux.x86_64 artifacts/mono/amd64/godot
mv artifacts/mono/arm64/Godot_v${GODOT_VERSION_STUB}_mono_linux.arm64 artifacts/mono/arm64/godot
