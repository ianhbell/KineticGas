#!/usr/bin/env bash
# Script to build the KineticGas module and run tests. Can be used with options
set -e

py_version=${1-"-DPYBIND11_PYTHON_VERSION=3 -DPYTHON_EXECUTABLE=$(which python)"}

echo "Building KineticGas Release"

[ ! -d "cpp/release" ] && mkdir cpp/release
cd cpp/release
cmake -DCMAKE_BUILD_TYPE=Release "${py_version}" ..
cmake --build .
cd ../..
echo "Copying binary to ${PWD}/pykingas/KineticGas_r.so"
[ -f "pykingas/KineticGas_r.so" ] && rm pykingas/KineticGas_r.so
cp cpp/release/KineticGas_r.* pykingas/KineticGas_r.so