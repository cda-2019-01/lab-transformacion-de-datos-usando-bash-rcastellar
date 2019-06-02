#Elimino retorno
sed 's/\r//g' data1.csv > data11.csv
sed 's/\r//g' data2.csv > data21.csv
sed 's/\r//g' data3.csv > data31.csv

#Agregar nombre y eliminar espacio vacio
ls data11.csv | xargs awk '$1!=""{print FILENAME,$0}' OFS=','| sed 's/[[:space:]]\+/,/g' > out.1
ls data21.csv | xargs awk '$1!=""{print FILENAME,$0}' OFS=','| sed 's/[[:space:]]\+/,/g' > out.2
ls data31.csv | xargs awk '$1!=""{print FILENAME,$0}' OFS=','| sed 's/[[:space:]]\+/,/g' > out.3

#Ciclo para repetir nombre y columna
awk -F',' '{for (i=3 ; i<=NF; i++) {print $1,NR,$2,$i}}' OFS=',' out.1 > out.4
awk -F',' '{for (i=3 ; i<=NF; i++) {print $1,NR,$2,$i}}' OFS=',' out.2 > out.5
awk -F',' '{for (i=3 ; i<=NF; i++) {print $1,NR,$2,$i}}' OFS=',' out.3 > out.6

#Unir archivos
cat out.4 out.5 out.6 > out.7

#coloco nombre original
sed 's/1.csv/.csv/g' out.7 > data4.csv
#sed 's/$/\r/g' out.8 > data4.csv 
rm out.*
rm data21*
rm data11*
rm data31*
cat data4.csv   