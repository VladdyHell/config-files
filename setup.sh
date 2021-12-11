sudo apt install scrcpy git curl neovim vim nodejs npm -y &&
sudo apt install exuberant-ctags -y &&
sudo npm install yarn -g
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' &&
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
mkdir -p ~/.local/share/fonts &&
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf &&
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)" &&

usrdir="$HOME/.config/nvim/"

if [ -d "$usrdir" ]
then
	echo "THE DIRECTORY ${usrdir} ALREADY EXISTS!"
	exit 1
else
	echo "CLONING CONFIG FILE..." &&
	#mkdir ~/.config/nvim &&
	#touch ~/.config/nvim/init.vim &&
	cd ~/.config &&
	git clone https://github.com/VladdyHell/config-files.git &&
	cd ./config-files &&
	sudo mv $(ls -a --ignore=setup.sh --ignore=pluginstall.vim --ignore=cocinstall.vim) ../ -f
	#cd .. &&
	rm -r ~/.config/config-files &&
	nvim -S <(curl -s https://raw.githubusercontent.com/vladdyhell/config-files/master/pluginstall.vim) &&
	#id1=$(ps -A | grep vim | awk '{print $1}') &&
	#kill $id1 &&
	cd ~/.config/nvim/plugged/coc.nvim &&
	yarn install &&
	yarn build &&
	nvim -S <(curl -s https://raw.githubusercontent.com/vladdyhell/config-files/master/cocinstall.vim)
	#id2=$(ps -A | grep vim | awk '{print $1}') &&
	#kill $id2
fi
echo 'Finished execution'
