FROM debian:unstable

MAINTAINER Paul Kirth

ENV DEBIAN_FRONTEND noninteractive

#get and install packages
RUN apt-get update &&               \
       apt-get upgrade -y &&        \
       apt-get install -y apt-utils \
       software-properties-common   \
       build-essential              \
       sudo                         \
       vim-gtk                      \
       neovim                       \
       zsh                          \
       git                          \
       git-extras                   \
       git-flow                     \
       gcc                          \
       g++                          \
       golang-go                    \
       bison                        \
       flex                         \
       wget                         \
       curl                         \
       byobu                        \
       tmux                         \
       autotools-dev                \
       autoconf                     \
       ninja-build                  \
       python-pip                   \
       python3                      \
       python3-dev                  \
       python3-pip                  \
       exuberant-ctags              \
       ruby                         \
       rake                         \
       nodejs                       \
       ack-grep                     \
       apt-transport-https          \
       cmake                        \
       docker                       \
       libgmp-dev                   \
       libmpc-dev                   \
       libmpfr-dev                  \
       nasm                         \
       texinfo                      \
       openssl                      \
       libssl-dev                   \
       libxml2-dev                  \
       stow                         \
       libpcre3-dev                 \
       clang                        \
       clangd                       \
       clang-format                 \
       clang-tidy                   \
       lld                          \
       llvm                         \
       llvm-dev                     \
       openssh-server               \
       emacs                        \
       man                          \
       keychain                     \
       locales                      \
       locales-all                  \
       locate                       \
       fd-find                      \
       ripgrep                      \
       bat                          \
    && apt-get autoremove -y && apt-get clean
       #lsb                          \
       #nodejs-legacy                \


## Set the locale
RUN locale-gen "en_US.UTF-8"
ENV LANG "en_US.UTF-8"
ENV LANGUAGE "en_US:en"
ENV LC_ALL "en_US.UTF-8"
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8


## Add the paul user, with passwordless sudo
RUN useradd --user-group \
            --create-home \
            --shell /usr/bin/zsh \
            paul && \
            echo 'paul ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

#switch to paul user and /home/paul directory
USER paul
ENV HOME /home/paul
ENV USER paul
WORKDIR /home/paul


RUN mkdir -p $HOME/.config
#RUN curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
RUN git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
RUN git clone -b experiment --recursive https://github.com/ilovepi/dotfiles.git

WORKDIR /home/paul/dotfiles
RUN mv $HOME/.zshrc $HOME/.zshrc.bak
RUN stow --target=$HOME zsh git vim spacemacs tmux byobu
RUN stow --target=$HOME/.config config
RUN git remote set-url origin git@github.com:/ilovepi/dotfiles.git

WORKDIR /home/paul

# setup neovim
RUN curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh && sh installer.sh $HOME/.nvim/dein

#install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly -y

RUN sudo updatedb

# Run zsh as login shell
ENTRYPOINT ["/usr/bin/zsh"]
CMD ["--login"]
