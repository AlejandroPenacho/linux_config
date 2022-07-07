
run_clean() {
	$@  1>/dev/null 2>/dev/null &
}

battery() {
	b=($(upower --enumerate))
	upower -i ${b[1]}
}

compute() {
	printf "$(($1))\n"
}

set_reminder() {
	REMINDER="$1 "
}

delete_reminder() {
	REMINDER=""
}


ñ() { 
	printf "\e[1;31mES\e[1;33mPA\e[1;31mÑA\n"
}

sed_files(){
	sed_command=$1
	file_list=$2

	for file in $file_list;
		 do mv ${file} $(sed ${sed_command} <<< ${file});
	done
}

