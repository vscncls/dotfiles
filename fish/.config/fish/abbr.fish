function abbra --description 'Add an abbreviation and persist it to abbr.fish'
    abbr $argv
    echo "abbr $argv" >> ~/.config/fish/abbr.fish
end

abbr nv nvim
abbr g git
abbr gst git status
abbr ga git add
abbr glg git log
abbr gco git checkout
abbr gc git commit
abbr gb git branch
abbr gp git push
abbr ga git add
abbr gd git diff
