#!/bin/bash

echo $TARGETARCH

URL_IDENTIFIER=""
PLATFORM="linux.x86_64"
if [[ "$TARGETARCH" == "arm64" ]]; then
    URL_IDENTIFIER="mono_linux_arm64"
    PLATFORM="linux.arm64"
elif [[ "$TARGETARCH" == "amd64" ]]; then
    URL_IDENTIFIER="mono_linux_x86_64"
fi

wget -q https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}-${RELEASE_NAME}/Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_IDENTIFIER}.zip \
&& mkdir -p ~/.cache \
&& mkdir -p ~/.config/godot \
&& unzip Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_IDENTIFIER}.zip \
&& mv Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_IDENTIFIER}/Godot_v${GODOT_VERSION}-${RELEASE_NAME}_mono_${PLATFORM} /usr/local/bin/godot \
&& mv Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_IDENTIFIER}/GodotSharp /usr/local/bin/GodotSharp \
&& rm -f Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_IDENTIFIER}.zip
