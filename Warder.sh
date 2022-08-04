#!/bin/bash

echo    "====================================="
echo    "============ W A R D E R ============"
echo -e "=====================================\n"
echo "Informe a porta que deseja verificar:"
echo "Exemplo: 80"
read porta
echo "Informe a rede a ser escaneada:"
echo "Exemplo: 192.168.0"
read rede

for host in {1..255};
do
	echo "Verificando a porta $porta no endereço $rede.$host";
	scanned=$(sudo hping3 -S -p $porta -c 1 $rede.$host 2> /dev/null | grep "flags" | cut -d" " -f7 | cut -d"=" -f2 );

	if [ "$scanned" == "SA" ]
	then
		echo "|Sucesso! Porta $porta aberta|"
	else
		echo "|Porta inacessível|"
	fi
done

