---
name: catalogo
description: Cria e gerencia o Catálogo de leads, a fila ranqueada de clientes prospectados que alimenta a produção. Acione quando o usuário rodar /catalogo, disser "montar o catálogo", "abastecer a fila", "prospectar em massa", "quantos leads tem na fila" ou "mostra o catálogo".
---

# Catálogo de leads (a fila de produção)

O Catálogo separa a garimpagem da produção: primeiro se prospecta em volume e se cataloga tudo numa tabela ranqueada; depois a produção só segue a ordem da fila. Arquivo: `catalogo.md` na pasta conectada.

## Formato do catalogo.md

```markdown
# Catálogo de leads: [nicho] em [cidade]
Atualizado em [data]. Qualificados: N | Prontos: N | Enviados: N

| # | Nome | Cidade | Nota | Aval. | WhatsApp | Site atual | Motivo | Status | URL nova | Enviado em |
```

Status possíveis (nesta ordem de vida): `catalogado` > `em-producao` > `pronto` > `enviado ✅` > `respondeu` > `fechou 🏆`. Leads descartados entram no fim da tabela com `descartado` e o motivo, para nunca serem reavaliados.

## Como abastecer (rodadas acumulativas)

1. Pergunte nicho e cidade (ou use os do config). Uma rodada de abastecimento mira 25 a 30 leads QUALIFICADOS (com site próprio melhorável e WhatsApp público), avaliando quantos estabelecimentos forem necessários. Analisar em volume leva tempo; se o usuário pedir 100, explique que o catálogo acumula: é só rodar `/catalogo` de novo que ele soma mais 25 a 30 por rodada, sem nunca duplicar quem já está na tabela.
2. Use a skill `prospectar` como método de busca e qualificação de cada lead.
3. RANQUEIE a fila por potencial: melhor avaliação no Google + pior site + WhatsApp confirmado primeiro. A ordem da tabela É a ordem de produção.
4. Mostre ao usuário o resumo: total na fila, os 10 primeiros da tabela e a pergunta: "Quantos você quer que eu produza agora?"

## Painel (sincronização obrigatória)

O `painel.html` da pasta conectada (criado no /setup a partir de `references/painel-template.html`) é a visão do usuário sobre o catálogo. SEMPRE que o catalogo.md mudar (lead novo, status, URL, envio, fechamento), reescreva o bloco `<script id="dados" type="application/json">...</script>` do painel.html com o JSON atualizado no formato: {"atualizado":"dd/mm/aaaa hh:mm","leads":[{"nome","nicho","cidade","nota","aval","whats","siteAtual","urlNova","status","enviadoEm"}]}. Se o painel.html não existir, crie a partir do template. Login padrão de todos: admin / 12345678 (informar ao usuário quando criar).

## Regras da fila

- Nunca duplicar lead (conferir nome e WhatsApp antes de inserir).
- Nunca reordenar depois que a produção começou, a não ser que o usuário peça.
- Qualquer comando que mudar o estado de um lead (produzir, publicar, enviar) ATUALIZA o catalogo.md na hora. O check ✅ com a data entra quando a mensagem for enviada (pelo `/enviar` ou quando o usuário avisar "enviei").
- Se existir `leads.md` antigo, migre os leads dele para o catálogo na primeira execução.
