#! /usr/bin/env bash

startUrl="https://partners.doctolib.fr/availabilities.json\?start_date="
endUrlCrozon="\&visit_motive_ids=2737067\&agenda_ids=448538-448537-461784-411464-466406-411458-411465-452427-453263-464346\&insurance_sector=public\&practice_ids=164946\&destroy_temporary=true\&limit=7"
endUrlChateaulin="\&visit_motive_ids=2737067\&agenda_ids=448541-461752-411462-411460-448542-410749-452425-453262-464345-466508\&insurance_sector=public\&practice_ids=164629\&destroy_temporary=true\&limit=7"
date=$(date +"%Y-%m-%m")
crozon=$(curl -s "$startUrl""$date""$endUrlCrozon")
chateaulin=$(curl -s "$startUrl""$date""$endUrlChateaulin")
counter=0

echo "$crozon"
echo "$chateaulin"
echo $counter

while [[ $crozon == *"Aucune disponibilité en ligne."* ]] || [[ $chateaulin == *"Aucune disponibilité en ligne."* ]]
do
    date=$(date +"%Y-%m-%m")
    crozon=$(curl -s "$startUrl""$date""$endUrlCrozon")
    chateaulin=$(curl -s "$startUrl""$date""$endUrlChateaulin")

    if [[ $crozon != *"Aucune disponibilité en ligne."* ]]; then
      echo -e "\e[31mIl y a du vaccin sur Crozon !!\e[0m"
      echo -e "https://partners.doctolib.fr/centre-de-sante/chateaulin/centre-de-vaccination-covid-19-chateaulin-crozon?pid=practice-164946"
      open -a "Google Chrome" https://partners.doctolib.fr/centre-de-sante/chateaulin/centre-de-vaccination-covid-19-chateaulin-crozon?pid=practice-164946
      break
    fi

    if [[ $chateaulin != *"Aucune disponibilité en ligne."* ]]; then
        echo -e "\e[31mIl y a du vaccin sur Chateaulin !!\e[0m"
        echo -e "https://partners.doctolib.fr/centre-de-sante/chateaulin/centre-de-vaccination-covid-19-chateaulin-crozon?pid=practice-164629"
        open -a "Google Chrome" https://partners.doctolib.fr/centre-de-sante/chateaulin/centre-de-vaccination-covid-19-chateaulin-crozon?pid=practice-164629
        break
    fi

    sleep $(( ( RANDOM % 5 )  + 1 ))
    (( counter++ )) || true
    echo "$counter"
done
