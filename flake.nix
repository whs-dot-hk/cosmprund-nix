{
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  inputs.cosmprund.url = "github:cakra-labs/sprune";

  inputs.cosmprund.flake = false;

  outputs = {
    flake-utils,
    nixpkgs,
    self,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };
    in
      with pkgs; {
        packages.default = buildGoModule {
          pname = "cosmprund";
          version = "dummy";
          src = inputs.cosmprund + /.;
          vendorHash = "sha256-jssBLF94Y1aGWEH+ols92X9utPA9ZbAu+TpE64GxVsM=";
        };
      });
}
