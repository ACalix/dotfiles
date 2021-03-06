lib::check_cmd_exists git

# Prompt Configuration
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

abbr -a d 'gd $argv'
abbr -a s 'git status -sb'

abbr -a gd 'git diff -M'
abbr -a gdc 'git diff --cached -M'
abbr -a ga 'git add -A'
abbr -a gap 'ga -p'
abbr -a gau 'git add -u'
abbr -a gbr 'git branch -v'
abbr -a gc! 'git commit -v'
abbr -a gl 'git lg'
abbr -a gst 'git stash'
abbr -a gstp 'git stash pop'
abbr -a gup 'git pull'
abbr -a gf 'git fetch --prune'
abbr -a gc 'git commit -v -S'
abbr -a gp 'git push'
abbr -a gpthis 'git push origin (git_current_branch):(git_current_branch)'
