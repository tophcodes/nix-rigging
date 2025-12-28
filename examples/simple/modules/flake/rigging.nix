{inputs, ...}: {
  imports = [inputs.rigging.flakeModules.default];

  # The configured systems (used for the `perSystem` attribute) will
  # auto-generate based on your flake's directory structure.
  #
  # You might want to override this if you plan to deploy to hosts using
  # systems you don't have any configurations for yet, but still want the
  # benefit of a built installer ISO.
  #
  # rigging = {
  #   systems = [ "x86_64-linux" ];
  # };
}
