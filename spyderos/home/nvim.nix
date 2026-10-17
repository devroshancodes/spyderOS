{ config, pkgs, libs, ... }:
{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;

		extraPackages = with pkgs; [
			git
			gnumake
			gcc
			ripgrep
			fd
			stylua
			lua-language-server
			pyright
			clang-tools
		];
	};
}
