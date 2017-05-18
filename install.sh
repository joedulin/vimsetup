#!/bin/bash

if [ -f ~/.vim/joerc ]; then
	echo "Server configured with joerc"
fi

goodinput="no"

if [ -f /etc/redhad-release ]; then
	sudo yum -y install git vim ctags	
else
	while [ "$goodinput" == "no" ]; do

		echo "1: Ubuntu"
		echo "2: CentOS"
		read -p "Choose your OS: " os

		if [ "$os" == "1"  ]; then
			sudo apt-get install git vim exuberant-ctags
			goodinput="yes"
		fi
		if [ "$os" ==  "2" ]; then
			sudo yum -y install git vim ctags
			goodinput="yes"
		fi
	done 
fi

mkdir -p ~/.vim
cp ./vimfiles.tar.gz ~/.vim/
cd ~/.vim
tar -xzvf ./vimfiles.tar.gz
rm -f vimfiles.tar.gz
mv ~/.vim/.vimrc ~/
mv ~/.vim/.bashrc ~/
mkdir -p ~/joerc
mv ~/.vim/ssh.sh ~/joerc
mv ~/.vim/run.sh ~/joerc

touch ~/.vim/joerc

cat << EOF
=======================================================
You should be good to go. A few cool things you can do:
<F4> 		- 	File Browser
<F8> 		- 	Outline
<F9>|<Ctrl+j>	- 	Previous File
<F10>|<Ctrl+k>	- 	Next File
<Ctrl+P> 	- 	Open File Prompt
<Tab> 		- 	Auto Completion Prompts
{}|[]|""... 	- 	Stuff Closes Itself
Buffer Bar 	- 	Open File List
======================================================
EOF

