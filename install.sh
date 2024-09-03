#!/bin/sh

# Check if the system is NixOS
if grep -qi nixos /etc/os-release; then
  echo "This is NixOS"
  echo "-----"
else
  echo "You need to use NixOS to use these dotfiles."
  echo "Please visit https://nixos.org/ for more information."
  exit 1
fi

# Check if Git is installed
if command -v git &> /dev/null; then
  echo "Git is installed, thank you!"
  echo "-----"
else
  echo "Git is not installed. Please install Git to proceed."
  echo "Example: nix-shell -p git"
  echo "Note: Do not use 'nix-env' to install packages."
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

# Update NixOS configuration
cd /etc/nixos || exit
sudo rm -rf configuration.nix
sudo mv configuration.nix /etc/nixos/
sudo mv intel-drivers.nix /etc/nixos/


# Add and update Nix channels
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
nix-channel --update

# Install Home Manager
if nix-shell '<home-manager>' -A install; then
  echo "Hm installed"
else
  echo "you need to reboot"
  exit 1
fi

# Apply Home Manager configuration
if home-manager switch; then
  echo "home-manager appiled"
else
  echo "qhar"
  exit 1
fi

# Apply the NixOS configuration
if sudo nixos-rebuild switch; then
  echo "updated"
else
  echo "qhar"
  exit 1
fi
