#!/bin/bash

rm -rf artifacts/downloads
mkdir -p artifacts/downloads
cd artifacts/downloads

: "${GODOT_VERSION:=4.6.1}"
: "${RELEASE_NAME:=stable}"

export GODOT_VERSION_STUB="${GODOT_VERSION}-${RELEASE_NAME}"

echo $GODOT_VERSION_STUB

wget https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION_STUB}/Godot_v${GODOT_VERSION_STUB}_linux.x86_64.zip \
&& wget https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION_STUB}/Godot_v${GODOT_VERSION_STUB}_linux.arm64.zip \
&& wget https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION_STUB}/Godot_v${GODOT_VERSION_STUB}_mono_linux_x86_64.zip \
&& wget https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION_STUB}/Godot_v${GODOT_VERSION_STUB}_mono_linux_arm64.zip \
&& wget https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION_STUB}/Godot_v${GODOT_VERSION_STUB}_export_templates.tpz \
&& wget https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION_STUB}/Godot_v${GODOT_VERSION_STUB}_mono_export_templates.tpz

