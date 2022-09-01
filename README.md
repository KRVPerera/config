Org Mode
=========

[Home](https://htmlpreview.github.io/?https://raw.githubusercontent.com/KRVPerera/config/master/orgmode/office.html)
[Office](https://htmlpreview.github.io/?https://raw.githubusercontent.com/KRVPerera/config/master/orgmode/office.html)
[Professional](https://htmlpreview.github.io/?https://raw.githubusercontent.com/KRVPerera/config/master/orgmode/Professional.html)
[Competitive Programming](https://htmlpreview.github.io/?https://raw.githubusercontent.com/KRVPerera/config/master/orgmode/cp.html)


bashrc-and-bash_aliases
=======================

These are my bash rc and bash aliases files

You can find these files in linux.
  
    gedit ~/.bashrc
    gedit ~/.bash_aliases
    
    vim ~/.bashrc
    vim ~/.bash_aliases
    
  It is super cool to edit these files and get some things done.
  If you are a new just play with "~/.bash_aliases" file and see what happens.
  But you must add 
	  
	if [ -f ~/.bash_aliases ]; then
		. ~/.bash_aliases
	fi
	
	to your .bashrc file to load .bash_aliases file everytime
  after you update these changes use command 
      
      . ~/.bashrc 
      
  to see the changes instantly on the bash terminal. It will effect any terminal which has acces to bash history.


init.vim
========

Config for neovim

~/.config/nvim/init.vim

#### Install doom emacs on windows
[Link](https://earvingad.github.io/posts/doom_emacs_windows/)
