#
# Location: $HOME/.config/nixpkgs/config.nix
# Usage: nix-env -iA
#
with import <nixpkgs> {};

{

    # Fucking steam. Why you gotta make me do this.
    config.allowUnfree = true;

    allowUnfree = true;

    packageOverrides = pkgs_: with pkgs_; {
        all = with pkgs; buildEnv {
            name = "all";
            paths = [
              wget
              tmux
              i3status
              gnupg
              terminator
              dmenu
              firefox
              pass
              i3lock
              xfce.thunar
              xfce.thunar_volman
              file
              gitAndTools.gitFull
              networkmanagerapplet
              obs-studio
              docker-edge
              mr
              gnumake
              audacity
              gimp
              htop
              lsof
              docker_compose
              vagrant
              steam
              python3Full
              python35Packages.virtualenv
              bind
              graphviz
              # go
              libressl
              unzip
              mplayer
              moc
              whois
              pwgen
              binutils
              clang
              keybase
              keybase-gui
              kbfs
              xclip
              rng_tools
              imagemagick
              libreoffice
              arandr
              tahoelafs
            ];
        };
    };
}
