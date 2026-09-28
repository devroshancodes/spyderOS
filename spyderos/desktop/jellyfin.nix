{ config, pkgs, ... }:

{
  systemd.user.services.jellyfin-container = {
    description = "Rootless Jellyfin Podman Container";
    wantedBy = [ "default.target" ];
    after = [ "network.target" ];

    serviceConfig = {
      ExecStartPre = "-${pkgs.podman}/bin/podman rm -f jellyfin";
      ExecStart = ''
        ${pkgs.podman}/bin/podman run \
          --name=jellyfin \
          -p 8096:8096 \
          -v /home/spyx/jellyfin/config:/config:Z \
          -v /home/spyx/jellyfin/cache:/cache:Z \
          -v /mnt/HDD/Videos:/media:ro,z \
          docker.io/jellyfin/jellyfin:latest
      '';
      ExecStop = "${pkgs.podman}/bin/podman stop -t 10 jellyfin";
      Restart = "always";
    };
  };

  # Open the host firewall port
  networking.firewall.allowedTCPPorts = [ 8096 ];
}
