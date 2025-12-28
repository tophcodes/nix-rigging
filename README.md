## Motivation

- Resource overhead of existing tools
- No unified workflow/tooling for centralized nix declarations that put everything together
- "Plug-and-play" deployments of NixOS hosts and users
- I wanted to get into Nix tooling

## Vision

Have a look at the [/examples] directory to see what my ideal config looks like.

- [ ] Lives in the user's `infra` repo
- [ ] Runs NixOS rebuilds independently of Home Manager rebuilds
- [ ] Generator for new host/config boilerplate
- [ ] Can create ISO for each host (or new host)
  - Includes new deployment tooling
  - Automatic SSH key generation for secret rekeying
  - Run interactive disk formatter that outputs nix configuration
  - Generate hardware-config
  - Format everything correctly and automatically rsync it over to the current host
- [ ] Secret deployment, either via sops or agenix
- [ ] Debugging features
  - Test-run every host in a VM instead
  - nh/flake output visualization
- [ ] Shared configuration between hosts -> No need to evaluate hosts that are not currently being built
- [ ] Declarative disk configuration included
- [ ] Deployment tooling (deploy-rs, the other thingy, anaconda or some such)
- [ ] Performant piece of kit
- [ ] Nice balance between configurability and opinionation

I'd call it a Nix/NixOS-meta-framework. The all-in-one solution for all my Nix woes.
