# Inspired by itchy

local tic="%(?,%{$fg[green]%}$%{$reset_color%},%{$fg[red]%}$%{$reset_color%})"
local user="%{$fg[cyan]%}%n%{$reset_color%}"

local host="%{$fg[cyan]%}@%m%{$reset_color%}"
local pwd="%{$fg[yellow]%}%~%{$reset_color%}"

local branch="%{$fg[white]%}$(git_prompt_info)%{$reset_color%}"

PROMPT='
%{$fg[white]%}$(git_prompt_info)%{$reset_color%}${pwd}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔%{$reset_color%}"
