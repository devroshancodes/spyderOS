{ config, lib, pkgs, ... }:

{

	fileSystems."/mnt/hdd" = {
		device = "/dev/disk/by-uuid/EFFF-F48F";
		fsType = "exfat";
		options = [
			"nofail"
			"x-systemd.automount"
			"x-systemd.idle-timeout=10m"
			"x-systemd.device-timeout=3s"
			"x-systemd.mount-timeout=5s"
			"relatime"
			"iocharset=utf8"
			"errors=remount-ro"
			"uid=1000"
			"gid=100"
			"dmask=007"
			"fmask=0113"
		];
	};

	boot.supportedFilesystems = [ "exfat" ];

	systemd.settings.Manager = { 
		DefaultTimeoutStopSec = "10s";
	};
	
	systemd.services.reset-hdd-automount = {
		description = "Reset mnt-hdd automount after system resume if present";
		after = [ "systemd-suspend.service" "systemd-hibernate.service" ];
		wantedBy = [ "systemd-suspend.service" "systemd-hibernate.service" ];
		script = ''
			echo "System resumed: checking for /mnt/hdd disl (UUID: EFFF-F48F)."

			if [ -e /dev/disk/by-uuid/EFFF-F48F ]; then
					echo "Disk found! Restting and restarting mnt-hdd automount."
					${pkgs.systemd}/bin/systemctl reset-failed mnt-hdd.automount mnt-hdd.mount || true
					${pkgs.systemd}/bin/systemctl restart mnt-hdd.automount || true
					echo "Successfully reinitialized mnt-hdd automount unit."

					if [ -S /run/user/1000/bus ]; then
						export XDG_RUNTIME_DIR=/run/user/1000
						export DBUS_SESSION-BUS_ADDRESS=unix:path=/run/user/1000/bus
						${pkgs.libnotify}/bin/notify-send "Storage Ready" "External drive /mnt/hdd has successfully reinitialized." || true
					fi
			else
					echo "Disk /dev/disk/by-uuid/EFFF-F48F not detected. Skipping automount reset."
			fi
		'';
		serviceConfig.Type = "oneshot";
	};

	home-manager.users.spyx = { config, ... }: {
		home.file = {
			"videos/Videos" = {
				source = config.lib.file.mkOutOfStoreSymlink "/mnt/hdd/Videos";
			};
			"pictures/Pictures" = {
				source = config.lib.file.mkOutOfStoreSymlink "/mnt/hdd/Pictures";
			};
		};
	};

}
			
