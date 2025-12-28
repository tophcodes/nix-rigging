{lib, ...}:
lib.rigging.mkHost {
  import = [
    ./configuration.nix
  ];

  rigging = {
    system = "x86_64-linux";

    # can be overridden if it doesn't match the directory name
    # hostname = "examplor-2"

    schema = with lib.rigging; {
      ssh.port = {
        type = types.int;
        required = false;
        default = 22;
      };

      # Secrets can be automatically validated against a mime-type or even
      # against a schema checker upon evaluation.
      croc.pass = {
        description = "The password to use for this relay.";
        required = true;
        type = types.secret {format = "text/plain";};
      };

      traefik.config = {
        description = "A custom config loadable for traefik.";
        type = types.secret {
          format = "application/toml";
          schemaCheck = schema.traefikConfig;
        };
      };
    };
  };
}
