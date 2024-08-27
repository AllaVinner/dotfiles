
# This is a nice comment

Example links
.bashrc
.zshrc
.config/
.config/nvim/init.lua

However, I do not want:
.config/nvim/lazy-lock.json

Potentially we want some cron jobs too.

## What I Want

I want to be able to add things to my `.dotfiles` project.
`dotfiles add --name git --file .gitignore --file folder`

### Add

### Load
`dotfiles load <project_name>` 

1. Move old files to "old" folder
2. Create Link files that points to the new repo
3.




## Project

### List of Projects
- git
- neovim
- shell (bashrc, zsh, ...)


### What a Project Consists of

A set of files and folders.
[Optional] .gitignore
[Optional] profiles

- root
    - .gitignore
    - dotfile.config.yml or TOML
    - src
        - init.lua
        - some_ignorable.json

### Project Config

- root_folder: "$Home/some"
- 
















