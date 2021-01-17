# Additional configuration for `nix-index` to enable `command-not-found` functionality with Fish.
{ config, lib, pkgs, ... }:

{
  config = lib.mkIf config.programs.nix-index.enable {
    programs.fish.interactiveShellInit = ''
      function __fish_command_not_found_handler --on-event="fish_command_not_found"
        ${pkgs.bashInteractive}/bin/bash -c \
          "source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh; command_not_found_handle $argv"
       end
    '';
    };
}
