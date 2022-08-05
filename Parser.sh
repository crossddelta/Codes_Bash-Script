#!/bin/bash
# Script que varre um arquivo index.html baixado pelo wget procurando por domínios e
# subdomínios, em seguida traduz os endereços para ip e imprime na tela

printf "================================================================\n"
printf "========================= P A R S E R ==========================\n"
printf "================================================================\n"
printf "Informe um domínio para verificar subdomínios e respectivos \nendereços IP em seu HTML\n"
printf "Exemplo: www.google.com\nDigite o endereço: "
read domain

wget $domain 2> /dev/null
cat index.html | grep "href" | cut -d "/" -f 3 | cut -d '"' -f 1 | grep "\." > lista

printf "================================================================\n"
printf "%30s | %20s\n" "DOMINIO" "ENDERECO IP"

for url in $(cat lista);
do
	dominio=$(host $url | grep "has" | cut -d " " -f 1);
	ip=$(host $url | grep "has" | cut -d " " -f 4);
	printf "%30s | %20s\n" "$dominio" "$ip";
done

printf "================================================================"

rm index.html
rm lista
