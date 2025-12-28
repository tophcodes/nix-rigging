{
  description = "The Nix meta-framework I need to fix all my Nix woes";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      # TODO: Automatically generate this from rigging
      systems = ["x86-64_linux"];
    };
}
