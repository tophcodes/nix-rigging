{config, ...}: {
  services.croc = {
    enable = true;
    openFirewall = true;

    # Secrets will always substitute into a path
    pass = config.rigging.secrets.croc.pass;
  };

  services.ssh = {
    enable = true;
    port = config.rigging.options.ssh.port;
  };
}
