# patek 13tyho
cls

$pole_out=@()
$ted = (get-date)
$let = 25 # na kolik let cca.
$max_vterin = 60*60*24*31*12*$let #vteriny+minuty+hodiny+dny+$let
#echo $max_vterin
$vterin_za_den = 86400

for ($sec = 1; $sec -le $max_vterin; $sec = $sec + $vterin_za_den){ # main loop
#echo $sec
$cas_plus = $ted.AddSeconds(+$sec)
#echo $cas_plus
[string] $den = $cas_plus.Day
[string] $den_v_tydnu = $cas_plus.DayOfWeek

if (( $den -like "13" ) -and ( $den_v_tydnu -like "Friday" )) {
[string] $mesic = $cas_plus.Month
[string] $rok = $cas_plus.Year

$out="Patek"
#$out=$den_v_tydnu
$out+=" "
$out+=$den
$out+="."
if ( $mesic.Length -eq 1 ){ $mesic = "0" + $mesic}
$out+=$mesic
$out+="."
$out+=$rok

echo $out
$pole_out+=$out
}

} # konec main loop

# zapise vystup do souboru
$file_name = "Patek-13teho.txt"
Set-Content -Path $file_name -Encoding ASCII -Value $pole_out
Write-Host -ForegroundColor Yellow "ulozeno do souboru $file_name"

# ceka na zavreni okna
Read-Host -Prompt "Press ENTER = exit"

