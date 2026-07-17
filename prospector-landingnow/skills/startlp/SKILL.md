---
name: startlp
description: Roda o ciclo do Prospector LandingNow a partir do Catálogo, produzindo os próximos da fila. Acione quando o usuário rodar /startlp, disser "começa o trabalho", "produz os próximos", "faz mais 3", "roda tudo" ou pedir o fluxo completo.
---

# /startlp: produção guiada pelo Catálogo

Produzir landing pages seguindo a ORDEM do Catálogo (`catalogo.md`), sem retrabalho e sem se perder.

## Fluxo

1. **Config**: leia `prospector-landingnow.json` na pasta conectada. Se não existir, rode a skill `setup` primeiro (formulário) e volte para cá.
2. **Catálogo**: leia `catalogo.md`.
   - Se NÃO existir ou estiver sem leads `catalogado`: execute a skill `catalogo` para abastecer a fila (pergunta nicho/cidade, cataloga 25 a 30 qualificados, ranqueia) e siga.
   - Se existir com fila: mostre o resumo (quantos na fila, quantos prontos, quantos enviados) e os próximos 10 da ordem.
3. **Quantidade**: pergunte "Quantos você quer que eu produza agora?" (sugira 3). O usuário escolhe N.
4. **Produção em ordem**: pegue os N primeiros com status `catalogado` e, um por vez: marque `em-producao`, execute `criar-site`, depois `publicar`, depois `proposta`, e marque `pronto` com a URL nova na tabela. Se um lead falhar (ex.: imagens inacessíveis), registre o motivo, marque `descartado` e puxe o próximo da fila para completar N.
5. **Entrega**: resumo com, por cliente: nome, URL no ar, link wa.me e mensagem pronta.
6. **Oferta de envio**: em horário comercial, pergunte "Tenho [N] mensagens prontas: [nomes]. Posso enviar pelo seu WhatsApp? Responda Sim." Com o Sim, execute a skill `enviar` (que marca o ✅ `enviado` no catálogo com a data). Fora do horário, ofereça agendar o lembrete.
7. **Continuação**: quando o usuário pedir "mais" (ex.: "faz mais 5"), volte ao passo 4 e continue DO PONTO onde a fila parou. Quando a fila baixar de 5 leads, avise e ofereça rodar `/catalogo` para reabastecer.

## Regras

- A ordem do catálogo é sagrada: produza sempre os primeiros `catalogado` da tabela.
- Trabalhe sem interromper com perguntas desnecessárias; reporte o progresso em frases curtas.
- Nunca envie mensagem ao cliente final sem o "Sim" explícito do usuário.
- Atualize o catalogo.md a cada mudança de status, na hora.
