colorir(g(Vertices,Arestas),Cores,Coloracao):-
   gerar(Vertices,Cores,Coloracao),
   testar(Arestas,Coloracao).

gerar([],_,[]).
gerar([V|Vertices],Cores,[V-C|T]):-
   member(C,Cores),
   gerar(Vertices,Cores,T).

testar([],_).
testar([e(V1,V2)|Arestas],Coloracao):-
   member(V1-C1,Coloracao),
   member(V2-C2,Coloracao),
   C1\=C2,
   testar(Arestas,Coloracao).


test(1).
test(2).
test(g(A,B)) :-
    test(A),
    test(B).

/*
colorir(g(
          [1,2,3],
          [e(1,2), e(1,3), e(2,3)]),
        [r,g,b],
        C)

colorir(g(
		  [1,2,3,4,5],
          [e(1,2), e(2,3), e(3,4), e(4,5), e(5,1)]),
         [azul,verde],
         C)

colorir(g(
		  [1,2,3,4,5,6],
          [e(1,2), e(2,3), e(3,4), e(4,5), e(5,6), e(6,1)]),
         [azul,verde],
         C)
*/