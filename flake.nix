{
  description = "A collection of dotfiles modules";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    cursors = {
      url = "github:iErik/dots.cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:iErik/dots.niri";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:iErik/dots.hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nvim = {
      url = "github:iErik/dots.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs = {
      url = "github:iErik/dots.emacs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fish = {
      url = "github:iErik/dots.fish";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    tmux = {
      url = "github:iErik/dots.tmux";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... } @ inputs: {
    homeManagerModules = {
      default = self.homeManagerModules.dots;
      dots = {
        imports = [
          inputs.niri.homeManagerModules.default
          inputs.hyprland.homeManagerModules.default
          inputs.nvim.homeManagerModules.default
          inputs.fish.homeManagerModules.default
          inputs.tmux.homeManagerModules.default
          inputs.emacs.homeManagerModules.default
          inputs.cursors.homeManagerModules.default
        ];
      };
    };
  };
}
