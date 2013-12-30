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

equal([A,B],[B,A]).
equal(A,B) :-
	(A = B).


unique([]).
unique([This|[]]).
unique([This,Last]) :-
	\+ equal(This, Last).
unique([This|[Next|TheRest]]) :-
	\+ equal(This, Next),
	unique([This|TheRest]).

unique_concat(List1,List2,List3) :-
	concatenate(List1,List2,List3),
	unique(List3).

unique_concat(List1,List2) :-
	concatenate(List1,List2,List3),
	unique(List3).

concatenate([], List, List). 
concatenate([Head|Tail1], List, [Head|Tail2]) :-
 	concatenate(Tail1, List, Tail2).

schedule(S) :-
	team(G11), G_10 = [G11],
	team(G12), unique_concat([G12], G_10, G_11),
	team(G13), unique_concat([G13], G_11, G_12),
	team(G14), unique_concat([G14], G_12, G_13),
	team(G15), unique_concat([G15], G_13, G_14),
	team(G16), unique_concat([G16], G_14, G_15),
	team(G17), unique_concat([G17], G_15, G_16),
	team(G18), unique_concat([G18], G_16, G_17),
	
	M_0 = [[G11,G12], [G13,G14], [G15,G16], [G17,G18]],

	team(G21), G_20 = [G21],
	team(G22), unique_concat([G22], G_20, G_21), unique_concat([[G21,G22]], M_0, M_1),
	team(G23), unique_concat([G23], G_21, G_22), 
	team(G24), unique_concat([G24], G_22, G_23), unique_concat([[G23,G24]], M_1, M_2),
	team(G25), unique_concat([G25], G_23, G_24), 
	team(G26), unique_concat([G26], G_24, G_25), unique_concat([[G25,G26]], M_2, M_3),
	team(G27), unique_concat([G27], G_25, G_26), 
	team(G28), unique_concat([G28], G_26, G_27), unique_concat([[G27,G28]], M_3, M_4),

	team(G31), G_30 = [G31],
	team(G32), unique_concat([G32], G_30, G_31), unique_concat([[G31,G32]], M_4, M_5),
	team(G33), unique_concat([G33], G_31, G_32), 
	team(G34), unique_concat([G34], G_32, G_33), unique_concat([[G33,G34]], M_5, M_6),
	team(G35), unique_concat([G35], G_33, G_34), 
	team(G36), unique_concat([G36], G_34, G_35), unique_concat([[G35,G36]], M_6, M_7),
	team(G37), unique_concat([G37], G_35, G_36), 
	team(G38), unique_concat([G38], G_36, G_37), unique_concat([[G37,G38]], M_7, M_8),

	team(G41), G_40 = [G41],
	team(G42), unique_concat([G42], G_40, G_41), unique_concat([[G41,G42]], M_8, M_9),
	team(G43), unique_concat([G43], G_41, G_42), 
	team(G44), unique_concat([G44], G_42, G_43), unique_concat([[G43,G44]], M_9, M_10),
	team(G45), unique_concat([G45], G_43, G_44), 
	team(G46), unique_concat([G46], G_44, G_45), unique_concat([[G45,G46]], M_10, M_11),
	team(G47), unique_concat([G47], G_45, G_46), 
	team(G48), unique_concat([G48], G_46, G_47), unique_concat([[G47,G48]], M_11, M_12),

	team(G51), G_50 = [G51],
	team(G52), unique_concat([G52], G_50, G_51), unique_concat([[G51,G52]], M_12, M_13),
	team(G53), unique_concat([G53], G_51, G_52), 
	team(G54), unique_concat([G54], G_52, G_53), unique_concat([[G53,G54]], M_13, M_14),
	team(G55), unique_concat([G55], G_53, G_54), 
	team(G56), unique_concat([G56], G_54, G_55), unique_concat([[G55,G56]], M_14, M_15),
	team(G57), unique_concat([G57], G_55, G_56), 
	team(G58), unique_concat([G58], G_56, G_57), unique_concat([[G57,G58]], M_15, M_16),


	team(G61), G_60 = [G61],
	team(G62), unique_concat([G62], G_60, G_61), unique_concat([[G61,G62]], M_16, M_17),
	team(G63), unique_concat([G63], G_61, G_62), 
	team(G64), unique_concat([G64], G_62, G_63), unique_concat([[G63,G64]], M_17, M_18),
	team(G65), unique_concat([G65], G_63, G_64), 
	team(G66), unique_concat([G66], G_64, G_65), unique_concat([[G65,G66]], M_18, M_19),
	team(G67), unique_concat([G67], G_65, G_66), 
	team(G68), unique_concat([G68], G_66, G_67), unique_concat([[G67,G68]], M_19, M_20),

	team(G71), G_70 = [G71],
	team(G72), unique_concat([G72], G_70, G_71), unique_concat([[G71,G72]], M_20, M_21),
	team(G73), unique_concat([G73], G_71, G_72), 
	team(G74), unique_concat([G74], G_72, G_73), unique_concat([[G73,G74]], M_21, M_22),
	team(G75), unique_concat([G75], G_73, G_74), 
	team(G76), unique_concat([G76], G_74, G_75), unique_concat([[G75,G76]], M_22, M_23),
	team(G77), unique_concat([G77], G_75, G_76), 
	team(G78), unique_concat([G78], G_76, G_77), unique_concat([[G77,G78]], M_23, M_24),

	Games = [
		[G11,G12], [G13,G14], [G15,G16], [G17,G18], end1,
		[G21,G22], [G23,G24], [G25,G26], [G27,G28], end2, 
		[G31,G32], [G33,G34], [G35,G36], [G37,G38], end3, 
		[G41,G42], [G43,G44], [G45,G46], [G47,G48], end4,
		[G51,G52], [G53,G54], [G55,G56], [G57,G58], end5,
		[G61,G62], [G63,G64], [G65,G66], [G67,G68], end6,
		[G71,G72], [G73,G74], [G75,G76], [G77,G78], end7
	],


	S = Games.











