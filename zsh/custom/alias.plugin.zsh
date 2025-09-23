# fzf alias finder
af() {
  # Get the full alias definition line from fzf
  local selected
  selected=$(alias | fzf --height=40% --layout=reverse \
    --preview="echo {} | sed -e \"s/alias .*='//\" -e \"s/'$//\" | awk '{print \$1}' | xargs -I CMD bash -c 'man CMD || echo \"No man page for CMD\"'")

  # If a selection was made (fzf wasn't cancelled)
  if [[ -n "$selected" ]]; then
    # Extract just the alias name (not the full command)
    local alias_name
    alias_name=$(echo "$selected" | sed -e "s/alias //" -e "s/=.*//")
    # Place the alias name onto the current prompt using zsh's buffer stack
    print -z "$alias_name"
  fi
}

bindkey -s '^A' 'af\n'
