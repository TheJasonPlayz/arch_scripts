systemctl enable lightdm.service
systemctl enable NetworkManager-dispatch.service
systemctl enable tlp.service
systemctl enable cpupower.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket
