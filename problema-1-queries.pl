% função criada para verificar a ordem de referência
classificacao_referencia :-
    chegou(A, B),
    chegou(B, C),
    chegou(C, D),
    chegou(D, E),
    chegou(E, F),
    chegou(F, G),
    chegou(G, H),
    chegou(H, I),
    chegou(I, J),
    format('Posição 1: ~s~n', [A]),
    format('Posição 2: ~s~n', [B]),
    format('Posição 3: ~s~n', [C]),
    format('Posição 4: ~s~n', [D]),
    format('Posição 5: ~s~n', [E]),
    format('Posição 6: ~s~n', [F]),
    format('Posição 7: ~s~n', [G]),
    format('Posição 8: ~s~n', [H]),
    format('Posição 9: ~s~n', [I]),
    format('Posição 10: ~s~n', [J]).

% obtém todos os competidores sem repetição
obterTodosCompetidores(Competidores) :-
    setof(X, Y^chegou(X, Y), Lista1),
    setof(W, Z^chegou(Z, W), Lista2),
    union(Lista1, Lista2, Competidores).

% remove os itens de uma lista, utilizando como parâmetro
% outra lista, o retorno é uma nova lista
tratarLista([], _, []).
tratarLista([X|Calda], L2, Resultado):- member(X, L2), !, tratarLista(Calda, L2, Resultado). 
tratarLista([X|Calda], L2, [X|Resultado]):- tratarLista(Calda, L2, Resultado).

% função conclusiva, quando lista tratada for vazia
% ou seja, ninguém chegou na frente, resultado é impresso
colocacao([X | Calda], Classificacao, [], Posicao) :-
    format('Posição ~d: ~s~n', [Posicao, X]),
    NovaPosicao is Posicao + 1,    
    colocacao(Calda, [X | Classificacao], NovaPosicao).

% função não conclusiva é executada, lista tratada 
% contém os competidores que chegaram antes, 
% é tratada a duplicidade dos itens e depois
% são incluídos no início da fila
colocacao([X | Calda], Classificacao, ListaTratada, Posicao) :-
    tratarLista(Calda, ListaTratada, CaldaTratada),
    append(ListaTratada, [X | CaldaTratada], Competidores),    
    colocacao(Competidores, Classificacao, Posicao).

% encerra a função recursiva, pois acabaram os 
% competidores a serem analisados
colocacao([], _, _).
% função recursiva que calcula as colocações dos competidores
colocacao([X | Calda], Classificacao, Posicao) :-
    % se setof retornar false, então ChegaramAntes 
    % é inicializada com uma lista vazia
    (setof(Z, Z^chegou(Z, X), ChegaramAntes);ChegaramAntes = []),
    % remove da lista todos que já estão classificados
    tratarLista(ChegaramAntes, Classificacao, ListaTratada),    
    colocacao([X | Calda], Classificacao, ListaTratada, Posicao).

classificacao :-
    obterTodosCompetidores(Competidores),
    % o valor 2 refere-se a opção de colocação indefinida
    colocacao(Competidores, [], 1).