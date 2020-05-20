# syntax=docker/dockerfile:experimental
FROM paul/mpk-source:latest

MAINTAINER Paul Kirth

ENV DEBIAN_FRONTEND noninteractive

## Add the paul user, with passwordless sudo
#RUN useradd -u 1005 --user-group \
        #--create-home \
        #--shell /usr/bin/zsh \
        #paul && \
        #echo 'paul ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

##switch to paul user and /home/paul directory
#USER paul
#ENV HOME /home/paul
#WORKDIR /home/paul
#ENV USER paul

ENV HOME /root
WORKDIR $HOME

RUN mkdir -p $HOME/.config
#RUN curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

#RUN git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
RUN --mount=type=ssh git clone -b experiment --recursive git@github.com:ilovepi/dotfiles.git

RUN mv $HOME/.zshrc $HOME/.zshrc.bak
WORKDIR $HOME/dotfiles
RUN stow --target=$HOME zsh git vim spacemacs tmux byobu config
RUN git remote set-url origin git@github.com:/ilovepi/dotfiles.git

WORKDIR $HOME

# setup neovim
RUN curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh && sh installer.sh $HOME/.cache/dein

#install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly -y
RUN nvim --headless +DeinInstall +UpdateRemotePlugins +qall

RUN sudo updatedb

# Run zsh as login shell
ENTRYPOINT ["/usr/bin/zsh"]
CMD ["--login"]
