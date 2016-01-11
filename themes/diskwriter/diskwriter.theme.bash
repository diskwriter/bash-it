#!/usr/bin/env bash

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true

export PROMPT_DIRTRIM=3

#foreground color theme;
time_color='\e[34;1m'
user_color='\e[34;1m'
separator_color='\e[33;1m'
directory_color='\e[32;1m'
git_color='\e[31;1m'

function prompt_command() {
        if [[ ${EUID} == 0 ]]; then
                PS1="${time_color}[\t]${green} ◉ ${user_color}\u ${separator_color}➜ ${directory_color}[\w]${normal}${git_color}$(__git_ps1 " ${yellow}◆ ${git_color}%s ")\r\n${magenta}➤${normal} "
        else
                PS1="${time_color}[\t]${green} ◉ ${user_color}\u ${separator_color}➜ ${directory_color}[\w]${normal}${git_color}$(__git_ps1 " ${yellow}◆ ${git_color}%s ")\r\n${red}➤${normal} "
        fi
}

PROMPT_COMMAND=prompt_command
