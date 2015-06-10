colorir(g(Vertices,Arestas),Cores,Coloracao):-
   gerar(Vertices,Cores,Coloracao),
   testar(Arestas,Coloracao).

gerar([],_,[]).
gerar([V|Vertices],Cores,[V-C|T]):-
   cor(C),
   gerar(Vertices,Cores,T).

testar([],_).
testar([e(V1,V2)|Arestas],Coloracao):-
   member(V1-C1,Coloracao),
   member(V2-C2,Coloracao),
   C1\=C2,
   testar(Arestas,Coloracao).

cor(azul).
cor(verde).

tentativa(Cores, Coloracao):-
    colorir(g(
		  [1,2,3,4,5,6],
          [e(1,2), e(2,3), e(3,4), e(4,5), e(5,6), e(6,1)]),
         Cores,
         Coloracao).


/*
colorir(g(
          [1,2,3],
          [e(1,2), e(1,3), e(2,3)]),
        Cores,
        Coloracao).

colorir(g(
		  [1,2,3,4,5],
          [e(1,2), e(2,3), e(3,4), e(4,5), e(5,1)]),
         Cores,
         Coloracao).

colorir(g(
		  [1,2,3,4,5,6],
          [e(1,2), e(2,3), e(3,4), e(4,5), e(5,6), e(6,1)]),
         Cores,
         Coloracao).
*/
