lua << EOF
config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
EOF
