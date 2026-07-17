---
name: proposta
description: Gera a mensagem de WhatsApp pronta para oferecer a landing page ao cliente, com preço. Acione quando o usuário rodar /proposta, disser "montar a mensagem", "proposta pro cliente", "mensagem de WhatsApp" ou "oferecer o site".
---

# Proposta por WhatsApp

A proposta vai por WhatsApp, nunca por e-mail. O usuário só copia a mensagem e clica no link da conversa.

## Princípios

- Tom pessoal, caloroso e BEM CURTO, sem travessões.
- Não apontar defeitos do site atual do cliente. A página nova fala por si.
- Preço e pagamento vêm do config (`venda.preco` e `venda.pagamento`).
- Sempre abrir espaço para ajustes: atualizar fotos, mudar ou incluir informações fica por conta do usuário, sem custo citado.

## Estrutura da mensagem

1. Saudação com o nome do cliente + apresentação do config (ex.: "Aqui é o Fulano, da Agência X").
2. "Preparei uma versão nova do site de [negócio] e queria te mostrar:" + a URL publicada.
3. "Se você gostar, a gente pode colocar no ar como site oficial. Fica R$ [preco], [pagamento]. E se quiser ajustar alguma coisa, atualizar as fotos ou incluir uma informação nova, pode deixar comigo também, sem problema."
4. "Qualquer dúvida é só me chamar por aqui. Um abraço!"

## Entrega ao usuário

Salve `clientes/[slug]/mensagem-whatsapp.txt` com: nome do cliente, WhatsApp formatado, link `https://wa.me/55DDDNUMERO` para abrir a conversa, a URL do site novo, o valor, e a mensagem completa para copiar. Mostre tudo no chat também, com o link da conversa em destaque, e atualize o status do lead para `proposta-enviada` quando o usuário disser que mandou.

## Depois do envio

Sugira acompanhar: se o cliente não responder em 3 dias úteis, um único follow-up curto e gentil ("Oi, [nome]! Conseguiu ver a página que preparei?"). Nunca mais que um follow-up por cliente.
