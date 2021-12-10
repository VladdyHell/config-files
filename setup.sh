sudo apt scrcpy install git curl neovim vim -y && 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' &&
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
nvimdir="~/.config/nvim/"

if [-d "$nvimdir"]; then
	echo "nvim config folder exists!"
	exit 1
else
	echo "cloning config file." &&
	touch ~/.config/nvim/init.vim &&
	cd ~/.config &&
	git clone https://github.com/VladdyHell/config-files.git &&
	cd ./config-files &&
	mv nvim/ .git .gitignore ../ &&
	cd .. &&
	rm -r ./config-files	
fi
echo 'Finished execution'
