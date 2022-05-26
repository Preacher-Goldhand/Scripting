#!/bin/bash

PS3='Wybierz opcje: '
options=("Min-value" "Max-value" "Dlugosc stringa" "Porownanie stringow" "Substring" "Replace stringa" "Grep w pliku" "Wyjscie")  
select opt in "${options[@]}"

do
    case $opt in
    "Min-value")
        echo "minimum value"
        min=0
        
        read -p "Wprowadz a = " a
       
        read -p "Wprowadz b = " b
      
        read -p "Wprowadz c = " c
        
        if [ $a -lt $b ] && [ $a -lt $c ]; 
        then 
        	min=$a
        fi
      	if [ $b -lt $a ] && [ $b -lt $c ];
        then
        	min=$b
        fi
        if [ $c -lt $a ]  && [ $c -lt $b ];
        then
        	min=$c
        fi
        echo "Minimum value $min" 
        ;;
    "Max-value")
        echo "maximum value"
        max=0
       
        read -p "Wprowadz a = " a
        read -p "Wprowadz b = " b       
        read -p "Wprowadz c = " c
        
        if [ $a -gt $b ] && [ $a -gt $c ];
        then 
        	max=$a
        fi
      	if [ $b -gt $a ] && [ $b -gt $c ];
        then
        	max=$b
        fi
        if [ $c -gt $a ] && [ $c -gt $b ];
        then
        	max=$c
        fi
        echo "Maximum value $max" 
        ;;
    "Dlugosc stringa")
    	echo "dlugosc stringa"
    	read -p "Wprowadz stringa: " str
    	echo $str
    	echo "Dlugosc ${str} wynosi: ${#str}"
    	;;
    "Porownanie stringow")
    	echo "porownanie stringow"
    	read -p "Wprowadz str1: " str1
    	read -p "Wprowadz str2: " str2

    	
    	if [[ "$str1" == "$str2" ]]; 
    	then
    		echo "Stringi sa rowne"
    	else
    		echo "Stringi nie sa rowne"
    	fi 
    	;;
    "Substring")
    	#b=${a:12:5}
    	read -p "Wprowadz stringa: " str
    	read -p "Wprowadz startowy indeks: " index
    	read -p "Wprowadz dlugosc substringa: " substr
    	newStr=${str:index:substr}
    	echo "Substring: $newStr"
    	;;
    "Replace stringa")
    	echo "replace stringa"
    	#firstString="I love Suzi and Marry"
	#secondString="Sara"
	#echo "${firstString/Suzi/"$secondString"}" 
	read -p "Wprowadz pierwszego stringa: " str1
	read -p "Wprowadz, co chcesz zastapic:  " toReplace
	read -p "Wprowadz, czym chcesz zastapic: " strReplacing
	str=${str1/"$toReplace"/"$strReplacing"}
	echo "Replace stringa: ${str}"
    	;;
    "Grep w pliku")
    	echo "grep w pliku"
    	read -p "Wczytaj plik: " varFile
    	cat $varFile
    	echo " "
    	echo "Liczba linii w pliku to: " 
    	wc -l $varFile
    	echo ""
    	read -p "Podaj, czego szukasz: " toSearch
    	grep --color -i "$toSearch" $varFile	
    	;;
    "Wyjscie")
    	break
        ;;
    *)
        echo "invalid option $REPLY"
        ;;
    esac
done