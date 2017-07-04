FROM alpine:latest

MAINTAINER Paul Kirth


ENV DEBIAN_FRONTEND noninteractive

#get and install packages
RUN apk add --update &&  apk add  vim musl-dev \
		 libtool                               \
		 alpine-sdk                            \
         build-base                            \
		 ncurses                               \
         ncurses-dev                           \
         ncurses-libs                          \
         ncurses-terminfo                      \
		 neovim                                \
		 zsh                                   \
		 git                                   \
		 gcc                                   \
		 g++                                   \
		 bison                                 \
		 flex                                  \
		 wget                                  \
		 curl                                  \
		 py-pip                                \
		 byobu                                 \
		 tmux                                  \
		 automake                              \
         autoconf                              \
		 autoconf                              \
		 ninja                                 \
		 python3                               \
		 ctags                                 \
		 ruby                                  \
		 ruby-rake                             \
		 nodejs                                \
		 grep                                  \
		 ack                                   \
		 the_silver_searcher                   \
		 cmake                                 \
		 docker                                \
		 gmp                                   \
		 mpc                                   \
		 nasm                                  \
		 texinfo                               \
		 openssl                               \
		 stow                                  \
		 clang                                 \
		 openssh                               \
		 emacs                                 \
		 util-linux                            \
		 pciutils                              \
		 usbutils                              \
		 coreutils                             \
		 binutils                              \
		 findutils                             \
		 man                                   \
		 man-pages                             

## Set the locale
#RUN locale-gen en_US.UTF-8
#ENV LANG en_US.UTF-8
#ENV LANGUAGE en_US:en
#ENV LC_ALL en_US.UTF-8


RUN adduser -S paul -s /usr/bin/zsh -D
RUN echo 'paul ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

## Add the paul user, with passwordless sudo
# RUN useradd --user-group \
#             --create-home \
#             --shell /usr/bin/zsh \
#             paul && \
#             echo 'paul ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

#switch to paul user and /home/paul directory
USER paul
ENV HOME /home/paul
ENV USER paul
WORKDIR /home/paul


RUN mkdir -p .zsh .config
RUN curl -sL zplug.sh/installer | zsh
RUN git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
RUN git clone --recursive https://github.com/ilovepi/dotfiles.git

WORKDIR /home/paul/dotfiles
RUN stow --target=$HOME zsh git vim spacemacs tmux byobu
RUN git remote set-url origin git@github.com:/ilovepi/dotfiles.git

WORKDIR /home/paul

# install spf13 vim
RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && zsh spf13-vim.sh
RUN ln -s ~/.vim/ ~/.config/nvim
RUN ln -s ~/.vimrc ~/.config/nvim/init.vim

RUN sudo updatedb

# Run zsh as login shell
ENTRYPOINT ["/bin/zsh"]
CMD ["--login"]
