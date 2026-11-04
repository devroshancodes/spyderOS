{ config, pkgs, ...}:

{
	imports = [
		./apps.nix
		./theme.nix
		./nvim.nix
		./python.nix
	];
}
