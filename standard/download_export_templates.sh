#!/bin/bash

wget -q https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}-${RELEASE_NAME}/Godot_v${GODOT_VERSION}-${RELEASE_NAME}_export_templates.tpz \
&& mkdir -p ~/.local/share/godot/export_templates/${GODOT_VERSION}.${RELEASE_NAME} \
&& unzip Godot_v${GODOT_VERSION}-${RELEASE_NAME}_export_templates.tpz \
&& mv templates/* ~/.local/share/godot/export_templates/${GODOT_VERSION}.${RELEASE_NAME} \
&& rm -f Godot_v${GODOT_VERSION}-${RELEASE_NAME}_export_templates.tpz
