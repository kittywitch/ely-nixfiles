{
  tree,
  pkgs,
  ...
}: {
  imports = with tree.impure.nixos.profiles; [
    gstreamer
    kernel
  ];

  environment.systemPackages = with pkgs; [
    onevpl
    onevpl-intel-gpu
  ];
}
