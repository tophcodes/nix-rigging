{...}: {
  perSystem = {
    config,
    pkgs,
    ...
  }:
    with pkgs; {
      devShells.default = mkShell {
        packages = [watchexec];
      };
    };
}
