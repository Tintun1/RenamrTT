#! /usr/bin/bash

echo "----Ingrese nombre para renombrar----"
read Name
echo "--Ingrese ruta donde quiere renombrar (relativa o absoluta)--"
read File
# echo " $File y $Name"
ls $File 1> /dev/null 2> /dev/null
codigoEstado=$?
if [ $codigoEstado -ne 0 ];then
	echo "--No has seleccionado una ruta valida--"
	echo "[1]Usar ruta actual"
	echo "[2]Ingresar una nueva"
	read opcional
	if [ $opcional -eq 1 ];then
		File=.
	elif [ $opcional -eq 2 ];then
		echo "Ingrese ruta nueva:"
		read File
	fi
fi

cant=$(ls -1 $File | awk '{print $11}' | wc -l)
echo "--------------"
indice=1
arreglo=($(ls -1 $File)) 
for i in ${arreglo[@]}; do 
	echo "$i == $Name$indice"
	mv $File/$i $File/$Name$indice
	((indice++))
done

