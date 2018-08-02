
files=(".zsh_profile" ".zshrc" ".bash_profile" ".tmux.conf" ".vimrc" ".vim")

for i in "${files[@]}"
do
	ln -s $HOME/dotfiles/$i $HOME/$i
done

git config user.name "hiyucc"
git config user.email "hiyu7326@gmail.com"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
