#!/bin/bash
WORKSPACE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd $WORKSPACE_ROOT
source ./devel/setup.bash
./src/blender-3.1.2-linux-x64/blender