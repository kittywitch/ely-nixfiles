final: prev: rec {
  oneVPL = prev.callPackage ./oneVPL.nix {};
  onevpl-intel-gpu = prev.callPackage ./onevpl-intel-gpu.nix {};
  ffmpeg = prev.ffpeg.overrideAttrs (finalAttrs: previousAttrs: let
    lib = prev.lib;
    inherit (lib) enableFeature;
  in {
    buildInputs =
      previousAttrs.buildInputs
      ++ [
        oneVPL
      ];
    configureFlags = (final.lib.lists.remove "--enable-libmfx" previousAttrs.configureFlags) ++ ["--enable-libvpl"];
  });
}
