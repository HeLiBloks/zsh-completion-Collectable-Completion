
SHELL=/bin/zsh

listInstalledCompletions:
	locate -eLi0 --regex 'zsh.*\/_{1}[a-z0-9]\w*' | xargs -0 grep -HPo '^#compdef\s\K.*' > completionFilelist

completion_function_tags:
	locate --regex 'zsh.*\/_{1}[a-z0-9]\w*' |\
	xargs grep --files-with-matches -P '\A#[^c]'|\
	ctags -L - -f - --extras=\* --language-force=sh --sh-kinds=\*| sed '/kind:function/d ;s/kind:file\|F/kind:function/' > tags

compile:
	zsh -n _* && zcompile compiled _*

clean:
	rm -f compiled tags
