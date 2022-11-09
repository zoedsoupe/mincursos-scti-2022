# SQL com SQLite

Como visto no documento inicial sobre [Banco de Dados](../database.md), existem varios SGBDs e o que vamos utilizar é o `SQLite`.

## Comandos

### Create

O `CREATE` é u mdos principais comandos dentro do `SQL` pois permite a criação de novos bancos ou tabelas!

```sql dark
CREATE DATABASE nome_banco;
```

```sql dark
CREATE TABLE nome_tabela;
```

### Select

Já o `SELECT` permite recuperar informações de uma ou mais tabelas

```sql dark
SELECT campos FROM nome_tabela;
```

#### Ordenação

É possível ordenar o resultados das colunas levando em conta algum outro campo da tabela. Caso
esse campo seja um texto, logo a ordenação será alfabética, caso seja um numero será em forma crescente e assim por diante.

```sql dark
SELECT campo FROM tabela ORDER BY outro campo;
```

### Duplicidade

Para evitar dados duplicados em resultados de consultas, pode-se usar o comando `DISTINCT`

```sql dark
SELECT DISTINCT campo FROM tabela;
```

### Junções

Existem quatro formas de junções:

1. `INNER JOIN`
2. `LEFT JOIN`
3. `RIGHT JOIN`
4. `FULL JOIN`

```sql dark
-- Retorna apenas os valores que satisfazem a regra em ambas as tabelas
SELECT campo FROM tabela INNER JOIN tabela ON campo;

-- Retorna todos os registros da tabela à esquerda e os campos que satisfazem a regra da tabela na direita
SELECT campo FROM tabela INNER JOIN tabela ON campo;

-- Retorna todos os registros da tabela à direita e os campos que satisfazem a regra da tabela na esquerda
SELECT campo FROM tabela INNER JOIN tabela ON campo;

-- Retorna todos os registros de ambas a tabelas quando algum valor satisfaz a regra
SELECT campo FROM tabela INNER JOIN tabela ON campo;
```

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
