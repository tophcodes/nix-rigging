{
  description = "Minimal flake that showcases nix-rigging";

  inputs = {
    # To develop locally, build this flake with:
    # nix flake lock --override-input rigging ../flake.nix
    flake-parts.url = "github:hercules-ci/flake-parts";
    rigging = {
      url = "github:tophcodes/nix-rigging";
      inputs.flake-parts.follows = "flake-parts";
    };
  };

  # Nothing fancy here, everything else is configured some place else,
  # e.g. in modules/flake/rigging.nix
  outputs = inputs:
    inputs.rigging.lib.mkFlake {
      inherit inputs;
      root = ./.;
    };

  # The above will turn into:
  # flake-parts.lib.mkFlake {inherit inputs;} (_: {
  #  imports = [rigging.flakeModules.default];
  # });
}
