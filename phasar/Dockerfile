FROM paul/devbox:latest

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
                 python               \
                 python-dev           \
                 python-pip           \
                 python-sphinx        \
                 python3              \
                 python3-pip          \
                 sqlite3              \
                 swig                 \
                 z3                   \
                 zlib1g               \
                 zlib1g-dev           \
        && sudo apt upgrade -y        \
        && sudo apt-get autoremove -y \
        && sudo apt-get clean

RUN mkdir $HOME/workspace
WORKDIR  $HOME/workspace
RUN sudo ln -sf /usr/bin/ld.lld /usr/bin/ld
RUN wget -nc https://dl.bintray.com/boostorg/release/1.70.0/source/boost_1_70_0.tar.gz \
                    && tar xf boost_1_70_0.tar.gz \
                    && cd boost_1_70_0/ \
                    && ./bootstrap.sh 1> /dev/null \
                    &&  sudo ./b2 -j2 -d0 install -cflags="-fPIC" -cxxflags="-fPIC" --prefix=/usr/ \
                    && rm -rf boost_1_70_0.tar.gz boost_1_70_0
RUN git clone https://github.com/secure-software-engineering/phasar --recursive -b development
RUN git clone https://github.com/ilovepi/phasar myphasar --recursive -b development
RUN git clone https://github.com/ilovepi/llvm-project -b rustc/8.0-2019-03-18
WORKDIR $HOME/workspace/llvm-project
COPY cmake_config.sh .

RUN mkdir build && cd build && ../cmake_config.sh && ninja
RUN cd build && ninja install
WORKDIR $HOME/workspace/myphasar
#RUN mkdir build && cd build && cmake .. -DCMAKE_C_COMPILER=$HOME/clang/bin/clang -DCMAKE_CXX_COMPILER=$HOME/clang/bin/clang++ -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DPHASAR_BUILD_UNITTESTS=ON -GNinja
#WORKDIR $HOME/workspace/phasar/build
#RUN ninja



# Run zsh as login shell
ENTRYPOINT ["/usr/bin/zsh"]
CMD ["--login"]
