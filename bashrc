# connection automatique
function connect {
	if [ $# -ne 0 ] ;
	then
		ssh -q -t -o StrictHostKeyChecking=no -o ConnectTimeout=5 mera@$1.dptinfo.ens-cachan.fr ;
		exit ;
		return ;
	fi
        for i in $(whoisup)
        do
                ssh -q -t -o StrictHostKeyChecking=no -o ConnectTimeout=5 mera@$i ;
                if [ $? -eq 0 ] ;
                then
			exit ;
                        break
                fi
        done
}

alias l='ls -al --color=yes'
alias ls='ls --color=yes'

function color_prompt {
	        export PS1='\033[1;36m\d \033[1;32m\t \033[1;33m\u@\033[1;35m\h:\w$(__git_ps1 " [\033[1;36m%s\033[1;35m]")$\033[0;0m '
	}

export PROMPT_COMMAND=color_prompt

#git things
# if .git-prompt.sh exists, set options and execute it
if [ -f ~/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true
  . ~/.git-prompt.sh
fi
