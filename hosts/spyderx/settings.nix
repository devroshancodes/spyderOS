{ config, ... }:
{
	spyderos.user.name = "spyx";

	networking.hostName = "spyxnix";

	home-manager.users.${config.spyderos.user.name}.home.stateVersion = "26.05";
	
	system.stateVersion = "26.05";

}
