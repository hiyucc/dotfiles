
files=(".zsh_profile" ".zshrc" ".bash_profile" ".tmux.conf" ".vimrc" ".vim")

for i in "${files[@]}"
do
	ln -s $HOME/dotfiles/$i $HOME/$i
done
