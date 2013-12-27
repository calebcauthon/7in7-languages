0 == true println
"" == true println
nil == true println

0 == false println
"" == false println
nil == false println

Cars := Object clone
Cars has_a_roof := true
Cars slotNames println

MyCar := Cars clone
MyCar has_a_roof = false
MyCar slotNames println

"Car has a roof? #{Cars has_a_roof}" interpolate println
"MyCar has a roof? #{MyCar has_a_roof}" interpolate println

Cars drive := method("Vroom" println)
Cars drive