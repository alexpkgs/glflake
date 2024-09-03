if [ -n "$(grep -i nixos < /etc/os-release)" ]; then
  echo "this is nixos"
  echo "-----"
else
  echo "i swear of god go use nixos if you wanna use these dotfiles"
  echo "go to https://nixos.org/"
  exit
fi

if command -v git &> /dev/null; then
  echo "git is installed thank you"
  echo "-----"
else
  echo "git is not installed please install git (git gud)"
  echo "Example: nix-shell -p git"
  echo "fun fact do not nix-env"
  exit
fi

