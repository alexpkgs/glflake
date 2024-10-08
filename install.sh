# Check if the system is NixOS!
if grep -qi nixos /etc/os-release; then
  echo "This is NixOS"
  echo "-----"
else
  echo "You need to use NixOS to use these dotfiles."
  echo "go get the iso now https://nixos.org/"
  exit 1
fi

# Check if Git is installed
if command -v git &> /dev/null; then
  echo "thank you for gitting gud"
  echo "-----"
else
  echo "you need git???"
  echo "Example: nix-shell -p git"
  echo "do not the nix-env"
  exit 1
fi

# Move configuration files and directories
mv home-manager ~/.config
mv flake.nix ~/
cd ~/Music || exit
mv 100-gecs ~/Music
mv BoywithUke ~/Music
mv OMFG ~/Music
mv juno ~/Music
mv underscores ~/Music
cd ..
mv walls ~/
swww img ~/walls/wallpaper.jpg

# upd nixos
sudo rm -rf /etc/nixos/configuration.nix
sudo mv ~/glflake/etc/nixos/configuration.nix /etc/nixos/
sudo mv ~/glflake/etc/nixos/intel-drivers.nix /etc/nixos/
cd /home/alex

# gdm fix just in case if it gets smh wrong
nix profile install flake:nixpkgs#legacyPackages.x86_64-linux.gdm --priority 6
nix profile install nixpkgs#gdm
nix-env -iA nixos.gdm # do not the nix-env sorry i had to do this same for the font
# nix stuff and emacs
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
nix-channel --update
git clone https://github.com/alexzsk/glomacs.git
cd glomacs
mv emacs ~/.config
nix profile install nixpkgs#fira-code
nix-env -iA nixos.fira-code

# hm
if nix-shell '<home-manager>' -A install; then
  echo "Hm installed"
else
  echo "you need to reboot"
  exit 1
fi

# applu hm
if home-manager switch; then
  echo "home-manager appiled"
else
  echo "please restart"
  exit 1
fi

# nixxing
if sudo nixos-rebuild switch; then
  echo "updated"
else
  echo "okay so thats pretty werid try restarting"
  exit 1
fi
