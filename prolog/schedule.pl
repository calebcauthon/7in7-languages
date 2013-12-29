team(blue).
team(red).
team(orange).
team(black).
team(green).
team(purple).
team(yellow).
team(white).
team(gray).


increment(X, Y, 0) :- \+ (X = Y).
increment(X, X, 1).


count(0, []).
count(Count, [Head|Tail]) :- count(TailCount, Tail), Count is TailCount + 1.

count_where(0, [], Target).
count_where(Count, [Head|Tail], Target) :- count_where(TailCount, Tail, Target), increment(Head, Target, Amount), Count is TailCount + Amount.

cant_play_yourself(Schedule) :-
	[T1, T2, T3, T4, T5, T6, T7, T8] = Schedule,
	team(T1),
	team(T2),
	\+ (T1 = T2),
	team(T3),
	team(T4),
	\+ (T3 = T4),
	team(T5),
	team(T6),
	\+ (T5 = T6),
	team(T7),
	team(T8),
	\+ (T7 = T8).


cant_play_on_same_field_more_than(Team1, AllFields, Max) :- 
	[First_set, Second_set, Third_set, Fourth_set] = AllFields,

	count_where(Count, Fourth_set, Team1),
	count_where(Count, Second_set, Team1),
	count_where(Count, Third_set, Team1),
	count_where(Count, Fourth_set, Team1),
	Count < (Max + 1).

matchup([T1,T2]) :-
	team(T1),
	team(T2),
	\+ (T1 = T2).

unique_matchup([T1,T2], OtherMatchups) :-
	matchup([T1,T2]),
	matchup_isnt_in([T1,T2], OtherMatchups).
	%matchup_isnt_in([T2,T1], OtherMatchups).

matchup_isnt_in(ThisMatchup, []).
matchup_isnt_in(ThisMatchup, [FirstMatchup|TheRest]) :-
	\+ (ThisMatchup = FirstMatchup),
	matchup_isnt_in(ThisMatchup, TheRest).

matchups([T1,T2,T3,T4,T5,T6,T7,T8], Matchup1, Matchup2, Matchup3, Matchup4) :-
	Matchup1 = [T1, T2],
	Matchup2 = [T3, T4],
	Matchup3 = [T5, T6],
	Matchup4 = [T7, T8].

dont_repeat_matchups(Week1_Schedule, Week2_Schedule):-
	matchups(Week1_Schedule, Matchup1, Matchup2, Matchup3, Matchup4),
	matchups(Week2_Schedule, Matchup5, Matchup6, Matchup7, Matchup8),

	AllMatchups = [Matchup1, Matchup2, Matchup3, Matchup4, Matchup5, Matchup6, Matchup7, Matchup8],
	count_where(1, AllMatchups, Matchup1).
	%count_where(1, AllMatchups, Matchup2),
	%count_where(1, AllMatchups, Matchup3),
	%count_where(1, AllMatchups, Matchup4),
	%count_where(1, AllMatchups, Matchup5),
	%count_where(1, AllMatchups, Matchup6),
	%count_where(1, AllMatchups, Matchup7),
	%count_where(1, AllMatchups, Matchup8).

cant_appear_in(Team, []).
cant_appear_in(Team, [[Team1,Team2]|TheOtherMatchups]) :- 
	\+ (Team = Team1),
	\+ (Team = Team2),
	cant_appear_in(Team, TheOtherMatchups).

matchup_cant_appear_in(Matchup, []).
matchup_cant_appear_in([M1,M2], [[Team1,Team2]|TheOtherMatchups]) :- 
	\+ ([M1,M2] = [Team1,Team2]),
	\+ ([M2,M1] = [Team1,Team2]),
	matchup_cant_appear_in([M1,M2], TheOtherMatchups).

each_team_can_only_appear_once([]).
each_team_can_only_appear_once([[Team1,Team2]|TheRest]) :- 
	cant_appear_in(Team1, TheRest),
	cant_appear_in(Team2, TheRest),
	each_team_can_only_appear_once(TheRest).

each_matchup_can_only_appear_once([]).
each_matchup_can_only_appear_once([[Team1,Team2]|TheRest]) :- 
	matchup_cant_appear_in([Team1,Team2], TheRest),
	each_matchup_can_only_appear_once(TheRest).
	

add_game_to_schedule([], OtherMatchups, PreviousSchedule) :-
	OtherMatchups = [].

