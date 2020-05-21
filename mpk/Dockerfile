# syntax=docker/dockerfile:experimental

FROM paul/devbase:latest

MAINTAINER Paul Kirth

RUN sudo apt update                               \
         && sudo apt install -y                   \
                 autoconf                         \
                 autoconf2.13                     \
                 build-essential                  \
                 ccache                           \
                 clang                            \
                 cmake                            \
                 curl                             \
                 g++                              \
                 git                              \
                 gperf                            \
                 graphviz                         \
                 libbz2-dev                       \
                 libc++-dev                       \
                 libcurl4-openssl-dev             \
                 libdbus-1-dev                    \
                 libedit-dev                      \
                 libegl1-mesa-dev                 \
                 libfreetype6-dev                 \
                 libgl1-mesa-dri                  \
                 libgles2-mesa-dev                \
                 libglib2.0-dev                   \
                 libglu1-mesa-dev                 \
                 libgstreamer-plugins-bad1.0-dev  \
                 libgstreamer-plugins-base1.0-dev \
                 libgstreamer1.0-dev              \
                 libharfbuzz-dev                  \
                 liblzma-dev                      \
                 libncurses5-dev                  \
                 libncursesw5-dev                 \
                 libosmesa6-dev                   \
                 libsqlite3-dev                   \
                 libssl-dev                       \
                 libunwind-dev                    \
                 libx11-dev                       \
                 libxml2                          \
                 libxml2-dev                      \
                 libxmu-dev                       \
                 libxmu6                          \
                 python-pip                       \
                 python3                          \
                 python3-dev                      \
                 python3-pip                      \
                 sqlite3                          \
                 swig                             \
                 virtualenv                       \
                 xorg-dev                         \
                 z3                               \
                 zlib1g                           \
                 zlib1g-dev                       \
        && sudo apt-get autoremove -y             \
        && sudo apt-get clean

RUN mkdir $HOME/workspace
WORKDIR  $HOME/workspace
RUN sudo ln -sf /usr/bin/ld.lld /usr/bin/ld
RUN wget -nc https://dl.bintray.com/boostorg/release/1.70.0/source/boost_1_70_0.tar.gz \
                    && tar xf boost_1_70_0.tar.gz \
                    && cd boost_1_70_0/ \
                    && ./bootstrap.sh \
                    &&  sudo ./b2 -j2 -d0 install --cflags="-fPIC" --cxxflags="-fPIC" --prefix=/usr/ \
                    && rm -rf boost_1_70_0.tar.gz boost_1_70_0

RUN mkdir -p $HOME/.ssh && ssh-keyscan github.com >> $HOME/.ssh/known_hosts
RUN --mount=type=ssh git clone -b june_2019 --recursive git@github.com:securesystemslab/rust-priv.git rust
RUN --mount=type=ssh git clone https://github.com/ilovepi/sea-dsa.git rust/src/llvm-project/llvm/projects/
RUN --mount=type=ssh git clone git@github.com:securesystemslab/servo -b june_2019
WORKDIR $HOME/workspace/rust
COPY config.toml .
RUN python x.py build -i


WORKDIR $HOME/workspace

#RUN mkdir build && cd build && cmake .. -DCMAKE_C_COMPILER=$HOME/clang/bin/clang -DCMAKE_CXX_COMPILER=$HOME/clang/bin/clang++ -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DPHASAR_BUILD_UNITTESTS=ON -GNinja
#WORKDIR $HOME/workspace/phasar/build
#RUN ninja



# Run zsh as login shell
ENTRYPOINT ["/usr/bin/zsh"]
CMD ["--login"]
