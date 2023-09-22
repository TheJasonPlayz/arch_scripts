DOTFILES_REPO=/home/jasonw/Git/arch-dotfiles

copy_from_machine() {
	sudo cp /etc/lightdm/lightdm.conf $DOTFILES_REPO/etc/lightdm/

	cp ~/.config/i3blocks/ -r $DOTFILES_REPO/home/.config/
	cp ~/.config/i3/ -r $DOTFILES_REPO/home/.config/
	cp ~/.config/jgmenu/ -r $DOTFILES_REPO/home/.config/
	cp ~/.config/kitty/ -r $DOTFILES_REPO/home/.config/
	cp ~/.config/menus/ -r $DOTFILES_REPO/home/.config/
	cp ~/.config/kmenueditrc $DOTFILES_REPO/home/.config

	cp ~/.bashrc $DOTFILES_REPO/home
	cp ~/.zshrc $DOTFILES_REPO/home
}

copy_to_machine() {
	sudo cp $DOTFILES_REPO/etc/lightdm/lightdm.conf /etc/lightdm

	cp $DOTFILES_REPO/home/.config/jgmenu -r ~/.config
	cp $DOTFILES_REPO/home/.config/kitty -r ~/.config
	cp $DOTFILES_REPO/home/.config/menus -r ~/.config
	cp $DOTFILES_REPO/home/.config/i3 -r ~/.config
	cp $DOTFILES_REPO/home/.config/i3blocks -r ~/.config
	cp $DOTFILES_REPO/home/.config/kmenueditrc ~/.config

	cp $DOTFILES_REPO/home/.bashrc ~/
	cp $DOTFILES_REPO/home/.zshrc ~/
}

read -p "ENTER 1 (COPY TO MACHINE) OR 2 (COPY FROM MACHINE)" copy_location

if [ copy_location = 1 ]
then
	copy_to_machine
elif [ copy_location = 2 ]
then
	copy_from_machine
else
	echo "INPUT INCORRECT. ENTER: 1 OR 2"
	exit 0
fi
