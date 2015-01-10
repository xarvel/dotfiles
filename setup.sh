#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

basedir=~/Dropbox/configs
dir=dotfiles                    # dotfiles directory
olddir=dotfiles_old             # old dotfiles backup directory
files="vimrc vim Xresources"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in basedir
echo "Creating $olddir for backup of any existing dotfiles in $basedir"
mkdir -p $basedir/$olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $basedir/$dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from $basedir/$dir to $basedir/$olddir"
    mv ~/.$file $basedir/$olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $basedir/$dir/.$file ~/.$file
done