{ pkgs, ... }:

let
	myPython = pkgs.python3.withPackages (ps: with ps; [
		requests
		pandas
		textual
	]);

	in
	{
		home.packages = [
			myPython
		];
		
		programs.uv = {
			enable = true;
			python = {
				versions = [ "3.12" "3.13" ];
				default = [ "3.13" ];
				prune = true;
			};
			tool = {
				packages = [
					"ruff"
					"httpie"
				];
			};
		};
	}
