# Prospector LandingNow

Plugin para Claude (Cowork / Claude Code) que roda o ciclo completo de prospecção e venda de landing pages:

**Achou → Criou → Publicou → Ofertou pelo WhatsApp.**

1. `/setup`: um formulário rápido no chat (nome, WhatsApp, preço, nichos, conta Cloudflare). Preencheu, salvou, nunca mais mexe.
2. `/startlp`: o comando mágico. Roda tudo sozinho: prospecta no nicho que você escolher, cria as páginas, publica e te entrega as mensagens prontas.

Ou, se preferir por etapas:

3. `/prospectar`: você escolhe o nicho na hora e ele busca negócios bem avaliados com sites fracos e WhatsApp público.
4. `/criar-site`: cria a página nova no padrão LandingNow: fotos e logo reais do cliente, cards arredondados com neon, favicon, preview de WhatsApp e mobile impecável.
5. `/publicar`: sobe no Cloudflare Pages (HTTPS grátis, URL `nome.pages.dev`) e valida.
6. `/proposta`: entrega a mensagem de WhatsApp pronta, com o preço configurado, e o link da conversa do cliente.
7. `/enviar`: o Claude envia as mensagens pelo SEU WhatsApp Web, uma a uma. Antes de sair qualquer coisa, ele mostra a lista e pergunta "Posso enviar? Responda Sim". Você digita Sim e ele dispara, na quantidade que você escolheu.

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
