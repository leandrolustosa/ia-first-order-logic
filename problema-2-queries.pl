% encerra a função recursiva e o grande pulo do gato
% a rota termina em [Destino | DemaisRota]
% Destino é um parâmetro fixo é sempre igual
% o terceiro parâmetro é igual ao primeiro, então sucesso
% e os quarto e quinto parâmetros são igualados como DistanciaTotal
% fazendo com que DistanciaTotal assuma o valor da até então DistanciaAtual
circuito([Destino | DemaisRota], Destino, [Destino | DemaisRota], DistanciaTotal, DistanciaTotal).
circuito([PontoAtual | DemaisRota], Destino, Rota, DistanciaAtual, DistanciaTotal) :-
    % tanto faz se o caminho é a para b, ou b para a
    (pway(PontoAtual, ProximoPonto, Distancia) ; pway(ProximoPonto, PontoAtual, Distancia)),
    % o ProximoPonto não faz parte da Rota realizada até o momento        
    \+member(ProximoPonto, [PontoAtual | DemaisRota]),    
    NovaDistancia is DistanciaAtual + Distancia,    
    % ProximoPonto passa a ser parte da RotaAtual e a
    % distância percorrida é atualizada    
    circuito([ProximoPonto, PontoAtual | DemaisRota], Destino, Rota, NovaDistancia, DistanciaTotal).

solve(Origem, Destino, Rota, DistanciaTotal) :-
    % Inicia o circuito com a Origem
    circuito([Origem], Destino, RotaAuxiliar, 0, DistanciaTotal),
    % a Rota final está de traz para frente é preciso invertê-la
    reverse(RotaAuxiliar, Rota).
