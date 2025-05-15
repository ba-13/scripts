# To apply changes, open a new terminal or restart your shell.

##
# Source Znap at the start of your .zshrc file.
#
[[ -r ~/.zsh-plugins/znap/znap.zsh ]] ||
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.zsh-plugins/znap
source ~/.zsh-plugins/znap/znap.zsh


##
# Does your shell feels slow to start? `znap prompt` reduces the time between
# opening your terminal and seeing your prompt to just 15 - 40 ms!
#
# znap prompt agnoster/agnoster-zsh-theme

# `znap prompt` also supports Oh-My-Zsh themes. Just make sure you load the
# required libs first:
znap source ohmyzsh/ohmyzsh
# znap prompt sindresorhus/pure

# ZSH_THEME="robbyrussell"
# source "$HOME/.zsh-plugins/ohmyzsh/ohmyzsh/themes/$ZSH_THEME.zsh-theme"
# znap prompt ohmyzsh/ohmyzsh themes/robbyrussell
znap prompt ohmyzsh/ohmyzsh themes/gnzh

# Using your own custom prompt? After initializing the prompt, just call
# `znap prompt` without arguments to get it to show:
# PS1=$'%(?,%F{g},%F{r})%#%f '
# znap prompt

# The same goes for any other kind of custom prompt:
# znap eval starship 'starship init zsh --print-full-init'
# znap prompt

# NOTE that `znap prompt` does not work with Powerlevel10k.
# With that theme, you should use its "instant prompt" feature instead.


##
# Load your plugins with `znap source`.
#
# You can also choose to load one or more files specifically:
znap source sorin-ionescu/prezto modules/{environment,history}

# No special syntax is needed to configure plugins. Just use normal Zsh
# statements:

znap source marlonrichert/zsh-hist
bindkey '^[q' push-line-or-edit
bindkey -r '^Q' '^[Q'

ZSH_AUTOSUGGEST_STRATEGY=( history )
znap source zsh-users/zsh-autosuggestions

ZSH_HIGHLIGHT_HIGHLIGHTERS=( main brackets )
znap source zsh-users/zsh-syntax-highlighting

znap source marlonrichert/zsh-autocomplete
znap source marlonrichert/zsh-edit

##
# Cache the output of slow commands with `znap eval`.
#

# If the first arg is a repo, then the command will run inside it. Plus,
# whenever you update a repo with `znap pull`, its eval cache gets regenerated
# automatically.
# znap eval trapd00r/LS_COLORS "$( whence -a dircolors gdircolors ) -b LS_COLORS"

# The cache gets regenerated, too, when the eval command has changed. For
# example, here we include a variable. So, the cache gets invalidated whenever
# this variable has changed.
# znap source marlonrichert/zcolors
# znap eval   marlonrichert/zcolors "zcolors ${(q)LS_COLORS}"

# Combine `znap eval` with `curl` or `wget` to download, cache and source
# individual files:
# znap eval omz-git 'curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh'


##
# Defer initilization code with lazily loaded functions created by
# `znap function`.
#

# Personal alias
alias c="clear"
alias rp="chmod +x"
alias vim="nvim"
alias clip="xclip -sel clip"
alias mount_shared="sudo mount ba13-nitro:/attached/SHARED /mnt/SHARED"
alias mount_shared_repo="sudo mount ba13-nitro:/attached/SHARED_REPO /mnt/SHARED_REPO"
alias unmount_shared="sudo umount /mnt/SHARED"
alias unmount_shared_repo="sudo umount /mnt/SHARED_REPO"
alias charge_till_full='sudo sed -i "s/START_CHARGE_THRESH_BAT0.*/START_CHARGE_THRESH_BAT0=0/" /etc/tlp.conf;
sudo sed -i "s/STOP_CHARGE_THRESH_BAT0.*/STOP_CHARGE_THRESH_BAT0=100/" /etc/tlp.conf;
sudo tlp start;'
alias charge_safe='sudo sed -i "s/START_CHARGE_THRESH_BAT0.*/START_CHARGE_THRESH_BAT0=60/" /etc/tlp.conf;
sudo sed -i "s/STOP_CHARGE_THRESH_BAT0.*/STOP_CHARGE_THRESH_BAT0=80/" /etc/tlp.conf;
sudo tlp start;'
export PATH="$HOME/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('${HOME}/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# History Ignore
export HISTORY_IGNORE="pwd:ls"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install Ruby Gems to local
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH


[ -f "/home/ba13/.ghcup/env" ] && . "/home/ba13/.ghcup/env" # ghcup-env
