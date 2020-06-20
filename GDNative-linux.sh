#!/bin/sh

cd native
git init
mv godot-cpp godot-cpp.old
git submodule add https://github.com/GodotNativeTools/godot-cpp
git submodule update --init --recursive
cd godot-cpp
scons platform=linux generate_bindings=yes
cd ..
scons platform=linux
sed -i '/"Windows": true/a \        \"Linux": true' factory.gd
sed -i '/hterrain_native.dll/a X11.64 = "res://addons/zylann.hterrain/native/bin/linux/libhterrain_native.so" ' hterrain.gdnlib
