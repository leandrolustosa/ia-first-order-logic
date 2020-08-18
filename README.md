# First-Order Logic
Trabalho de programação de agentes baseados em First-Order Logic, para o curso de mestrado do IFES campus Serra turma 2 de 2020.

# Ambiente

- Todo o trabalho foi feito em sistema operacional windows, mas com tecnologias independentes de SO
- IDE: Visual Studio Code 1.47.3
  - Extensões
    VSC-Prolog    
- SWI-Prolog 8.2.1

# Organização

## Código fonte em Prolog

### Estrutura de arquivos

- problema-1-kb.pl - Inicialização da base de conhecimento para o problema 1, de acordo com as anotações de ordem de chegada dos competidores, observadas pela plateia.
- problema-1-queries.pl - Predicados definidos por regras, para resolver o problema da ordem que os competidores chegaram ao final da corrida.
- problema-2-kb.pl - Inicialização da base de conhecimento para o problema 2, de acordo com as rotas definidas para o problema, mas foram adicionadas três novas rotas e dois novos destinos "e" e "f", com o intuito de aumentar o número possível de rotas.
- problema-2-queries.pl - Predicados definidos por regras, para resolver o problema de selecionar possíveis rotas entre dois pontos definidos e a distância total percorrida.

### Como executar
- Pré-requisitos
  - Instalar no mínimo as versões dos aplicativos listados em ambiente.
  - Adicionar swipl.exe ao PATH
  
- Problema 1
```
$ swipl.exe
1 ?- ['problema-1-kb.pl'].
2 ?- ['problema-1-queries.pl'].
3 ?- classificacao.
```

- Problema 2
```
$ swipl.exe
1 ?- ['problema-2-kb.pl'].
2 ?- ['problema-2-queries.pl'].
3 ?- solve(a, f, Rota, Distancia).
```
