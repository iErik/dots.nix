# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

A Nix flake that aggregates personal dotfiles modules into a unified configuration. It pulls in separate flake inputs for individual tool configs (neovim, emacs, fish, niri, cursors, wallpapers) that are maintained in separate repositories.

## Common Commands

```bash
nix flake check          # validate the flake
nix flake update         # update all flake inputs
nix flake update <input> # update a single input (e.g. nix flake update nvim)
nix flake show           # show available outputs
nix build .#<output>     # build a specific output
```

## Architecture

The flake currently defines inputs but has an empty `outputs` set. The intended pattern is to re-export or compose the modules from the input flakes into NixOS/home-manager modules or packages.

**Inputs:**
- `nixpkgs` — nixos-unstable channel, followed by all other inputs
- `wallpapers`, `cursors` — asset flakes
- `niri`, `nvim`, `emacs`, `fish` — individual tool configuration flakes, each following nixpkgs

All non-nixpkgs inputs are hosted under `github:iErik/` and use `inputs.nixpkgs.follows = "nixpkgs"` to ensure a single nixpkgs version across the entire configuration.
