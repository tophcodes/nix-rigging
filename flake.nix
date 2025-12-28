{
  description = "The Nix meta-framework I need to fix all my Nix woes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [./modules/flake];

      # TODO: Automatically generate this from rigging
      systems = ["x86_64-linux"];
    };
}
