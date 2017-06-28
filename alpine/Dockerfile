FROM alpine:latest

MAINTAINER Paul Kirth


ENV DEBIAN_FRONTEND noninteractive

#get and install packages
RUN apk add --update 
RUN apk add  vim musl-dev
RUN apk add  libtool
RUN apk add  alpine-sdk build-base
RUN apk add  ncurses ncurses-dev ncurses-libs ncurses-terminfo
RUN apk add  neovim
RUN apk add  zsh
RUN apk add  git
RUN apk add  gcc
RUN apk add  g++
RUN apk add  bison
RUN apk add  flex
RUN apk add  wget
RUN apk add  curl
RUN apk add  py-pip
RUN apk add  byobu
RUN apk add  tmux
RUN apk add  automake autoconf
RUN apk add  autoconf
RUN apk add  ninja
RUN apk add  python3
RUN apk add  ctags
RUN apk add  ruby
RUN apk add  ruby-rake
RUN apk add  nodejs
RUN apk add  grep
RUN apk add  ack
RUN apk add  cmake
RUN apk add  docker
RUN apk add  gmp
RUN apk add  mpc
RUN apk add  nasm
RUN apk add  texinfo
RUN apk add  openssl
RUN apk add  stow
RUN apk add  clang
RUN apk add  openssh
RUN apk add  emacs
RUN apk add  util-linux
RUN apk add  pciutils
RUN apk add  usbutils
RUN apk add  coreutils
RUN apk add  binutils
RUN apk add  findutils
RUN apk add  man
RUN apk add  man-pages

## Set the locale
#RUN locale-gen en_US.UTF-8
#ENV LANG en_US.UTF-8
#ENV LANGUAGE en_US:en
#ENV LC_ALL en_US.UTF-8


RUN adduser -S paul -s /usr/bin/zsh -D
RUN echo 'paul ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# Add the user, with passwordless sudo
# RUN useradd --user-group \
#             --create-home \
#             --shell /usr/bin/zsh \
#             paul && \
#             echo 'paul ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

#switch to paul user and /home/paul directory
USER paul
ENV HOME /home/paul
WORKDIR /home/paul

#ENV SSH_ASKPASS=

#ADD id_rsa $HOME/.ssh/id_rsa


#RUN eval `ssh-agent -s`
#RUN ssh-add /home/paul/id_rsa
#$HOME/.ssh/id_rsa

# RUN git clone https://github.com/tarjoilija/zgen.git
# RUN git clone https://github.com/unixorn/zsh-quickstart-kit.git
# RUN cd zsh-quickstart-kit/ && stow --target=$HOME zsh && cd ..

RUN mkdir .zsh
RUN curl -sL zplug.sh/installer | zsh
RUN git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
RUN git clone https://github.com/ilovepi/dotfiles.git
RUN ln -s dotfiles/.zshrc $HOME

# install spf13 vim
#RUN sh <(curl https://j.mp/spf13-vim3 -L)

# Run zsh as login shell
ENTRYPOINT ["/bin/zsh"]
CMD ["--login"]
