#!/bin/bash

echo $TARGETARCH

URL_IDENTIFIER=""
if [[ "$TARGETARCH" == "arm64" ]]; then
    URL_IDENTIFIER="linux.arm64"
elif [[ "$TARGETARCH" == "amd64" ]]; then
    URL_IDENTIFIER="linux.x86_64"
fi


wget -q https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}-${RELEASE_NAME}/Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_IDENTIFIER}.zip \
&& mkdir -p ~/.cache \
&& mkdir -p ~/.config/godot \
&& unzip Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_IDENTIFIER}.zip \
&& mv Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_IDENTIFIER} /usr/local/bin/godot \
&& rm -f Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_IDENTIFIER}.zip
