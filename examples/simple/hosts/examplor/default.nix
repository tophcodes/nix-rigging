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
      # Secrets and config-options can be automatically validated against a
      # mime-type or even against a schema checker upon activation. In the case
      # of configs we can detect this upon evaluation, in the secrets case upon
      # activation. If the schema check does then not happen successfully, we
      # can fail the activation script.
      options = {
        ssh.port = {
          type = types.int;
          required = false;
          default = 22;
        };

        traefik.config = {
          description = "A custom config loadable for traefik.";
          type = types.file {
            format = "application/toml";
            schemaCheck = schema.traefikConfig;
          };
        };
      };

      secrets = {
        croc.pass = {
          description = "The password to use for this relay.";
          required = true;
          type = types.secret {format = "text/plain";};
        };
      };
    };
  };
}
