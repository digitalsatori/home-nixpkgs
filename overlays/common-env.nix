self: super: {
  myGems = super.pkgs.callPackage ../pkgs/ruby-gems {};
  myNodePackages =  super.pkgs.callPackage ../pkgs/node-packages {};
  myPythonPackages = import ../pkgs/python-packages/requirements.nix {};

  myCommonEnv = self.buildEnv {
    name = "CommonEnv";
    paths = with self.pkgs; [
      # Some basics
      coreutils
      cloc
      curl
      fish-foreign-env
      gotop
      htop
      hyperfine
      mosh
      parallel
      ripgrep
      s3cmd
      unstable.nodePackages.speed-test
      thefuck
      tldr
      unrar
      wget
      xz

      # My wrapped and config derivations
      myBat
      myGitEnv # includes diff-so-fancy and hub
      myKitty
      myNeovimEnv # includes neovim-remote

      # Useful nix related tools
      bundix
      cachix
      nixops
      unstable.nodePackages.node2nix
      pypi2nix

      # Haskell stuff
      (all-hies.selection { selector = p: { inherit (p) ghc865 ghc864 ghc863; }; })
      cabal-install
      ghc
      haskellPackages.hoogle
      stack

      # Other dev stuff
      unstable.ccls
      google-cloud-sdk
      lua
      luaPackages.luacheck
      unstable.luaPackages.lua-lsp
      nodejs
      myNodePackages.serverless
      unstable.nodePackages.bash-language-server
      unstable.nodePackages.typescript
      vim-vint
      watchman
      yarn
    ];
  };
}
