fib := method(n,
  if(n == 1, return 1,
    if(n == 2, return 1, 
      return (fib(n - 2) + fib(n - 1))
    )
  )
)

f := 1
for(f, 1, 10, "#{fib(f)} " interpolate print)
