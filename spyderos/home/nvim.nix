{ config, pkgs, libs, ... }:

{
	programs.neovim = {
		enable = true;
		defaultEditor = true;
		viAlias = true;
		vimAlias = true;

		extraPackages = with pkgs; [
			fd
			stylua
			lua-language-server
			pyright
			clang-tools
			vscode-langservers-extracted
			cmake-language-server
			rust-analyzer
		];
		sideloadInitLua = true;
	};
}
