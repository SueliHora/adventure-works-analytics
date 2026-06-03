# Adventure Works Analytics - Modern Analytics Stack

## Projeto
Implementação de um Data Warehouse moderno para a Adventure Works utilizando a **Modern Analytics Stack** (dbt + Databricks).

**Programa:** Indicium Academy
**Desafio:** Projeto Final de Certificação em Engenharia de Analytics

---

## Arquitetura

### Camadas de Dados
* **Bronze:** Dados brutos do PostgreSQL (Adventure Works)
* **Silver:** Dados limpos, validados e padronizados
* **Gold:** Tabelas dimensionais e fatos prontas para BI

### Star Schema
* **Tabela Fato:** `fct_sales`
* **Dimensões:** 8 tabelas (Cliente, Produto, Vendedor, Tipo Cartão, Motivo Venda, Tempo, Status, Localidade)

---

## Stack Tecnológico
* **Data Warehouse:** Databricks (Community Edition)
* **Transformação:** dbt Cloud (Free)
* **Versionamento:** GitHub
* **BI:** Google Looker Studio

---

## Validação Crítica
* ✅ **Teste do CEO:** Total de vendas brutas em 2011 = $12.646.112,16

---

## 👤 Autor
* **Sueli da Hora Moreira**

---

## 📄 Licença
MIT License
