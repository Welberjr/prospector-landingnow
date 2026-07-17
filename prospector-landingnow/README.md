# Prospector LandingNow

Plugin para Claude (Cowork / Claude Code) que roda o ciclo completo de prospecção e venda de landing pages:

**Achou → Criou → Publicou → Ofertou pelo WhatsApp.**

1. `/setup`: configura tudo uma vez (seu nome, WhatsApp, preço, nichos e a conta Cloudflare).
2. `/prospectar`: você escolhe o nicho na hora e ele busca negócios bem avaliados com sites fracos e WhatsApp público.
3. `/criar-site`: cria a página nova no padrão LandingNow: fotos e logo reais do cliente, cards arredondados com neon, favicon, preview de WhatsApp e mobile impecável.
4. `/publicar`: sobe no Cloudflare Pages (HTTPS grátis, URL `nome.pages.dev`) e valida.
5. `/proposta`: entrega a mensagem de WhatsApp pronta, com o preço configurado, e o link da conversa do cliente. É só copiar e enviar.

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
