#!/bin/bash

YELLOW='\033[1;33m'
RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
NC='\033[0m'

# For cron
HOME="/home/kreny"

declare -a PRODUCTS=(
	"CLion"
	"PyCharm"
	"Rider"
	"WebStorm"
)

printf "\n"

for PRODUCT in "${PRODUCTS[@]}"; do
	printf "${YELLOW}Resetting trial period for $PRODUCT${NC}"

	printf "\n    ${PURPLE}Removing evaluation key for $PRODUCT${NC} - "
	rm $HOME/.config/JetBrains/$PRODUCT*/eval/*.key 2>/dev/null &&
		printf "${GREEN}Removed!${NC}" ||
		printf "${RED}No evaluation key found!${NC}"

	printf "\n    ${PURPLE}Removing evlsprt entries in $PRODUCT options${NC} - "
	grep -q "evlsprt" $HOME/.config/JetBrains/$PRODUCT*/options/other.xml 2>/dev/null &&
		sed -i "/evlsprt/d" $HOME/.config/JetBrains/$PRODUCT*/options/other.xml &&
		printf "${GREEN}Removed!${NC}" ||
		printf "${RED}Entry not found!${NC}"

	printf "\n"
done

printf "\n${PURPLE}Removing additional JetBrains related files in ~/.java/.userPrefs/jetbrains/${NC} - "
rm -r $HOME/.java/.userPrefs/jetbrains/* 2>/dev/null &&
	printf "${GREEN}Removed!${NC}" ||
	printf "${RED}No additional files found!${NC}"

printf "\n\n"

echo $(date) >>$DOTFILES/.scripts/.logs/jetbrains_reset.last_ran.log
