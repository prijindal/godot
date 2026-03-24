#!/bin/bash

rm -rf artifacts/standard
mkdir -p artifacts/standard
rm -rf artifacts/mono
mkdir -p artifacts/mono

: "${GODOT_VERSION:=4.6.1}"
: "${RELEASE_NAME:=stable}"

export GODOT_VERSION_STUB="${GODOT_VERSION}-${RELEASE_NAME}"

echo $GODOT_VERSION_STUB

unzip artifacts/downloads/Godot_v${GODOT_VERSION_STUB}_linux.arm64.zip -d artifacts/standard/ \
&& unzip artifacts/downloads/Godot_v${GODOT_VERSION_STUB}_linux.x86_64.zip -d artifacts/standard/ \
&& unzip artifacts/downloads/Godot_v${GODOT_VERSION_STUB}_mono_linux_arm64.zip -d artifacts/mono/ \
&& unzip artifacts/downloads/Godot_v${GODOT_VERSION_STUB}_mono_linux_x86_64.zip -d artifacts/mono/ \
&& unzip artifacts/downloads/Godot_v${GODOT_VERSION_STUB}_export_templates.tpz -d artifacts/standard/ \
&& unzip artifacts/downloads/Godot_v${GODOT_VERSION_STUB}_mono_export_templates.tpz -d artifacts/mono/ \

mkdir -p artifacts/standard/arm64
mkdir -p artifacts/standard/amd64

mv artifacts/standard/Godot_v${GODOT_VERSION_STUB}_linux.arm64 artifacts/standard/arm64/godot
mv artifacts/standard/Godot_v${GODOT_VERSION_STUB}_linux.x86_64 artifacts/standard/amd64/godot

mv artifacts/mono/Godot_v${GODOT_VERSION_STUB}_mono_linux_arm64 artifacts/mono/arm64
mv artifacts/mono/Godot_v${GODOT_VERSION_STUB}_mono_linux_x86_64 artifacts/mono/amd64

mv artifacts/mono/amd64/Godot_v${GODOT_VERSION_STUB}_mono_linux.x86_64 artifacts/mono/amd64/godot
mv artifacts/mono/arm64/Godot_v${GODOT_VERSION_STUB}_mono_linux.arm64 artifacts/mono/arm64/godot
