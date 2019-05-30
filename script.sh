##Laboratorio 2
###Elimina la cuarta línea del data1 (No tiene información)
sed "4 d" data1.csv > data11.csv

###Elimina la primera línea del data2 (Está en blanco)
sed "1 d" data2.csv > data22.csv

### Imprime el número de la fila en la primera columna
awk '{ print FNR "," $0 }' data11.csv > salida1.csv
awk '{ print FNR "," $0 }' data22.csv > salida2.csv
awk '{ print FNR "," $0 }' data3.csv > salida3.csv

### Cambia los nombres de los archivos
mv salida1.csv data1.csv
mv salida2.csv data2.csv
mv salida3.csv data3.csv

#elimina archivos temporales
rm data11.csv
rm data22.csv

#imprime los data* y pega los 3 archivos, luego quita el espacio vacio y al final vuelve la última cfila en columnas.
ls data* | xargs awk '$1!=""{print FILENAME,$0}' OFS=',' | sed 's/[[:space:]]\+/,/g' | awk -F',' '{for (i=4 ; i<=NF; i++) {print $1,$2,$3,$i}}' OFS=','
