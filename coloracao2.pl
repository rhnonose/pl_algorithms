colorir(g(Vertices,Arestas),Coloracao):-
   gerar(Vertices,Coloracao),
   testar(Arestas,Coloracao).

gerar([],[]).
gerar([V|Vertices],[V-C|T]):-
   gera(C), /*Gerar lista de cores*/
   gerar(Vertices,T).

testar([],_).
testar([e(V1,V2)|Arestas],Coloracao):-
   member(V1-C1,Coloracao),
   member(V2-C2,Coloracao),
   C1\=C2,
   testar(Arestas,Coloracao).

gera(C):-
    member(C,[a,b]).

/*
colorir(g(
          [1,2,3],
          [e(1,2), e(1,3), e(2,3)]),
        C)

colorir(g(listing(cores).
		  [1,2,3,4,5],
          [e(1,2), e(2,3), e(3,4), e(4,5), e(5,1)]),
         C)

colorir(g(
		  [1,2,3,4,5,6],
          [e(1,2), e(2,3), e(3,4), e(4,5), e(5,6), e(6,1)]),
         C)
*/
