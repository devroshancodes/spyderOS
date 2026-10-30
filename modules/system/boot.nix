{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

	boot.kernelParams = [ 
		"mem_sleep_default=deep"
		"intel_iommu=off"
		"zswap.enabled=1"
		"zswap.compressor=zstd"
		"zswap.zpool=zsmalloc"
		"zswap.max_pool_percent=15"
	];

	boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
}
