team(red).
team(blue).
team(orange).
team(white).
team(black).
team(green).
team(pink).
team(purple).

field(one).
field(two).
field(three).
field(four).

game(T1, T2, F) :-
	team(T1),
	team(T2),
	\+ (T1 = T2),
	field(F).

anot_equal([team(A),team(B)],[team(C),team(D)]) :-
	\+ ([A,B] = [C,D]),
	\+ ([B,A] = [C,D]).

not_equal(A,B) :-
	\+ (A = B).


unique([]).
unique([This|[]]).
unique([This,Last]) :-
	not_equal(This, Last).
unique([This|[Next|TheRest]]) :-
	not_equal(This, Next),
	unique([This|TheRest]).

unique_concat(List1,List2) :-
	concatenate(List1,List2,List3),
	unique(List3).

concatenate([], List, List). 
concatenate([Head|Tail1], List, [Head|Tail2]) :-
 	concatenate(Tail1, List, Tail2).

schedule(S) :-
	team(G11),
	team(G12),
	unique([G11,G12]), 
	team(G13),
	unique([G11,G12,G13]),
	team(G14),
	unique([G11,G12,G13,G14]),
	team(G15),
	unique([G11,G12,G13,G14,G15]),
	team(G16),
	unique([G11,G12,G13,G14,G15,G16]),
	team(G17),
	unique([G11,G12,G13,G14,G15,G16,G17]),
	team(G18),
	unique([G11,G12,G13,G14,G15,G16,G17,G18]),
	
	unique([G11,G12,G13,G14,G15,G16,G17,G18]),
	
	Week1Matchups = [[G11,G12], [G13,G14], [G15,G16], [G17,G18]],
	unique(Week1Matchups),

	team(G21),
	team(G22),
	unique([G21,G22]),
	unique_concat([G21,G22], Week1Matchups),
	team(G23),
	unique([G21,G22,G23]),
	team(G24),
	unique([G21,G22,G23,G24]),
	unique([[G11,G12], [G13,G14], [G15,G16], [G17,G18], [G21,G22], [G23,G24]]),
	team(G25),
	unique([G21,G22,G23,G24,G25]),
	team(G26),
	unique([G21,G22,G23,G24,G25,G26]),
	unique([[G11,G12], [G13,G14], [G15,G16], [G17,G18], [G21,G22], [G23,G24], [G25,G26]]),
	team(G27),
	unique([G21,G22,G23,G24,G25,G26,G27]),
	team(G28),
	unique([G21,G22,G23,G24,G25,G26,G27,G28]),
	unique([[G11,G12], [G13,G14], [G15,G16], [G17,G18], [G21,G22], [G23,G24], [G25,G26], [G27,G28]]),

	team(G31),
	team(G32),
	unique([G31,G32]),
	unique([[G31,G32], [G11,G12], [G13,G14], [G15,G16], [G17,G18], [G21,G22], [G23,G24], [G25,G26], [G27,G28]]),
	team(G33),
	unique([G31,G32,G33]),
	team(G34),
	unique([G31,G32,G33,G34]),
	unique([[G33,G34], [G31,G32], [G11,G12], [G13,G14], [G15,G16], [G17,G18], [G21,G22], [G23,G24], [G25,G26], [G27,G28]]),
	team(G35),
	unique([G31,G32,G33,G34,G35]),
	team(G36),
	unique([G31,G32,G33,G34,G35,G36]),
	unique([[G35,G36], [G33,G34], [G31,G32], [G11,G12], [G13,G14], [G15,G16], [G17,G18], [G21,G22], [G23,G24], [G25,G26], [G27,G28]]),
	team(G37),
	unique([G31,G32,G33,G34,G35,G36,G37]),
	team(G38),
	unique([G31,G32,G33,G34,G35,G36,G37,G38]),
	unique([[G37,G38], [G35,G36], [G33,G34], [G31,G32], [G11,G12], [G13,G14], [G15,G16], [G17,G18], [G21,G22], [G23,G24], [G25,G26], [G27,G28]]),

	Week1to3Matchups = [[G37,G38], [G35,G36], [G33,G34], [G31,G32], [G11,G12], [G13,G14], [G15,G16], [G17,G18], [G21,G22], [G23,G24], [G25,G26], [G27,G28]],

	team(G41),
	team(G42),
	unique([G41,G42]),
	unique_concat([G41,G42], Week1to3Matchups),

	team(G43),
	unique([G41,G42,G43]),
	team(G44),
	unique([G41,G42,G43,G44]),
	unique_concat([[G43,G44],[G41,G42]], Week1to3Matchups),

	team(G45),
	unique([G41,G42,G43,G44,G45]),
	team(G46),
	unique([G41,G42,G43,G44,G45,G46]),
	unique_concat([[G45,G46],[G43,G44],[G41,G42]], Week1to3Matchups),

	team(G47),
	unique([G41,G42,G43,G44,G45,G46,G47]),
	team(G48),
	unique([G41,G42,G43,G44,G45,G46,G47,G48]),
	unique_concat([[G47,G48],[G45,G46],[G43,G44],[G41,G42]], Week1to3Matchups),

	concatenate([[G47,G48],[G45,G46],[G43,G44],[G41,G42]], Week1to3Matchups, Week1to4Matchups),

	team(G51),
	team(G52),
	unique([G51,G52]),
	unique_concat([G51,G52], Week1to4Matchups),

	team(G53),
	unique([G51,G52,G53]),
	team(G54),
	unique([G51,G52,G53,G54]),
	%unique_concat([[G53,G54],[G51,G52]], Week1to4Matchups),

	team(G55),
	unique([G51,G52,G53,G54,G55]),
	team(G56),
	unique([G51,G52,G53,G54,G55,G56]),
	%unique_concat([[G55,G56],[G53,G54],[G51,G52]], Week1to4Matchups),

	%team(G57),
	%unique([G51,G52,G53,G54,G55,G56,G57]),
	%team(G58),
	%unique([G51,G52,G53,G54,G55,G56,G57,G58]),
	%unique_concat([[G57,G58],[G55,G56],[G53,G54],[G51,G52]], Week1to4Matchups),


	Games = [
		[G11,G12], [G13,G14], [G15,G16], [G17,G18], end1,
		[G21,G22], [G23,G24], [G25,G26], [G27,G28], end2, 
		[G31,G32], [G33,G34], [G35,G36], [G37,G38], end3, 
		[G41,G42], [G43,G44], [G45,G46], [G47,G48]%, end4,
		%[G51,G52], [G53,G54], [G55,G56], [G57,G58], end5
	],

	%unique(Games),

	S = Games.









