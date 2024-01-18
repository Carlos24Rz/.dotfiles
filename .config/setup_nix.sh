# Setup a new machine
function nixsetup()
{
	echo "Installing nix..."
	sh <(curl -L https://nixos.org/nix/install) --daemon;
}

# Install all packages in nix_packages.yaml
function nixall()
{
	echo "Installing packages"
        if [ -f ~/.config/nix_packages.yaml ]; then
		cat ~/.config/nix_packages.yaml | sed -n 's/^-\s\(.*\)$/\1/p' | awk '{print "nixpkgs." $0}' |xargs -n 1 nix-env -iA;
	fi
}

# Install a package
function nixinstall()
{
	if nix-env -iA nixpkgs."$1" && ! grep "^- $1$" ~/.config/nix_packages.yaml > /dev/null 2>&1; then
		cat >> ~/.config/nix_packages.yaml <<EOF
- $1
EOF
        fi
}

# Unistall a package
function nixuninstall()
{
	if nix-env -e "$1" &&  [ -f ~/.config/nix_packages.yaml ]; then
		sed -i "/^-\s$1$/d" ~/.config/nix_packages.yaml;
	fi
}

# Clean unistalled packages
function nixclean()
{
	nix-env --deleting-generations old;
	nix-store --gc;
}

# Update packages
function nixupdate()
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
