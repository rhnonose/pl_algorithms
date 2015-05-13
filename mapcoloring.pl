/* $Id: mapcoloring.pl,v 321.4 2002-02-25 17:37:10-08 - - $ */

/*
* Map coloring.
*
* Given an adjacency matrix, find a coloring of the map such
* that no two adjacent nodes have the same color.  The four
* color theorem says this is always possible with four colors.
*/

/*
* Specification of the nodes in the graph and the paths.
*/

graph( [1,2,3,4,5] ).
graph([a,b,c,d,e,f]).

path( 1, 2 ).
path( 1, 3 ).
path( 1, 4 ).
path( 2, 3 ).
path( 2, 4 ).
path( 3, 4 ).
path( 4, 5 ).
path(a,b).
path(a,c).
path(a,d).
path(a,e).
path(b,c).
path(b,d).
path(b,e).
path(c,d).
path(c,e).
path(d,e).
path(e,f).

/*
* Undirected graph, ajacency is bidirectional.
*/

adjacent( Node1, Node2 ) :- path( Node1, Node2 ).
adjacent( Node1, Node2 ) :- path( Node2, Node1 ).

/*
* Specifications of possible colors for the nodes.
*/

color( red ).
color( green ).
color( blue ).
color( white ).
coloe( yellow ).

/*
* Find a coloring with no conflicts.
*/

findcoloring( [], [] ).
findcoloring( [Node | Nodes], [Coloring | Colorings] ) :-
	findcoloring( Nodes, Colorings ),
	Coloring = color( Node, Color ),
	color( Color ),
	noconflict( Coloring, Colorings ).

noconflict( _, [] ).
noconflict( Coloring1, [Coloring2 | Colorings] ) :-
	not( conflict( Coloring1, Coloring2 )),
	noconflict( Coloring1, Colorings ).

conflict( color( Node1, Color ), color( Node2, Color )) :-
	adjacent( Node1, Node2 ).

/*
* Trace the relevant relations.
*/

traceon :-
	trace( adjacent ),
	trace( color ),
	trace( findcoloring ),
	trace( noconflict ),
	trace( conflict ).

writeallcolorings :-
	writeanycoloring,
	fail.

writeanycoloring :-
	findanycoloring( Graph, Coloring ),
	write( Coloring ), nl.

findanycoloring( Graph, Coloring ) :-
	graph( Graph ),
	findcoloring( Graph, Coloring ).

