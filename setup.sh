#sudo apt install scrcpy git curl neovim vim -y && 
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' &&
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &&
usrdir="/home/lubuntu/.config/nvim/"

if [ -d "$usrdir" ]
then
	echo "THE DIRECTORY ${usrdir} ALREADY EXISTS!"
	exit 1
else
	echo "CLONING CONFIG FILE..." &&
	touch ~/.config/nvim/init.vim &&
	cd ~/.config &&
	git clone https://github.com/VladdyHell/config-files.git &&
	cd ./config-files &&
	mv nvim/ .git .gitignore ../ &&
	cd .. &&
	rm -r ./config-files	
fi
echo 'Finished execution'
