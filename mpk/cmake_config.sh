#! /bin/sh

BUILD_TYPE=Release
ACTIVE_SANITIZER=""
LLVM_SRCDIR=$PWD/..
PROJECTS="clang;clang-tools-extra;libcxx;libcxxabi;libunwind;lld;lldb;compiler-rt;lld;polly;debuginfo-tests;openmp;parallel-libs"

cmake -GNinja                              \
  -DCMAKE_BUILD_TYPE=${BUILD_TYPE}         \
  -DCMAKE_C_COMPILER=clang                 \
  -DCMAKE_CXX_COMPILER=clang++             \
  -DCMAKE_INSTALL_PREFIX=${HOME}/clang     \
  -DLLVM_ENABLE_PROJECTS=${PROJECTS}       \
  -DLLVM_USE_SANITIZER=${ACTIVE_SANITIZER} \
  -DLLVM_ENABLE_BINDINGS=OFF               \
  -DLLVM_ENABLE_LIBCXX=ON                  \
  -DLLVM_ENABLE_RTTI=ON                    \
  -DLLVM_ENABLE_EH=ON                      \
  -DBUILD_SHARED_LIBS=ON                   \
  -DLLVM_ENABLE_LLD=ON                     \
  -DLLVM_CCACHE_BUILD=ON                   \
  ${LLVM_SRCDIR}/llvm
