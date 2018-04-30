#!/bin/bash

mydate=`date +%d.%m.%Y`

hour=`date +%H`

mins=`date +%M`

req="https://www.vrsinfo.de/fahrplan/fahrplanauskunft.html?tx_vrsinfo_pi_connection%5Brequest%5D=result&tx_vrsinfo_pi_connection%5BoriginName%5D=Schloss+Birlinghoven%2C+Sankt+Augustin+-+Birlinghoven&tx_vrsinfo_pi_connection%5BoriginId%5D=de%3A05382%3A68569&tx_vrsinfo_pi_connection%5BoriginType%5D=stop&tx_vrsinfo_pi_connection%5BoriginTypes%5D%5B%5D=1&tx_vrsinfo_pi_connection%5BoriginTypes%5D%5B%5D=2&tx_vrsinfo_pi_connection%5BoriginTypes%5D%5B%5D=4&tx_vrsinfo_pi_connection%5BviaName%5D=&tx_vrsinfo_pi_connection%5BviaId%5D=&tx_vrsinfo_pi_connection%5BviaTime%5D=0&tx_vrsinfo_pi_connection%5BdestinationName%5D=Sankt+Augustin+Zentrum%2C+Sankt+Augustin&tx_vrsinfo_pi_connection%5BdestinationId%5D=de%3A05382%3A55711&tx_vrsinfo_pi_connection%5BdestinationType%5D=stop&tx_vrsinfo_pi_connection%5BdestinationTypes%5D%5B%5D=1&tx_vrsinfo_pi_connection%5BdestinationTypes%5D%5B%5D=2&tx_vrsinfo_pi_connection%5BdestinationTypes%5D%5B%5D=4&tx_vrsinfo_pi_connection%5Bdate%5D=$mydate&tx_vrsinfo_pi_connection%5Btime%5D=$hour%3A$mins&tx_vrsinfo_pi_connection%5BdepartureArrival%5D=departure&tx_vrsinfo_pi_connection%5BwalkingSpeed%5D=d&tx_vrsinfo_pi_connection%5BmeansOfTransport%5D%5B%5D=RegionalTrains&tx_vrsinfo_pi_connection%5BmeansOfTransport%5D%5B%5D=SuburbanTrains&tx_vrsinfo_pi_connection%5BmeansOfTransport%5D%5B%5D=LightRail&tx_vrsinfo_pi_connection%5BmeansOfTransport%5D%5B%5D=Bus&tx_vrsinfo_pi_connection%5BmeansOfTransport%5D%5B%5D=OnDemandServices&tx_vrsinfo_pi_connection%5BmeansOfTransport%5D%5B%5D=Boat&L=0"

curl $req -o vaina.txt

echo ""
echo ""
echo "             BUS  FROM  FRAUNHOFER"
echo "             ===  ====  =========="
echo ""
echo ""
echo "Next bus is going to arrive at: "
grep "div class=\"departure\" title=\"Abfahrt\">ab " vaina.txt | cut -d'>' -f3 | cut -d'<' -f1 | head -n1
echo ""
echo ""

rm vaina.txt