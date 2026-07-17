# Prospector LandingNow

Plugin para Claude (Cowork / Claude Code) que roda o ciclo completo de prospecção e venda de landing pages:

**Achou → Criou → Publicou → Ofertou pelo WhatsApp.**

1. `/setup`: um formulário rápido no chat (nome, WhatsApp, preço, nichos, conta Cloudflare). Preencheu, salvou, nunca mais mexe.
2. `/catalogo`: monta a sua fila de clientes. Prospecta em volume, cataloga tudo numa tabela ranqueada (melhor avaliação + pior site primeiro) e vai acumulando a cada rodada. Você enxerga a fila inteira antes de produzir.
3. `/startlp`: a produção. Ele pergunta quantos você quer (3, 5, quantos escolher), produz os primeiros da fila na ordem, publica e te entrega as mensagens prontas. Enviou, ganha o check na tabela. Pediu "mais", ele continua do ponto exato onde parou.

Ou, se preferir por etapas:

4. `/prospectar`: você escolhe o nicho na hora e ele busca negócios bem avaliados com sites fracos e WhatsApp público.
5. `/criar-site`: cria a página nova no padrão LandingNow: fotos e logo reais do cliente, cards arredondados com neon, favicon, preview de WhatsApp e mobile impecável.
6. `/publicar`: sobe no Cloudflare Pages (HTTPS grátis, URL `nome.pages.dev`) e valida.
7. `/proposta`: entrega a mensagem de WhatsApp pronta, com o preço configurado, e o link da conversa do cliente.
8. `/enviar`: o Claude envia as mensagens pelo SEU WhatsApp Web, uma a uma. Antes de sair qualquer coisa, ele mostra a lista e pergunta "Posso enviar? Responda Sim". Você digita Sim e ele dispara, na quantidade que você escolheu.

## O seu Painel (criado sozinho no /setup)

Na instalação, o plugin cria o `painel.html` na sua pasta: o seu painel de controle, sem servidor e sem banco de dados. Dê dois cliques, entre com **admin / 12345678** e acompanhe tudo: quantos clientes catalogados, em produção, prontos, enviados e fechados, com filtros por nicho, cidade e status, busca por nome (pra nunca repetir cliente) e os links de cada site novo. O Claude atualiza o painel automaticamente a cada etapa do trabalho.

## Como funciona o envio (leia antes de usar o /enviar)

- Nada sai sem você digitar **Sim**. O Claude sempre mostra quais clientes vão receber e espera a sua confirmação. Você fica no controle do que sai no seu nome.
- O envio usa o seu WhatsApp Web no Chrome (deixe logado, com a extensão Claude in Chrome conectada). Ele abre a conversa, confere a mensagem e clica em enviar, um cliente por vez, com intervalo.
- Limite de segurança: no máximo 5 envios por rodada e poucos por dia. Isso protege o seu número, porque o WhatsApp bloqueia disparo em massa. Não tente burlar esse limite.
- E-mail é reforço: para leads com e-mail público, o Claude deixa RASCUNHOS prontos no seu Gmail (nunca envia sozinho) e agenda um lembrete para 2 dias depois, avisando você de enviar os rascunhos de quem não respondeu no WhatsApp.

## Como instalar

No Claude Code:

```
/plugin marketplace add Welberjr/prospector-landingnow
/plugin install prospector-landingnow@welberjr-plugins
```

No Claude Cowork (desktop): Configurações → Plugins → Adicionar marketplace → cole a URL deste repositório → instale o **prospector-landingnow**.

## Requisitos

- Claude Cowork (ou Claude Code) com uma pasta conectada
- Node.js + Wrangler (`npm i -g wrangler`) e uma conta Cloudflare gratuita (`wrangler login`)
- WhatsApp para enviar as propostas

## Segurança

Nenhuma senha passa pelo chat. O login do Cloudflare é feito por você, no seu navegador, via `wrangler login`. Antes de cada publicação o plugin confere se a conta ativa é a sua.

---

Criado por Welber Junior · [LandingNow](https://landingnow.com.br)
