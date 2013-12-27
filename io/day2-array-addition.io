list1 := list(5,4,3)
list2 := list(100, 99)
list3 := list(1,1,1,1,1,1,1,1,1,1)
list5 := list(1,1,1,2,1,"A",1,1,1,1)

numbers := list(list1, list2, list3)

List + := method(operand, return call target sum + operand)

List sum := method(
  sum := 0
  
  call target foreach(i, v, 
    if((v type != List type) and v type != Number type, Exception raise("Only numbers, man."))
    sum = v + sum
  )
  return sum
)

List myAverage := method(
  return (call target sum / call target size)
)

"sum of list1 = #{list1 sum}" interpolate println
"sum of list2 = #{list2 sum}" interpolate println
"sum of list3 = #{list3 sum}" interpolate println
"sum of numbers = #{numbers sum}" interpolate println
"average of list2 = #{list2 myAverage}" interpolate println
"average of list5 = #{list5 myAverage}" interpolate println