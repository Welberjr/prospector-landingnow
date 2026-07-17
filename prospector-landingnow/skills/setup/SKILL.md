---
name: setup
description: Configura o Prospector LandingNow (roda uma vez). Acione quando o usuário rodar /setup, disser "configurar o prospector", "começar a usar o plugin" ou quando qualquer outro comando do plugin não encontrar o arquivo prospector-landingnow.json na pasta conectada.
---

# Setup do Prospector LandingNow

Configurar o ambiente uma única vez. Tudo fica salvo em `prospector-landingnow.json` na pasta conectada do usuário.

## Passos

1. **Pasta conectada**: verifique se há uma pasta do usuário conectada. Se não houver, peça para conectar uma (ex.: "Clientes"). Todos os sites e configurações ficam nela.
2. **Config existente**: se `prospector-landingnow.json` já existir, mostre um resumo e pergunte o que atualizar.
3. **Coletar dados com FORMULÁRIO INTERATIVO**: apresente um formulário no chat (AskUserQuestion ou o widget de formulário/elicitação, o que o ambiente oferecer) com estes campos, para o usuário preencher e confirmar de uma vez. Se o ambiente não suportar formulário, caia para perguntas em texto numerado num bloco só. Campos:
   - Nome completo e como quer se apresentar (ex.: "Welber, da LandingNow").
   - WhatsApp de contato do usuário.
   - Preço padrão da landing page e forma de pagamento (ex.: R$ 497 à vista no Pix).
   - Nichos padrão de prospecção (sugerir: nutricionistas, psicólogos, advogados, dentistas).
   - Cidade/região padrão.
   Assim que o usuário confirmar, salve imediatamente no `prospector-landingnow.json` e mostre um resumo do que ficou gravado.
4. **Wrangler/Cloudflare**: rode `wrangler --version` no PowerShell (Windows) ou terminal (Mac).
   - Se não existir: instrua `npm i -g wrangler` (precisa de Node.js).
   - Depois `wrangler login`: o USUÁRIO faz o login no navegador com a conta Cloudflare dele. Nunca peça senha no chat.
   - Confirme a conta ativa com `wrangler whoami` e registre o e-mail da conta no config (campo `cloudflare.conta`) para conferência futura.
5. **Salvar** o config neste formato:

```json
{
  "assinatura": { "nome": "", "apresentacao": "", "whatsapp": "" },
  "venda": { "preco": "497", "pagamento": "à vista no Pix" },
  "prospeccao": { "nichos": ["nutricionistas", "psicologos", "advogados", "dentistas"], "cidade": "" },
  "cloudflare": { "conta": "" }
}
```

6. **PAINEL (criar automaticamente, logo após as respostas, sem perguntar nada)**: assim que o usuário confirmar o formulário, copie `skills/catalogo/references/painel-template.html` do plugin para a PASTA CONECTADA (a mesma que ele escolheu para os clientes) como `painel.html`. É o painel de controle local: arquivo único, sem servidor e sem banco, dados embutidos, funciona até sem internet. Visual e login são padrão para todos.
7. **ENTREGAR O ACESSO (obrigatório, neste formato)**: descubra o caminho REAL e completo da pasta conectada e monte o link clicável no formato `file:///` (barras normais `/` no lugar das invertidas e espaços como `%20`; ex.: `file:///C:/Users/Maria/Desktop/Clientes/painel.html`). A mensagem final do setup DEVE conter o bloco de acesso pronto, assim:

   Seu painel está pronto! Clique no link (ou copie e cole no navegador):

   Link: file:///C:/caminho/real/da/pasta/painel.html
   Usuário: admin
   Senha: 12345678

   (Se preferir, dá no mesmo: dois cliques no arquivo painel.html dentro da sua pasta.)

   Ele vai se atualizar sozinho a cada etapa do trabalho: clientes catalogados, sites criados com o link, mensagens enviadas e negócios fechados. Depois de uma atualização, é só apertar F5 no navegador.

8. **Encerrar** explicando o ciclo: `/catalogo` monta a fila de clientes, `/startlp` produz na ordem (você escolhe quantos), e o painel acompanha tudo.

## Regras

- Nunca exibir, pedir ou registrar senhas no chat. O login do Cloudflare é sempre pelo navegador do usuário (`wrangler login`).
- Antes de qualquer publicação futura, conferir com `wrangler whoami` se a conta ativa é a mesma do config; se mudou, avisar o usuário e parar até ele confirmar.
