{
  description = "A BIP-39 based memorable password generator";

  inputs =
    {
      devshell.url = "github:numtide/devshell";

      fup.url = "github:gytis-ivaskevicius/flake-utils-plus/1.2.0";
    };

  outputs =
    { self
    , devshell
    , fup
    , nixpkgs
    } @ inputs:
    fup.lib.mkFlake {
      inherit self inputs;

      sharedOverlays = [ devshell.overlay self.overlay ];

      overlay = final: prev: {
        pass39 = final.callPackage ./package.nix { };
      };
      overlays.pass39 = self.overlay;

      outputsBuilder = channels: rec {
        packages = fup.lib.exportPackages self.overlays channels;
        defaultPackage = packages.pass39;
        devShell = channels.nixpkgs.devshell.fromTOML ./devshell.toml;
      };
    };
}
