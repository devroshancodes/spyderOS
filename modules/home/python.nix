{ pkgs, ... }:

let
	myPython = pkgs.python3.withPackages (ps: with ps; [
		requests
		pandas
		textual
	]);

	in
	{
		home.packages = with pkgs; [
			myPython
			ruff
			httpie
		];
		
		programs.uv = {
			enable = true;
			settings = {
				python-preference = "only-system";
				python-downloads = "never";
			};
		};

		home.sessionVariables.UV_PYTHON = "3.13";
	}
