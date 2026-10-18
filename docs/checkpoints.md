# Log de Progresso: People Analytics, Turnover & Attrition

## Etapa 1: Dataset e Setup
- **O que fiz:** baixei o dataset IBM HR Analytics Employee Attrition (Kaggle), validei que o arquivo tem 1470 registros e 35 colunas, criei a estrutura de pastas do projeto e guardei o CSV original em `data/raw`.
- **Dificuldades encontradas:** o Excel abriu o CSV com tudo numa coluna só (o separador do arquivo é vírgula). Corrigi importando por Dados > Obter Dados > De Texto/CSV. No PowerShell, o `mkdir` aceita uma pasta por vez, então criei as subpastas em comandos separados.
- **Aprendizado:** o arquivo em `data/raw` nunca é editado; todo trabalho de Excel vai em arquivo separado.
- **Evidência:** `docs/prints/etapa1_repositorio.png`
- **LinkedIn:** post publicado.

## Etapa 2: Versionamento com GitHub
- **Repositório:** https://github.com/emmanuelcambuta5-sys/hr-attrition-analysis
- **Commits até agora:** 13 (último: `docs: atualiza checkpoints com a etapa 4`)
- **Dificuldades encontradas:** um arquivo salvo com extensão errada (`.paint` em vez de `.png`) e um arquivo temporário do Excel (`~$analise_attrition.xlsx`) entraram em commits. Corrigi com um commit de correção e com `git commit --amend`, e adicionei `~$*` ao `.gitignore`.

## Etapa 3: Análise de Negócio no Excel
- **O que fiz:** validei a coluna Attrition (1233 "No" + 237 "Yes" = 1470, sem nulos), montei uma tabela dinâmica por departamento, transformei a aba de dados em Tabela, criei a aba Insights com a tabela de taxas (ligada à tabela dinâmica por fórmula), três KPIs em cartões e um gráfico de barras com a linha da média da empresa.
- **Resultados:**
  - Taxa geral de attrition: **16,12%** (237 saídas em 1470 funcionários).
  - Sales: **20,63%** (92 de 446), a maior taxa e com base grande.
  - Human Resources: **19,05%** (12 de 63), base pequena, então a taxa é menos estável.
  - Research & Development: **13,84%** (133 de 961), a menor taxa, apesar de ter o maior número bruto de saídas.
- **Dificuldades encontradas:** dividi as saídas pelos funcionários que ficaram (1233) e obtive 19,22% em vez de 16,12%; somei as taxas dos departamentos e obtive 53,52%. Aprendi que a taxa sempre divide pelo total e que taxas não se somam.
- **Aprendizado:** número bruto de saídas engana; para comparar departamentos é preciso usar a taxa, que considera o tamanho de cada um.
- **Evidência:** `docs/prints/etapa3_dashboard.png`
- **LinkedIn:** post publicado.

## Etapa 4: Consultas com SQL

- **O que fiz:** criei um banco SQLite (`hr.db`) a partir do CSV com um script em Python e escrevi 7 consultas em `sql/queries.sql`: contagem de registros, funcionários e saídas por departamento, taxa de attrition por departamento e por hora extra, salário médio e satisfação por situação, e taxa por faixa salarial com JOIN na tabela `faixa_salarial`.

- **Resultados (hora extra):** quem faz hora extra tem taxa de saída de 30,53%, contra 10,44% de quem não faz (quase 3 vezes maior).

- **Resultados (salário):** quem saiu ganhava em média 4.787,09 por mês, contra 6.832,74 de quem ficou (cerca de 30% a menos). A satisfação média também foi menor: 2,47 contra 2,78.

- **Resultados (faixa salarial):** a taxa de saída da faixa Baixa (até 3.000) é de 28,61%, contra 10,50% na faixa Alta, cerca de 2,7 vezes maior. A maior queda está entre Baixa e Media (28,61% para 12,10%).

- **Dificuldades encontradas:** até aqui eu só usava SQL para consultar. Ao criar a tabela `faixa_salarial`, o `CREATE TABLE` deu erro "table already exists" e o `INSERT` rodou 8 vezes, duplicando a faixa Baixa. Resolvi esvaziando a tabela e movendo a criação para um arquivo separado (`sql/01_criar_faixa_salarial.sql`), com `DROP TABLE IF EXISTS`, que pode ser rodado várias vezes sem duplicar linhas.

- **Aprendizado:** o JOIN ligou duas tabelas por um intervalo (`BETWEEN`), e não por um id, e assim criou os grupos Baixa, Media e Alta que não existiam em `employees`. O GROUP BY, sozinho, só reúne valores que já existem. Aprendi também que arquivos que modificam o banco (CREATE, INSERT) devem ficar separados das consultas e poder rodar várias vezes sem duplicar dados.

- **Evidência:** `docs/prints/etapa4_sql.png`
- **LinkedIn:** post publicado.