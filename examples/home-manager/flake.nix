{
  description = "Minimal flake that showcases nix-rigging";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    rigging = {
      url = "github:tophcodes/nix-rigging";
      inputs.flake-parts.follows = "flake-parts";
    };
  };

  outputs = inputs:
    inputs.rigging.lib.mkFlake {
      inherit inputs;
      root = ./.;
    };
}
