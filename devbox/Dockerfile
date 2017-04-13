FROM debian:stretch

MAINTAINER Paul Kirth

ENV DEBIAN_FRONTEND noninteractive
# add ppas
# apt-fast
#RUN add-apt-repository ppa:apt-fast/stable
#RUN apt-get update
#RUN apt-get -y install apt-fast

# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5
# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32

# add neovim repo
#RUN add-apt-repository -y ppa:neovim-ppa/unstable

#get and install packages
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get -y install software-properties-common
RUN apt-get install -y build-essential
RUN apt-get install -y sudo
RUN apt-get install -y lsb
RUN apt-get install -y vim
RUN apt-get install -y neovim
RUN apt-get install -y zsh
RUN apt-get install -y git
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN apt-get install -y bison
RUN apt-get install -y flex
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y python-pip
RUN apt-get install -y byobu
RUN apt-get install -y tmux
RUN apt-get install -y autotools-dev
RUN apt-get install -y autoconf
RUN apt-get install -y ninja-build
RUN apt-get install -y python3
RUN apt-get install -y python3-dev
RUN apt-get install -y python3-pip
RUN apt-get install -y exuberant-ctags
RUN apt-get install -y ruby
RUN apt-get install -y rake
RUN apt-get install -y npm
RUN apt-get install -y nodejs
RUN apt-get install -y ack-grep
RUN apt-get install -y silversearcher-ag
RUN apt-get install -y apt-transport-https
RUN apt-get install -y cmake
RUN apt-get install -y docker
RUN apt-get install -y libgmp-dev
RUN apt-get install -y libmpc-dev
RUN apt-get install -y libmpfr-dev
RUN apt-get install -y nasm
RUN apt-get install -y texinfo
RUN apt-get install -y openssl
RUN apt-get install -y libssl-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y stow
RUN apt-get install -y libpcre3-dev
RUN apt-get install -y clang
RUN apt-get install -y clang-format
RUN apt-get install -y clang-tidy
# RUN apt-get install -y linux-headers-$(uname -r)
RUN apt-get install -y openssh-server
RUN apt-get install -y emacs
RUN apt-get install -y man
RUN apt-get install -y keychain


## Set the locale
#RUN locale-gen en_US.UTF-8
#ENV LANG en_US.UTF-8
#ENV LANGUAGE en_US:en
#ENV LC_ALL en_US.UTF-8


## Add the damon user, with passwordless sudo
RUN useradd --user-group \
            --create-home \
            --shell /usr/bin/zsh \
            paul && \
            echo 'paul ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

#switch to paul user and /home/paul directory
USER paul
ENV HOME /home/paul
WORKDIR /home/paul

RUN mkdir .zsh
RUN curl -sL zplug.sh/installer | zsh
RUN git clone https://github.com/ilovepi/spacemacs $HOME/.emacs.d
RUN git clone https://github.com/ilovepi/dotfiles.git
RUN ln -s dotfiles/.zshrc $HOME


# install spf13 vim
#RUN sh <(curl https://j.mp/spf13-vim3 -L)

# Run zsh as login shell
ENTRYPOINT ["/usr/bin/zsh"]
CMD ["--login"]
