{config, pkgs, ... }:
{
	security.wrappers.btop = {
		enable = true;
		source = "${pkgs.btop}/bin/btop";
		owner = "root";
		group = "root";
		permissions = "u+rx,g+rx,o+rx";
		capabilities = "cap_dac_read_search+ep";
	};

	security.auditd.enable = true;
	
	security.audit.enable = true;

}
