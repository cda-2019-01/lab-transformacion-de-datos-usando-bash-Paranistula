for x in {1..3}; do   
    while read linea;
         do echo -e "Línea: $linea";
    done < data${x}.csv; 
done
#lee los archivos