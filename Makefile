PROGS = htop git zsh tmux vim

.PHONY: all
all: sysdeps dotfiles vundle chruby ruby-install

.PHONY: sysdeps
sysdeps:
	sudo apt-get install -y $(PROGS)

.PHONY: dotfiles
dotfiles:
	ln -s $(shell pwd)/zshrc ~/.zshrc
	ln -s $(shell pwd)/tmux.conf ~/.tmux.conf
	ln -s $(shell pwd)/vim ~/.vim
	ln -s $(shell pwd)/vimrc ~/.vimrc

.PHONY: vundle
vundle:
	rm -rf ~/.vim/bundle/vundle
	cd ~/.vim/bundle && git clone https://github.com/gmarik/vundle

.PHONY: chruby
chruby:
	wget -O chruby-0.3.8.tar.gz https://github.com/postmodern/chruby/archive/v0.3.8.tar.gz
	tar -xzvf chruby-0.3.8.tar.gz
	cd chruby-0.3.8 && sudo make install
	rm -rf chruby-0.3.8.tar.gz chruby-0.3.8
	chruby ruby

.PHONY: ruby-install
ruby-install:
	wget -O ruby-install-0.4.2.tar.gz https://github.com/postmodern/ruby-install/archive/v0.4.2.tar.gz
	tar -xzvf ruby-install-0.4.2.tar.gz
	cd ruby-install-0.4.2 && sudo make install
	rm -rf ruby-install-0.4.2 ruby-install-0.4.2.tar.gz
	ruby-install ruby

clean:
	rm ~/.vim ~/.vimrc ~/.tmux.conf ~/.zshrc
