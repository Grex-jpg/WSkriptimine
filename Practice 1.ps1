#Siin proovib aru saada kuidas kasutada $nameArray-ed
#Alguses paneb kirja "shotcutid"

$arry1 = @(1,2,3)
$arry2 = @(4,5,6)
$arry3 = @()

#Siis saab neid kasutada arvutamisel et saada arry3 vastuseks 5 7 ja 9

$arry3 += $arry1[0] + $arry2[0]
$arry3 += $arry1[1] + $arry2[1]
$arry3 += $arry1[2] + $arry2[2]


$arry3

pause