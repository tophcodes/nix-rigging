## Architecture

- Host configs declare contracts on their required secrets and configurations
- The deployment context provides those requirements with actual values

## Motivation

- Resource overhead of existing tools
- No unified workflow/tooling for centralized nix declarations that put everything together
- "Plug-and-play" deployments of NixOS hosts and users
- Dogfooding my own module
- I wanted to get into Nix tooling

## Opionionated meta-framework

> [!TIP]
> This framework currently is mainly written for my needs. If it mostly does what you want as well, and it seems natural to have a toggleable feature instead,
make sure to open an issue.

- Runs services on servers as separate MicroVMs
- Enforces a (at some point configurable) project structure for auto-discoverability

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
  - Secret/config browser (separate to deployment of hosts!) - Shows the configured secret/config dependencies of the flake and filled values
- [ ] Shared configuration between hosts -> No need to evaluate hosts that are not currently being built
- [ ] Declarative disk configuration included
- [ ] Deployment tooling (deploy-rs, the other thingy, anaconda or some such)
- [ ] Performant piece of kit
- [ ] Nice balance between configurability and opinionation
- [ ] Evaluation and deployment steps are different

I'd call it a Nix/NixOS-meta-framework. The all-in-one solution for all my Nix woes.

## Developing
- Clone the repo
- Run `nix develop` to enter a dev shell that is pre-configured to work on the repo
- Run `watchexec -c -d 500 nix flake check -L` in order to automatically run all tests upon file changes
- Run `nix flake check` to run all the automated tests that test the library
