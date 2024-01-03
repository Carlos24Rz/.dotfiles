# Install a packaga
nixinstall()
{
	nix-env -iA nixpkgs."$1";
}

# Unistall a package
nixunistall()
{
	nix-env -e "$1";
}

# Clean unistalled packages
nixclean()
{
	nix-env --deleting-generations old;
	nix-store --gc;
}

# Update packages
nixupdate()
{
	echo "Updating channels"
	nix-channel --update;
	echo "Updating packages"
	nix-env -u;
	echo "Cleaning"
	nixclean;
	echo "Reparing"
	nix-store --verify --check-contents --repair;
}

# Aliases
alias nixls="nix-env -q"
