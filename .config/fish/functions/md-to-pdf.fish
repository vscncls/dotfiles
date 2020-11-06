function md-to-pdf --description 'Compiles md files to pdf using pandoc'
    if test -z $argv[1]
        echo "Please provide a file name."
        return
    end

    if not test -e $argv[1]
        echo "File not found."
        return
    end

    pandoc -s -o ""(echo $argv[1] | cut -f1 -d '.')".pdf" $argv[1]
end
