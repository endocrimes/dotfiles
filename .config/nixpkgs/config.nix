{
  allowUnfree = true;

  permittedInsecurePackages = [
    "p7zip-16.02"
  ];

  packageOverrides = pkgs: rec {
    polybar = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };
  };
}
