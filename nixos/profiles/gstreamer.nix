{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gst_all_1
  ];
}
