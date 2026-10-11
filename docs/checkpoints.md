# Log de Progresso: People Analytics, Turnover & Attrition

## Etapa 1: Dataset e Setup
- **O que fiz:** baixei o dataset IBM HR Analytics Employee Attrition (Kaggle), validei que o arquivo tem 1470 registros e 35 colunas, criei a estrutura de pastas do projeto e guardei o CSV original em `data/raw`.
- **Dificuldades encontradas:** o Excel abriu o CSV com tudo numa coluna só (o separador do arquivo é vírgula). Corrigi importando por Dados > Obter Dados > De Texto/CSV. No PowerShell, o `mkdir` aceita uma pasta por vez, então criei as subpastas em comandos separados.
- **Aprendizado:** o arquivo em `data/raw` nunca é editado; todo trabalho de Excel vai em arquivo separado.
- **Evidência:** print do repositório criado no GitHub.

## Etapa 2: Versionamento com GitHub
- **Repositório:** https://github.com/emmanuelcambuta5-sys/hr-attrition-analysis
- **Commits até agora:** 1 (`chore: estrutura inicial do projeto e dataset`)