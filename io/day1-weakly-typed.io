# show weakly typed-ness of Io

airplane := Object clone
jetta := Object clone

airplane feature := "wings"
jetta feature := "tires"

best_feature := method(vehicle, vehicle feature)

"the best feature for the jetta is #{jetta feature}" interpolate println
"the best feature for the airplane is #{airplane feature}" interpolate println



