---
name: proposta
description: Gera a mensagem de WhatsApp pronta para oferecer a landing page ao cliente, com preço. Acione quando o usuário rodar /proposta, disser "montar a mensagem", "proposta pro cliente", "mensagem de WhatsApp" ou "oferecer o site".
---

# Proposta por WhatsApp

A proposta vai por WhatsApp, nunca por e-mail. O usuário só copia a mensagem e clica no link da conversa.

## Princípios

- Tom pessoal, caloroso e BEM CURTO, sem travessões.
- Dizer de onde encontrou o cliente (transparência gera confiança).
- A melhoria é citada em UMA frase leve, como oportunidade, nunca como crítica ao profissional.
- Preço e pagamento vêm do config (`venda.preco` e `venda.pagamento`).
- Diferencial sempre presente: o trabalho vem pronto, e se o cliente não gostar, sai do ar sem compromisso.

## Estrutura da mensagem (5 partes)

1. Saudação com o nome do cliente + apresentação do config (ex.: "Aqui é o Fulano, da Agência X (site da agência)").
2. Onde achou: "Encontrei [negócio] no Google, pesquisando [nicho] em [região], e vi que [melhoria em uma frase leve, ex.: a página pode render mais no celular]."
3. Diferencial + link: "Eu crio sites profissionais e trabalho diferente: em vez de prometer, eu faço primeiro e mostro pronto. A nova versão da página de vocês já está no ar:" + a URL publicada.
4. Preço e garantia: "Se gostar, fica R$ [preco], [pagamento], com ajustes de fotos e textos por minha conta. Se não gostar, eu tiro do ar e está tudo certo, sem compromisso."
5. "Um abraço!"

## Entrega ao usuário

Salve `clientes/[slug]/mensagem-whatsapp.txt` com: nome do cliente, WhatsApp formatado, link `https://wa.me/55DDDNUMERO` para abrir a conversa, a URL do site novo, o valor, e a mensagem completa para copiar. Mostre tudo no chat também, com o link da conversa em destaque, e atualize o status do lead para `proposta-enviada` quando o usuário disser que mandou.

## Depois do envio

Sugira acompanhar: se o cliente não responder em 3 dias úteis, um único follow-up curto e gentil ("Oi, [nome]! Conseguiu ver a página que preparei?"). Nunca mais que um follow-up por cliente.
