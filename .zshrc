# zshrc template / helpers

# Source goto, a program that lets you quick travel to registered repos
[[ -s "$HOME/bin/goto.sh" ]] && source $HOME/bin/goto.sh

# An aliad to use pbcopy (paste bin copy) easily. This send the output that is piped to the clipboard
alias clip=pbcopy

# Exports my path bin, to have an easily accesible bin folder
export PATH=$PATH:$HOME/bin

# Lets us use the option(alt)-left and option-right keys in the terminal to skip between words
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

# Adds the default ssh key to keychain
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
