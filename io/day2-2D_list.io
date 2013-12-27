Square := Object clone
Square board ::= list()
Square dim := method(x,y,
  full_board := list()

  for(rank_index, 0, 8, 
    file := list
    for(file_index, 0, 8, 
      file atInsert(file_index, nil)
    )
    full_board atInsert(rank_index, file)
  )

  call target setBoard(full_board)
)
Square set :=  method(x,y,value, 
  call target board at(x) atPut(y, value)
)
Square get := method(x,y,
  return call target board at(x) at(y)
)

chessboard := Square clone
chessboard dim(8,8)
chessboard set(1,1,"white rook")
chessboard set(4,8,"black queen")

"board value at 1-1 is #{chessboard get(1,1)}" interpolate println
"board value at 4-8 is #{chessboard get(4,8)}" interpolate println

