FROM paul/devbase:latest

MAINTAINER Paul Kirth

ENV DEBIAN_FRONTEND noninteractive

ARG UNAME=paul
ARG UID=1000
ARG GID=1000

## Add the paul user, with passwordless sudo

RUN groupadd -g $GID -o $UNAME
RUN useradd -u $UID \
            -g $GID \
            --create-home \
            --shell /usr/bin/zsh \
            $UNAME && \
            echo "$UNAME ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

#switch to paul user and /home/paul directory
USER $UNAME
ENV HOME /home/$UNAME
WORKDIR /home/$UNAME
ENV USER $UNAME


RUN mkdir -p $HOME/.config
#RUN curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

#RUN git clone https://github.com/syl20bnr/spacemacs $HOME/.emacs.d
RUN git clone -b experiment --recursive https://github.com/ilovepi/dotfiles.git

WORKDIR $HOME/dotfiles
RUN mv $HOME/.zshrc $HOME/.zshrc.bak
RUN stow --target=$HOME zsh git vim spacemacs tmux byobu config
RUN git remote set-url origin git@github.com:/ilovepi/dotfiles.git

WORKDIR $HOME

RUN pip3 install neovim --user

# setup neovim
RUN curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh && sh installer.sh $HOME/.cache/dein

#install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain nightly -y
RUN nvim --headless +DeinInstall +UpdateRemotePlugins +qall

RUN sudo updatedb

# Run zsh as login shell
ENTRYPOINT ["/usr/bin/zsh"]
CMD ["--login"]
