unless := method(
  truthy_thing := call target doMessage(call message argAt(0))
  if_true := call message argAt(2)
  if_false := call message argAt(1)

  if(truthy_thing, if_true, if_false)
)

Person := Object clone
Person living ::= true
Person kill := method("#{call target name} has become a killer." interpolate println)
Person love := method("#{call target name} loves again." interpolate println)

queen_regina := Person clone
queen_regina name := "Queen Regina"
queen_regina visit := method(what_to_do, call target doMessage(what_to_do))
queen_regina plan_visit := method(what_to_do, "#{call target name} will just #{what_to_do} later" interpolate println; call target future_plan := what_to_do)
queen_regina execute_scheduled_visit := method(call target doMessage(call target future_plan))

henry := Person clone
henry child := true
henry name := "Henry"

queen_regina plan_visit(henry unless(child, kill, love))
queen_regina execute_scheduled_visit