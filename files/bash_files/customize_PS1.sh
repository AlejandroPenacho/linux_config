get_branch() {
	fullName=$(git branch | grep -oP --colour=never '(?<=\* \e\[32m).*')
	if echo $fullName | grep 'HEAD' > /dev/null 2>&1
	then
		echo $fullName | grep -oP --colour=NEVER "(?<=detached at ).*(?=\)\e\[m)"
	else
		echo $fullName | grep -oP --color=NEVER ".*(?=\e\[m)"
	fi
}

set_PS1(){
	if [ $1 = "basic" ]
	then
		PROMPT_COMMAND=update_PS1_basic
	else
		PROMPT_COMMAND=update_PS1_extra
	fi
}



update_PS1_basic(){

	if git branch >/dev/null 2>&1
	then
		gitState=" \[\e[1;96m\]($(get_branch))\[\e[1;35m\]"
	else
		gitState=""
	fi


	if [ -z $CONDA_DEFAULT_ENV ]
	then
		condaState=""
	else
		condaState="\[\e[1;37m\](${CONDA_DEFAULT_ENV})\[\e[m\] "
	fi

	PS1="\[\e[1;91m\]${REMINDER}${condaState}\[\e[1;33m\]\D{%a %d}-\[\e[1;32m\]\A:\[\e[1;34m\]\w\[\e[1;35m\]${gitState} > \[\e[0;39m\]"
}


update_PS1_extra() {
	if git branch >/dev/null 2>&1
	then
		if git status 2>/dev/null | grep 'not staged' > /dev/null 2>&1
		then
			WDState="+"
		elif git status 2>/dev/null | grep 'Untracked' > /dev/null 2>&1
		then
			WDState="+"
		else
			WDState="="
		fi
		if git status 2>/dev/null | grep 'to be committed' > /dev/null 2>&1
		then
			indexState="+"	
		else
			indexState="="
		fi

	gitState=" \[\e[1;96m\](${WDState}${indexState}$(get_branch))\[\e[1;35m\]"

	else
		gitState=""
	fi


	if [ -z $CONDA_DEFAULT_ENV ]
	then
		condaState=""
	else
		condaState="\[\e[1;37m\](${CONDA_DEFAULT_ENV})\[\e[m\] "
	fi

	PS1="\[\e[1;91m\]${REMINDER}${condaState}\[\e[1;33m\]\D{%a %d}-\[\e[1;32m\]\A:\[\e[1;34m\]\w\[\e[1;35m\]${gitState} > \[\e[0;39m\]"


}

PROMPT_COMMAND=update_PS1_extra
