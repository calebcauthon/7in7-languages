team(blue).
team(red).
team(orange).
team(black).

increment(X, Y, 0) :- \+ (X = Y).
increment(X, X, 1).


count(0, []).
count(Count, [Head|Tail]) :- count(TailCount, Tail), Count is TailCount + 1.

count_where(0, [], Target).
count_where(Count, [Head|Tail], Target) :- count_where(TailCount, Tail, Target), increment(Head, Target, Amount), Count is TailCount + Amount.
