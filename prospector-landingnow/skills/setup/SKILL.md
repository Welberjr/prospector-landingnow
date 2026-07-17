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

6. **PAINEL (criar automaticamente, sem perguntar)**: copie `skills/catalogo/references/painel-template.html` do plugin para a pasta conectada como `painel.html`. É o painel de controle local do usuário: arquivo único, sem servidor e sem banco, com os dados embutidos. Explique: "Criei o seu painel: dê dois cliques em painel.html na sua pasta. Login: admin | Senha: 12345678". O visual e o login são padrão para todos.
7. **Encerrar** explicando o ciclo: `/prospectar` acha os clientes, `/criar-site` monta a página, `/publicar` sobe no Cloudflare, `/proposta` entrega a mensagem de WhatsApp pronta.

## Regras

- Nunca exibir, pedir ou registrar senhas no chat. O login do Cloudflare é sempre pelo navegador do usuário (`wrangler login`).
- Antes de qualquer publicação futura, conferir com `wrangler whoami` se a conta ativa é a mesma do config; se mudou, avisar o usuário e parar até ele confirmar.
