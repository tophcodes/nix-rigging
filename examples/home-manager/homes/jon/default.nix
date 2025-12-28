{lib, ...}:
lib.rigging.mkHome {
  rigging = {
    # Both of these options can be automatically derived from the directory
    # name, but can be overridden here. homeDir will automatically default to
    # `/Users/<name>` on darwin builds, unless specified here.
    username = "jon";
    homeDir = "/home/jon";

    # Specifies which hosts to provide this home-manager module for
    hostnames = ["examplor" "another"];

    options = {};
    secrets = {};
  };

  build = ./home.nix;
}
