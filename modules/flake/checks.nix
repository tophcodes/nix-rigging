{lib, ...}:
with builtins; {
  perSystem = {
    pkgs,
    self',
    ...
  }: {
    checks = let
      examples = attrNames (readDir ../../examples);

      # Make sure that all example nixosConfigurations actually build.
      # TODO: Automatically check all other outputs as well.
      mkExampleCheck = exampleName: let
        example-flake = import (../../examples + "/${exampleName}/flake.nix");
        example-outputs = example-flake.outputs {
          inherit (inputs) flake-parts;
          rigging = self';
        };

        # Build all of them
        builds =
          lib.mapAttrs' (
            name: cfg:
              lib.nameValuePair
              "example-${exampleName}-${name}"
              cfg.config.system.build.toplevel
          )
          example-outputs;
      in
        builds;
    in
      lib.foldl' (acc: ex: acc // mkExampleCheck ex) {} examples;
  };
}
