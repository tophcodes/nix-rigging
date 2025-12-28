{config, ...}: {
  services.croc = {
    enable = true;
    openFirewall = true;

    # this will throw a build error unless overridden:
    pass = config.rigging.secrets.croc.pass.text;

    # ideal usage:
    # pass = config.rigging.secrets.croc.pass.path;
  };

  services.ssh = {
    enable = true;
    port = config.rigging.options.ssh.port.text;
  };
}
