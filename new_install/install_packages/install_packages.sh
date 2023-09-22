\sudo pacman -S --needed base-devel
sudo pacman -S --needed git

aur_helper() {
	git clone https://aur.archlinux.org/paru.git
	cd paru
	makepkg -si
	cd ..
	rm -rf paru/
}

read -p "ENTER 1 (INSTALL PARU) OR ANYTHING ELSE (DO NOT): " install_helper
if [ $install_helper = 1 ]
then
	aur_helper
else
	echo "DID NOT INSTALL HELPER"
fi

grep -v -e "^ " ./lists/official_pkgs.txt > official_grep.txt
grep -v -e "^ " ./lists/aur_pkgs.txt  > aur_grep.txt

read -p "ENTER 1 (INSTALL OFFICIAL PKGS) OR 2 (INSTALL AUR PKGS) OR 3 (ALL PACKAGES) OR ANYTHING ELSE (NO PACKAGES)" packages

if [ $packages = 1 ] 
then
	sudo pacman -S --noconfirm - < official_grep.txt
elif [ $packages = 2 ]
then
	paru -S --noconfirm - < aur_grep.txt
elif [ $packages = 3 ]
then
	sudo pacman -S --noconfirm - < official_grep.txt
	paru -S --noconfirm - < aur_grep.txt
elif [ $packages = 4 ]
then
	exit 0
fi	


rm -rf ./official_grep.txt ./aur_grep.txt

