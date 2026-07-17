---
name: startlp
description: Roda o ciclo completo do Prospector LandingNow de ponta a ponta, sem parar entre as etapas. Acione quando o usuário rodar /startlp, disser "começa o trabalho", "roda tudo", "inicia a prospecção completa" ou pedir o fluxo inteiro de uma vez.
---

# /startlp: o ciclo completo em um comando

Executar a esteira inteira, do primeiro cliente à mensagem pronta, parando só quando precisar de uma decisão do usuário.

## Fluxo

1. **Config**: leia `prospector-landingnow.json` na pasta conectada. Se não existir, rode a skill `setup` primeiro (formulário) e volte para cá em seguida.
2. **Nicho**: pergunte em qual nicho e cidade atacar (formulário ou texto numerado com os nichos do config). Pergunte também quantos clientes preparar nesta rodada (sugira 3).
3. **Prospecção**: execute a skill `prospectar` até reunir a quantidade pedida de leads qualificados (com site próprio melhorável e WhatsApp público). Mostre a tabela rapidamente e siga sem esperar aprovação, a não ser que nenhum lead preste.
4. **Para cada lead, em sequência**:
   - Execute a skill `criar-site` (página completa no padrão, favicon, preview).
   - Execute a skill `publicar` (Cloudflare, com a checagem de conta e validação).
   - Execute a skill `proposta` (mensagem de WhatsApp salva e exibida).
5. **Entrega final**: apresente um resumo único com, por cliente: nome, URL nova no ar, link `wa.me` da conversa e a mensagem pronta. Atualize `leads.md` com tudo.

## Regras

- Trabalhe sem interromper o usuário com perguntas desnecessárias no meio do fluxo; reporte o progresso em frases curtas.
- Se uma etapa falhar num lead (ex.: imagens inacessíveis), registre o motivo, pule para o próximo lead e informe no resumo final.
- Nunca envie a mensagem ao cliente final: quem envia é o usuário. A entrega é a mensagem pronta + o link da conversa.
