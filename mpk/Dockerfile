# syntax=docker/dockerfile:experimental

FROM paul/dev-box:latest

MAINTAINER Paul Kirth

RUN sudo apt update                   \
         && sudo apt install -y       \
                 bat                  \
                 build-essential      \
                 ccache               \
                 g++                  \
                 graphviz             \
                 libc++-dev           \
                 libcurl4-openssl-dev \
                 libedit-dev          \
                 libncurses5-dev      \
                 libncursesw5-dev     \
                 libsqlite3-dev       \
                 libxml2              \
                 libxml2-dev          \
                 python3              \
                 python3-pip          \
                 sqlite3              \
                 swig                 \
                 z3                   \
                 zlib1g               \
                 zlib1g-dev           \
        && sudo apt-get autoremove -y \
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

#RUN mkdir -p $HOME/.ssh && ssh-keyscan github.com >> $HOME/.ssh/known_hosts
#USER root
#RUN mkdir -p /root/.ssh && ssh-keyscan github.com >> /root/.ssh/known_hosts
#RUN --mount=type=ssh git clone git@github.com:securesystemslab/rust-priv.git rust
#RUN --mount=type=ssh git clone https://github.com/ilovepi/sea-dsa.git rust/src/llvm-project/llvm/projects/
#WORKDIR $HOME/workspace/rust
#COPY config.toml .
#RUN python3 x.py build -i


WORKDIR $HOME/workspace

#RUN mkdir build && cd build && cmake .. -DCMAKE_C_COMPILER=$HOME/clang/bin/clang -DCMAKE_CXX_COMPILER=$HOME/clang/bin/clang++ -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DPHASAR_BUILD_UNITTESTS=ON -GNinja
#WORKDIR $HOME/workspace/phasar/build
#RUN ninja



# Run zsh as login shell
ENTRYPOINT ["/usr/bin/zsh"]
CMD ["--login"]
