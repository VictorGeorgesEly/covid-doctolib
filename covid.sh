#!/bin/bash

crozon=$(curl -s https://partners.doctolib.fr/availabilities.json\?start_date\=2021-05-07\&visit_motive_ids\=2737067\&agenda_ids\=448538-448537-461784-411464-466406-411458-411465-452427-453263-464346\&insurance_sector\=public\&practice_ids\=164946\&destroy_temporary\=true\&limit\=7)
chateaulin=$(curl -s https://partners.doctolib.fr/availabilities.json\?start_date\=2021-05-07\&visit_motive_ids\=2737067\&agenda_ids\=448541-461752-411462-411460-448542-410749-452425-453262-464345-466508\&insurance_sector\=public\&practice_ids\=164629\&destroy_temporary\=true\&limit\=7)
counter=0

echo $crozon
echo $chateaulin
echo $counter

while [[ $crozon == *"Aucune disponibilité en ligne."* ]] || [[ $chateaulin == *"Aucune disponibilité en ligne."* ]]
do
    crozon=$(curl -s https://partners.doctolib.fr/availabilities.json\?start_date\=2021-05-07\&visit_motive_ids\=2737067\&agenda_ids\=448538-448537-461784-411464-466406-411458-411465-452427-453263-464346\&insurance_sector\=public\&practice_ids\=164946\&destroy_temporary\=true\&limit\=7)
    chateaulin=$(curl -s https://partners.doctolib.fr/availabilities.json\?start_date\=2021-05-07\&visit_motive_ids\=2737067\&agenda_ids\=448541-461752-411462-411460-448542-410749-452425-453262-464345-466508\&insurance_sector\=public\&practice_ids\=164629\&destroy_temporary\=true\&limit\=7)
    if [[ $crozon != *"Aucune disponibilité en ligne."* ]]; then
      echo "y'a du vaccin sur Crozon !!"
    fi

    if [[ $chateaulin != *"Aucune disponibilité en ligne."* ]]; then
        echo "y'a du vaccin sur Chateaulin !!"
    fi
    sleep $(( ( RANDOM % 5 )  + 1 ))
    let counter++
    echo $counter
done