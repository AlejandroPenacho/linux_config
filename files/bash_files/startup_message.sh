
#Extracts size of main disk, used and available memory
memoryArray=($(df -h | grep -P '^/dev/sda6' | grep -oP '[0-9]+(?=G)'))
memoryPercentage=($(df -h | grep -P '^/dev/sda6' | grep -oP '[0-9]+(?=%)'))

computer=$(cat ~/computerSpecs.txt)

OS=$(grep -oP '(?<=OS:).*' ~/computerSpecs.txt)
version=$(grep -oP '(?<=Cinnamon Version:).*' ~/computerSpecs.txt)
kernel=$(grep -oP '(?<=Linux Kernel:).*' ~/computerSpecs.txt)
processor=$(grep -oP '(?<=Processor:).*' ~/computerSpecs.txt)
memory=$(grep -oP '(?<=Memory:).*' ~/computerSpecs.txt)
hardDrive=$(grep -oP '(?<=Hard Drives:).*' ~/computerSpecs.txt)
graphic1=$(grep -oP '(?<=Graphics Card:).*' ~/computerSpecs.txt)
graphics2=$(grep -oP '(?<=Graphics Card1:).*' ~/computerSpecs.txt)

RED='\e[1;91m'
GREEN='\e[1;92m'
CYAN='\e[1;36m'
WHITE='\e[m'

nTotalBars=25
nUsedBars=$(($memoryPercentage*nTotalBars/100))
nAvailableBars=$(($nTotalBars-$nUsedBars))
coolBar=""

for i in $(seq 1 $nUsedBars)
do
	coolBar=${coolBar}"${RED}#"
done
for i in $(seq 1 $nAvailableBars)
do
	coolBar=${coolBar}"${GREEN}#"
done

return

printf "${GREEN}(((((((((((((((((((((/@@@@@@@@\t\t\t\e[1;97;105m $(date) \e[m\n"
printf "${GREEN}(((((((((((((((((((((((((((@@@\n"
printf "${GREEN}(((((((((((((((((((((((((((((@\t${CYAN}OS:${WHITE}\t\t$OS\n"
printf "${GREEN}((((((  ((((((((((((((((((((((\t${CYAN}Version:${WHITE}\t$version\n"
printf "${GREEN}((((((  ((((            ,(((((\t${CYAN}Kernel:${WHITE}\t\t$kernel\n"
printf "${GREEN}((((((  (((   (((  (((.  (((((\t${CYAN}Processor:${WHITE}\t$processor\n"
printf "${GREEN}((((((  (((   (((  (((.  (((((\t${CYAN}GPU:\e[m\t\t$graphic1\n"
printf "${GREEN}((((((  (((   (((  (((.  (((((\t${CYAN}RAM:${WHITE}\t\t$memory\n"
printf "${GREEN}((((((   (((((((((((((   (((((\t${CYAN}Hard drive:${WHITE}\t$hardDrive\n"
printf "${GREEN}@((((((                 ((((((\t${CYAN} L----- Size:\t\t${WHITE}${memoryArray[0]} GB\n"
printf "${GREEN}@@((((((((((((((((((((((((((((\t${CYAN}    |---Used:\t\t${WHITE}${memoryArray[1]} GB\t(${memoryPercentage}%%)\t${coolBar}"

printf "\n"
printf "${GREEN}@@@@((((((((((((((((((((((((((\t${CYAN}    |---Available:\t${WHITE}${memoryArray[2]} GB\t($((100-${memoryPercentage}))%%)\t${coolBar}\n"
printf "\n\n\n"
printf "\e[m"
