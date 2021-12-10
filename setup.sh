sudo apt install scrcpy git curl neovim vim nodejs npm -y &&
sudo apt remove cmdtest &&
sudo apt remove yarn &&
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - &&
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list &&
sudo apt-get install yarn

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' &&
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)" &&
usrdir="$HOME/.config/nvim/"

if [ -d "$usrdir" ]
then
	echo "THE DIRECTORY ${usrdir} ALREADY EXISTS!"
	exit 1
else
	echo "CLONING CONFIG FILE..." &&
	mkdir ~/.config/nvim &&
	#touch ~/.config/nvim/init.vim &&
	cd ~/.config &&
	git clone https://github.com/VladdyHell/config-files.git &&
	cd ./config-files &&
	mv * .* ../ -f
	cd .. &&
	rm -r ./config-files

	cd ~/.config/nvim/plugged/coc.nvim &&
	yarn install &&
	yarn build
fi
echo 'Finished execution'
