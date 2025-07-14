{ config, pkgs, lib, ... }:
  let 
    nixvim = import (builtins.fetchGit {
      url = "https://github.com/nix-community/nixvim";
      ref = "nixos-25.05";
    });
  in {
    imports = [ nixvim.homeModules.nixvim ];

    programs.nixvim = {
      enable = true;

      clipboard.register = "unnamedplus";
      colorscheme = "murphy";
      vimAlias = true;
      
      globals = {
        mapleader = " ";
        maplocalleader = "\\";
      };

      keymaps = [
        { # Prevent conflicts with leader mapped to space
          mode = [ "n" "v" ];
          key = "<Space>";
          action = "<Nop>";
          options.silent = true;
        }

        # Indentation
        { mode = [ "v" ]; key = "<Tab>"; action = ">gv"; }  # Indent selected
        { mode = [ "v" ]; key = "<S-Tab"; action = "<gv"; }  # Un-indent selected

        # Spit navigation
        { mode = [ "n" ]; key = "<C-d>"; action = "<C-w>k"; }  # Move to split above
        { mode = [ "n" ]; key = "<C-m>"; action = "<C-w>j"; }  # Move to split below
        { mode = [ "n" ]; key = "<C-h>"; action = "<C-w>h"; }  # Move to split left
        { mode = [ "n" ]; key = "<C-s>"; action = "<C-w>l"; }  # Move to split right
      ];

      opts = {
        # Indentation
        autoindent = true;          # Newlines match current line indent
        breakindent = true;         # Indent wrapped lines
        briopt = "min:20,shift:2";  # Additional breakindent options
        expandtab = true;           # Tabs are spaces
        shiftwidth = 2;             # Number of spaces to insert on a tab
        smartindent = true;         # Automatically indent after open braces and keywords
        softtabstop = 2;            # Number of spaces in tab when editing
        tabstop = 2;                # Number of visual spaces per TAB

        # Searching
        hlsearch = true;            # Highlight search matches
        ignorecase = true;          # Ignore case in searches by default
        incsearch = true;           # Search as characters are entered
        smartcase = true;           # Make searches case sensitive if an uppercase is entered

        # UI config
        cursorline = false;         # Underline the current line
        mouse = "a";                # Enable the mouse
        number = true;              # Show absolute number
        relativenumber = true;      # Use relative numbers on non-current lines
        scrolloff = 4;              # Minimum number of lines visible above or below the cursor
        showmode = true;            # Show the current mode (insert, visual, etc.)
        splitbelow = true;          # Open new vertical splits on the bottom
        splitright = true;          # Open new horizontal splits on the right
        termguicolors = true;       # Enable 24-bit RGB color in the TUI
      };
    };
  }

