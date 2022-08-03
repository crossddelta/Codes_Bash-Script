#!/bin/bash
# Script para varrer uma rede informada

echo "========================================"
echo "============ S W E E P E R ============="
echo "========================================"

echo "Informe a rede a ser verificada:"
echo "Exemplo: 192.168.0"
read rede


for ip in {1..255};
do
echo "Executando ping no host $rede.$ip";
ipaddr=$(ping -c1 $rede.$ip | grep "pacotes" | cut -d' ' -f4);

if [ $ipaddr -eq 1 ]
then 
echo "Sucesso, o host $rede.$ip está ativo!" 
else
echo "Host inativo!"
fi;
done

echo "Processo concluído!"
