---
name: enviar
description: Envia as propostas prontas pelo WhatsApp Web do usuário, mediante confirmação. Acione quando o usuário rodar /enviar, disser "envia as mensagens", "dispara as propostas", "manda pros clientes", ou responder "Sim" a uma pergunta de envio feita ao fim do /startlp ou do /proposta.
---

# Envio assistido pelo WhatsApp (e reforço por e-mail)

Enviar as mensagens prontas pelo WhatsApp Web do PRÓPRIO usuário, sempre com confirmação explícita antes.

## Regra de ouro (nunca pular)

NUNCA envie nada sem antes mostrar a lista do que vai sair e receber um "Sim" do usuário NESTA conversa. O formato é sempre: "Tenho [N] mensagens prontas: [nomes dos clientes]. Posso enviar pelo seu WhatsApp? Responda Sim." Só o "Sim" (ou equivalente claro) libera o envio daquela lista específica. Cada rodada nova exige um novo Sim.

## Pré-requisitos

- Extensão Claude in Chrome conectada.
- WhatsApp Web logado no Chrome do usuário (web.whatsapp.com). Se não estiver, peça para ele abrir e escanear o QR uma única vez e avisar quando estiver pronto.

## Fluxo de envio (após o Sim)

1. Reúna as mensagens pendentes (status `publicado` no `leads.md`, com `mensagem-whatsapp.txt` na pasta do cliente).
2. Para cada cliente, um por vez:
   - Abra numa aba do grupo MCP: `https://web.whatsapp.com/send?phone=55DDDNUMERO&text=[mensagem codificada em URL]`.
   - Aguarde a conversa carregar e CONFIRA na tela que o campo de texto está preenchido com a mensagem certa e que o contato é o certo.
   - Clique no botão de enviar.
   - Aguarde 30 a 60 segundos antes do próximo (padrão humano).
   - Atualize o lead no `catalogo.md` para `enviado ✅` com a data (ou `proposta-enviada` no leads.md do fluxo antigo).
3. Ao final, mostre o resumo: enviadas, falhas e o motivo de cada falha.

## Proteção da conta (limites fixos)

- No máximo 5 envios por rodada e poucos por dia. Mensagem fria em volume derruba número no WhatsApp.
- Sempre 1 a 1, com intervalo. Nunca disparo em massa, nunca lista de transmissão.
- Se o WhatsApp Web mostrar qualquer aviso de bloqueio ou verificação, PARE imediatamente e avise o usuário.
- HORÁRIO COMERCIAL apenas: verifique a hora local antes de oferecer o envio. Fora de segunda a sexta entre 9h e 18h (ou sábado de manhã), não ofereça enviar agora; ofereça agendar um lembrete (tarefa agendada do Cowork) para a próxima janela comercial, quando você pergunta de novo e, com o Sim, envia.

## Reforço por e-mail (opcional)

Para leads que tenham e-mail público:

1. Com o conector do Gmail conectado, crie um RASCUNHO (nunca envie direto) com a mesma proposta adaptada, curto, 1 link só.
2. Ofereça criar um lembrete agendado para 2 dias depois (ferramenta de tarefas agendadas do Cowork): a tarefa deve verificar se o cliente respondeu no WhatsApp (perguntando ao usuário) e lembrar o usuário de abrir o Gmail e enviar os rascunhos pendentes.
3. Se o conector do Gmail não estiver conectado, apenas salve o texto do e-mail em `clientes/[slug]/email-reforco.txt` e inclua no lembrete.
