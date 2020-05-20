# syntax=docker/dockerfile:experimental

FROM paul/devbase:latest

MAINTAINER Paul Kirth

ENV HOME /root
WORKDIR $HOME

RUN mkdir -p $HOME/.ssh && ssh-keyscan github.com >> $HOME/.ssh/known_hosts
USER root
WORKDIR $HOME
RUN wget -nc https://dl.bintray.com/boostorg/release/1.70.0/source/boost_1_70_0.tar.gz \
                    && tar xf boost_1_70_0.tar.gz \
                    && cd boost_1_70_0/ \
                    && ./bootstrap.sh \
                    &&  sudo ./b2 -j2 -d0 install --cflags="-fPIC" --cxxflags="-fPIC" --prefix=/usr/ \
                    && rm -rf boost_1_70_0.tar.gz boost_1_70_0

RUN --mount=type=ssh git clone -b june_2019 --recursive git@github.com:securesystemslab/rust-priv.git rust
RUN --mount=type=ssh git clone git@github.com:ilovepi/sea-dsa.git rust/src/llvm-project/llvm/projects/sea-dsa
RUN --mount=type=ssh git clone git@github.com:securesystemslab/servo -b june_2019
WORKDIR $HOME/rust
COPY config.toml .

RUN python3 x.py build -i
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly -y
RUN $HOME/.cargo/bin/rustup toolchain link mpk2 /root/rust/build/x86_64-unknown-linux-gnu/stage2

WORKDIR $HOME/workspace



#RUN mkdir build && cd build && cmake .. -DCMAKE_C_COMPILER=$HOME/clang/bin/clang -DCMAKE_CXX_COMPILER=$HOME/clang/bin/clang++ -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DPHASAR_BUILD_UNITTESTS=ON -GNinja
#WORKDIR $HOME/workspace/phasar/build
#RUN ninja



# Run zsh as login shell
ENTRYPOINT ["/usr/bin/zsh"]
CMD ["--login"]
