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
