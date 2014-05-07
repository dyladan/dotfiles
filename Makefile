PROGS = htop git zsh tmux vim

.PHONY: init
init: sysdeps dotfiles vundle chruby ruby-install playground

.PHONY: sysdeps
sysdeps:
	sudo apt-get install -y $(PROGS)

.PHONY: ath9k
	echo "options ath9k nohwcrypt=1 blink=1 btcoex_enable=1 bt_ant_diversity=1" | sudo tee /etc/modprobe.d/ath9k.conf

.PHONY: dotfiles
dotfiles:
	ln -s $(shell pwd)/zshrc ~/.zshrc
	ln -s $(shell pwd)/tmux.conf ~/.tmux.conf
	ln -s $(shell pwd)/vim ~/.vim
	ln -s $(shell pwd)/vimrc ~/.vimrc
	ln -s $(shell pwd)/i3 ~/.i3

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

.PHONY: ruby-install
ruby-install:
	wget -O ruby-install-0.4.2.tar.gz https://github.com/postmodern/ruby-install/archive/v0.4.2.tar.gz
	tar -xzvf ruby-install-0.4.2.tar.gz
	cd ruby-install-0.4.2 && sudo make install
	rm -rf ruby-install-0.4.2 ruby-install-0.4.2.tar.gz
	ruby-install ruby

.PHONY: playground
playground:
	mkdir $(HOME)/playground
	git clone git@github.com:dyladan/ABC $(HOME)/playground/ABC
	git clone git@github.com:dyladan/dyladan.me $(HOME)/playground/dyladan.me
	git clone git@github.com:dyladan/alan $(HOME)/playground/alan
	git clone git@github.com:dyladan/bookie-ruby $(HOME)/playground/bookie-ruby
	git clone git@github.com:dyladan/euler $(HOME)/playground/euler
	git clone git@github.com:scott-linder/pios $(HOME)/playground/pios
	git clone git@github.com:dyladan/bookie $(HOME)/playground/bookie
	git clone git@github.com:dyladan/ruby-irc $(HOME)/playground/ruby-irc
	git clone git@github.com:dyladan/diy-lisp $(HOME)/playground/diy-lisp
	cd $(HOME)/playground/diy-lisp && git checkout diylisp

clean:
	rm ~/.vim ~/.vimrc ~/.tmux.conf ~/.zshrc
