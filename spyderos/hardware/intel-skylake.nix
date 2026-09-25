{ config, pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [ intel-media-driver intel-vaapi-driver libvdpau-va-gl ];
  };
  #services.tlp = {
  #  enable = true;
  #  settings = {
  #    CPU_SCALING_GOVERNOR_ON_AC = "performance";
  #    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
  #    CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
  #  };
  #};
}
