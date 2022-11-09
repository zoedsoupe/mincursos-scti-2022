# SQL com SQLite

Como visto no documento inicial sobre [Banco de Dados](../database.md), existem varios SGBDs e o que vamos utilizar é o `SQLite`.

## Desafio

Vamos modelar um banco de dados que armazena informações sobre filmes, personagens e notas de
sobre cada filme!

Nessa nossa aplicação a entidade principal será
`filmes`, que terão um `título` e o `ano de lançamento`.

Também precismaos guardar informações
de `atores` e `atrizes` e `diretores`, que terão `em qual filme participaram`, seu `nome` e a `data de nascimento`. Lembrando que um filme pode
ter vários atores e diretores.

Já na parte de notas, cada filme pode receber notas, que consistem em valor de 1 a 5 e um número
de votos!

### Atividades

- Criar MER (modelo entidade relacionamento)
- Implementar modelagem física

### Consultas

Será necessário implementar as seguintes consultas:

1. Recupre o título e ano de um filme, fazendo uma pesquisa por semelhança de texto e ordene pelo ano de lançamento
2. Recupere o nome de diretores que dirigiram filmes com notas maiores que 4.5
3. Calcule a nota médiade todos os filmes lançados em um determinado ano
4. Recupere todas as pessoas envolvidas em filmes de um determinado ano, onde não seja repitido nomes

### Link para quadro (DER)

> senha "vj56dm"

https://whimsical.com/der-552PtzKZxnX9svdwZ6r5XQ@2Ux7TurymMytEvTBQAby
