all:
	mkdir ~/.prompt
	cp ./fortune ~/.prompt
	cp ./cowsay ~/.prompt
	mkdir ~/.prompt/cows
	cp ./cows/* ~/.prompt/cows
	cp fortunes ~/.prompt/fortunes
	cp fortunes.dat ~/.prompt/fortunes.dat
	cat bashrc >> ~/.bashrc
	cat profile >> ~/.bash_profile
	cp .git-prompt.sh ~/.git-prompt.sh
	pip install fortune
	cd ~
	source .bashrc