add_game_to_schedule(Slots, Schedule, PreviousSchedule) :-
	Slots = [FirstMatchup|TheRest],

	matchup(FirstMatchup),
	add_game_to_schedule(TheRest, OtherMatchups, PreviousSchedule),
	Schedule = [FirstMatchup|OtherMatchups],
	
	each_team_can_only_appear_once(Schedule),
	matchup_cant_appear_in(FirstMatchup, PreviousSchedule).

add_game_to_schedule(Slots, Schedule) :-
	Slots = [FirstMatchup|TheRest],

	matchup(FirstMatchup),
	add_game_to_schedule(TheRest, OtherMatchups),
	Schedule = [FirstMatchup|OtherMatchups],
	each_team_can_only_appear_once(Schedule),
	matchup_cant_appear_in(FirstMatchup, TheOtherMatchups).

add_game_to_schedule([], OtherMatchups) :-
	OtherMatchups = [].

concatenate([], List, List). 
concatenate([Head|Tail1], List, [Head|Tail2]) :-
 	concatenate(Tail1, List, Tail2).

game_schedule(Full_Schedule) :-
	

	team(X),
	team(Y),
	team(Z),
	team(ZA),

	M1 = [X, _],
	M6 = [X, _],

	M2 = [Z, _],
	M7 = [Z, _],

	M3 = [ZA, _],
	M8 = [ZA, _],

	M4 = [Y, _],
	M5 = [Y, _],

	M9 = [ZA],

	add_game_to_schedule([M1,M2,M3,M4], Week1_Schedule),
	add_game_to_schedule([M5,M6,M7,M8], Week2_Schedule, Week1_Schedule),
	add_game_to_schedule([M9], Week3_Schedule, concatenate(Week1_Schedule, Week2_Schedule)),

	%concatenate(Week1_Schedule,Week2_Schedule,Full_Schedule).
	Full_Schedule = [Week1_Schedule, Week2_Schedule, Week3_Schedule].

	%add_game_to_schedule([M5,M6,M7,M8], Full_Schedule).

	%Field1 = [W1T1, W1T2, W2T1, W2T2],
	%Field2 = [W1T3, W1T4, W2T3, W2T4],
	%Field3 = [W1T5, W1T6, W2T5, W2T6],
	%Field4 = [W1T7, W1T8, W2T7, W2T8],

	%All_Fields = [Field1, Field2, Field3, Field4],

	%dont_repeat_matchups(Week1Scheduled, Week2Schedule),

	% dont repeat games

	%cant_play_on_same_field_more_than(W1T1, All_Fields, 1),
	%cant_play_on_same_field_more_than(W1T2, All_Fields, 1),
	%cant_play_on_same_field_more_than(W1T3, All_Fields, 1),
	%cant_play_on_same_field_more_than(W1T4, All_Fields, 1),



	% count(W1T1, [W1T1, W1T2, W2T1, W2T2]) 

	%\+ ([W1T1, W1T2] = [W2T1, W2T2]), % can't play the same team twice
	%\+ (W1T3 + W1T4 = W2T3 + W2T4), % can't play the same team twice
	%\+ (W1T2 + W1T1 = W2T1 + W2T2), % can't play the same team twice
	%\+ (W1T3 + W1T4 = W2T4 + W2T3), % can't play the same team twice

	%\+ (W1T1 = W2T1), % can't play on the same field twice
	%\+ (W1T1 = W2T2), % can't play on the same field twice

	%\+ (W1T3 = W2T3), % can't play on the same field twice
	%\+ (W1T3 = W2T4), % can't play on the same field twice

all_different_teams(T1, T2, T3, T4, T5, T6, T7, T8) :- 

	team(T1), 
	team(T2), 
	\+ (T1 = T2),
	team(T3), 
	\+ (T2 = T3),
	\+ (T1 = T3),
	team(T4), 
	\+ (T3 = T4),
	\+ (T2 = T4),
	\+ (T1 = T4),
	team(T5), 
	\+ (T4 = T5),
	\+ (T3 = T5),
	\+ (T2 = T5),
	\+ (T1 = T5),
	team(T6), 
	\+ (T5 = T6),
	\+ (T4 = T6),
	\+ (T3 = T6),
	\+ (T2 = T6),
	\+ (T1 = T6),
	team(T7), 
	\+ (T6 = T7),
	\+ (T5 = T7),
	\+ (T4 = T7),
	\+ (T3 = T7),
	\+ (T2 = T7),
	\+ (T1 = T7),
	team(T8),
	\+ (T7 = T8),
	\+ (T6 = T8),
	\+ (T5 = T8),
	\+ (T4 = T8),
	\+ (T3 = T8),
	\+ (T2 = T8),
	\+ (T1 = T8).

