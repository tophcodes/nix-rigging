{
  description = "Minimal orchestrator that showcases combining multiple system flakes";

  inputs = {
    # To develop locally, build this flake with:
    # nix flake lock --override-input rigging ../../flake.nix
    rigging.url = "github:tophcodes/nix-rigging";

    desktop.url = "github:example/desktop-flake";
    laptop.url = "github:example/laptop-flake";
    phone.url = "github.com:example/phone-flake"; # How about postmarketos-nix?
  };

  outputs = inputs:
    inputs.rigging.lib.mkFlake {
      inherit inputs;

      import = [
        inputs.desktop.flakeModules.rigging
        inputs.laptop.flakeModules.rigging
        inputs.phone.flakeModules.rigging
      ];

      root = ./.;
    };
}
