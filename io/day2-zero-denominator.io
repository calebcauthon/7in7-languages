OperatorTable addOperator("/!", 1)
standard_divisor := Number getSlot("/")

Number /! := method(divisor, call target standard_divisor(divisor))
Number / := method(divisor, 
    if(divisor == 0, return "a huge number",
      return call target /!(divisor)
    )
  )

"5 / 0 = #{5 / 0}" interpolate println
"8 / 4 = #{8 / 4}" interpolate println