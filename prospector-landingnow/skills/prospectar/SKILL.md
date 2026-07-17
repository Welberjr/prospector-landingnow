---
name: prospectar
description: Prospecta clientes com sites fracos para vender landing pages. Acione quando o usuário rodar /prospectar, disser "buscar clientes", "achar leads", "prospectar clientes" ou "encontrar negócios com site ruim".
---

# Prospecção de clientes

Encontrar o cliente ouro: negócio que já é bem avaliado e fatura, mas tem um site fraco que espanta clientes. A oferta é sempre "uma versão muito melhor do site que você já tem".

## Antes de começar

1. Leia `prospector-landingnow.json` na pasta conectada. Se não existir, rode o `/setup` primeiro.
2. **PERGUNTE O NICHO em texto numerado**: liste os nichos do config e deixe o usuário escolher ou digitar outro na hora (nicho e cidade nunca ficam travados). Exemplo: "Qual nicho vamos atacar? 1. Nutricionistas 2. Psicólogos 3. Advogados 4. Dentistas, ou me diz outro". Confirme a cidade também.
3. Leia `leads.md` na pasta conectada (se existir) para não repetir cliente já avaliado.

## Como buscar

Use a busca na web (WebSearch/web_fetch) e, quando disponível, o Claude in Chrome no Google Maps. Atenção: o Google Maps costuma travar a automação (a página nunca termina de carregar); se travar duas vezes, vá sem drama pela busca comum: `[nicho] em [cidade] site oficial`.

Para cada negócio encontrado, abra o site e avalie:

- **Filtro 1, potencial**: negócio ativo, com avaliações boas no Google quando visível.
- **Filtro 2, tem site próprio**: sem site, site fora do ar ou só diretório de terceiros (Doctoralia e afins) descarta. O conteúdo e as fotos da página nova vêm do site atual.
- **Filtro 3, site melhorável**: qualifica se tiver 2 ou mais destes problemas: sem HTTPS (sem cadeado); layout datado; não responsivo; sem CTA de WhatsApp na primeira dobra; conteúdo desorganizado; sem prova social. Anote o motivo objetivo.

## Coleta por lead (obrigatório)

Nome, cidade, site atual, motivo objetivo, e **WhatsApp no formato 55 + DDD + número** (procure `wa.me/`, `api.whatsapp.com` ou telefone celular no site). A proposta vai por WhatsApp: lead sem WhatsApp público não fecha o ciclo, registre e descarte. E-mail e Instagram são extras bem-vindos.

## Saída

Mantenha `leads.md` na pasta conectada:

```markdown
| # | Nome | Cidade | WhatsApp | Site atual | Motivo | Status | URL nova |
```

Status: `novo` > `site-criado` > `publicado` > `proposta-enviada`. Nunca sobrescreva leads antigos, só acrescente e atualize. Mostre a tabela ao usuário e sugira o próximo passo: `/criar-site` para os melhores leads.
