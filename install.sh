#!/bin/bash
WORKSPACE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd $WORKSPACE_ROOT

sudo apt install wget

git submodule update --init --recursive

catkin init
catkin config --extend /opt/ros/noetic --cmake-args -DPYTHON_EXECUTABLE=/usr/bin/python3 -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda -Wno-dev

cd $WORKSPACE_ROOT
rm -rf src/blender-3.1.2-linux-x64
wget https://download.blender.org/release/Blender3.1/blender-3.1.2-linux-x64.tar.xz
tar -xf blender-3.1.2-linux-x64.tar.xz
rm -f blender-3.1.2-linux-x64.tar.xz
mv blender-3.1.2-linux-x64 $WORKSPACE_ROOT/src

BLENDER_ADDONS_DIR="$WORKSPACE_ROOT/src/blender-3.1.2-linux-x64/3.1/scripts/addons"
ln -sfn "$WORKSPACE_ROOT/src/urdf_importer/urdf_importer_addon" "$BLENDER_ADDONS_DIR/urdf_importer_addon"