sed "4 d" data1.csv > data11.csv
sed "1 d" data2.csv > data22.csv
awk '{ print FNR "," $0 }' data11.csv > salida1.csv
awk '{ print FNR "," $0 }' data22.csv > salida2.csv
awk '{ print FNR "," $0 }' data3.csv > salida3.csv
mv salida1.csv data1.csv
mv salida2.csv data2.csv
mv salida3.csv data3.csv
for f in *data*.csv;
do 
    sed -i "/^$f,/! s/^/$f,/" "$f"
done
rm data11.csv
rm data22.csv
{ for f in *data*.csv; do tail -n+1 "$f"; done; } > completo.csv
awk '{ print gensub(/([a-zA-Z])/,",""\\1",9)}' completo.csv > completo1.csv