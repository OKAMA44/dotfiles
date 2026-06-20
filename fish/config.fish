if status is-interactive
# Commands to run in interactive sessions can go here
alias neofetch 'fastfetch -l arch2 -c /examples/6'
alias cbonsai 'cbonsai --screensaver --wait=1'
alias cmatrix 'rmatrix'
alias ls 'lsd -a1'

function fish_prompt
    printf '󰣇 '
    printf (prompt_pwd) 
    printf ' > '
end

pokemon-colorscripts -r
end
