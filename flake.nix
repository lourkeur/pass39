# The flake file is the entry point for nix commands
{
  description = "A BIP-39 based memorable password generator";

  # Inputs are how Nix can use code from outside the flake during evaluation.
  inputs.devshell.url = "github:numtide/devshell";
  inputs.fup.url = "github:gytis-ivaskevicius/flake-utils-plus/v1.3.1";
  inputs.flake-compat.url = "github:edolstra/flake-compat";
  inputs.flake-compat.flake = false;

  # Outputs are the public-facing interface to the flake.
  outputs = inputs @ {
    self,
    devshell,
    fup,
    nixpkgs,
    ...
  }:
    fup.lib.mkFlake {
      inherit self inputs;

      sharedOverlays = [ devshell.overlay self.overlay ];

      overlay = final: prev: {
        pass39 = final.callPackage nix/package.nix { };
      };

      outputsBuilder = channels: {
        defaultPackage = channels.nixpkgs.pass39;
        devShell = channels.nixpkgs.callPackage nix/devshell.nix {};
      };
    };
}
