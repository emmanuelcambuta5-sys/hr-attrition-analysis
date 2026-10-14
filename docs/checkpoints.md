# Log de Progresso: People Analytics, Turnover & Attrition

## Etapa 1: Dataset e Setup
- **O que fiz:** baixei o dataset IBM HR Analytics Employee Attrition (Kaggle), validei que o arquivo tem 1470 registros e 35 colunas, criei a estrutura de pastas do projeto e guardei o CSV original em `data/raw`.
- **Dificuldades encontradas:** o Excel abriu o CSV com tudo numa coluna só (o separador do arquivo é vírgula). Corrigi importando por Dados > Obter Dados > De Texto/CSV. No PowerShell, o `mkdir` aceita uma pasta por vez, então criei as subpastas em comandos separados.
- **Aprendizado:** o arquivo em `data/raw` nunca é editado; todo trabalho de Excel vai em arquivo separado.
- **Evidência:** `docs/prints/etapa1_repositorio.png`
- **LinkedIn:** post publicado.

## Etapa 2: Versionamento com GitHub
- **Repositório:** https://github.com/emmanuelcambuta5-sys/hr-attrition-analysis
- **Commits até agora:** 6 (último: `feat: dashboard excel com kpis e grafico de attrition`)
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
- **LinkedIn:** post da Etapa 3 pendente.