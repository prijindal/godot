#!/bin/bash

echo $TARGETARCH

URL_INDENTIFIER=""
URL_ZIP_IDENTIFIER=""
if [[ "$IS_MONO" == "true"]]; then
    URL_ZIP_IDENTIFIER="mono_"
    if [[ "$TARGETARCH" == "arm64" ]];then
        URL_INDENTIFIER="mono_linux_arm64.zip"
    fi
    elif [[ "$TARGETARCH" == "amd64" ]];then
        URL_INDENTIFIER="mono_linux_x86_64.zip"
    fi
else
    if [[ "$TARGETARCH" == "arm64" ]];then
        URL_INDENTIFIER="linux.arm64.zip"
    fi
    elif [[ "$TARGETARCH" == "amd64" ]];then
        URL_INDENTIFIER="linux.x86_64.zip"
    fi
fi



wget https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}-${RELEASE_NAME}/Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_INDENTIFIER}.zip \
&& wget https://github.com/godotengine/godot-builds/releases/download/${GODOT_VERSION}-${RELEASE_NAME}/Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_ZIP_IDENTIFIER}export_templates.tpz \
&& mkdir -p ~/.cache \
&& mkdir -p ~/.config/godot \
&& mkdir -p ~/.local/share/godot/export_templates/${GODOT_VERSION}.${RELEASE_NAME} \
&& unzip Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_INDENTIFIER}.zip \
&& mv Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_INDENTIFIER} /usr/local/bin/godot \
&& unzip Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_ZIP_INDENTIFIER}export_templates.tpz \
&& mv templates/* ~/.local/share/godot/export_templates/${GODOT_VERSION}.${RELEASE_NAME} \
&& rm -f Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_ZIP_INDENTIFIER}export_templates.tpz Godot_v${GODOT_VERSION}-${RELEASE_NAME}_${URL_INDENTIFIER}.zip
