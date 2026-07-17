---
name: publicar
description: Publica a landing page de um lead no Cloudflare Pages via Wrangler. Acione quando o usuário rodar /publicar, disser "publicar o site", "subir no ar", "colocar no Cloudflare" ou "fazer o deploy".
---

# Publicar no Cloudflare Pages

Subir a pasta do cliente para o Cloudflare Pages, com URL `[slug].pages.dev`, HTTPS automático e validação.

## Antes de publicar (obrigatório)

Rode `wrangler whoami` e confira se o e-mail da conta ativa é o mesmo do campo `cloudflare.conta` do config. Se for diferente, PARE e avise o usuário: publicar na conta errada espalha os sites dele. Só continue depois que ele confirmar ou relogar (`wrangler logout` e `wrangler login`).

## Publicação (comandos no PowerShell/terminal, na pasta do cliente)

1. Criar o projeto (só na primeira vez do cliente):
   `wrangler pages project create [slug] --production-branch=main`
   - ATENÇÃO ao retorno: se o Cloudflare devolver a URL com sufixo aleatório (ex.: `slug-8gu.pages.dev`), o nome já pertence a outra conta. Nesse caso apague o projeto (`wrangler pages project delete [slug]`), escolha um slug alternativo (ex.: acrescente a cidade) e refaça, atualizando também as meta tags `og:` do index.html para a URL final.
2. Publicar:
   `wrangler pages deploy . --project-name=[slug] --branch=main --commit-dirty=true`
3. Validar: aguarde uns 20 segundos (propagação) e confira com HEAD requests que a página responde 200 como `text/html` e as imagens como `image/...`. Domínios novos podem demorar 1 a 2 minutos.
4. Atualize `leads.md`: status `publicado` + URL nova.

## Alternativa sem chat (2 cliques)

`references/publicar-cloudflare.ps1` e `publicar-cloudflare.bat` são um publicador local para Windows: copie-os uma vez para a pasta conectada do usuário e ensine: arrastar a pasta do cliente para cima do `.bat` publica e devolve a URL. Também aceita fila (`fila-cloudflare.txt`, formato `caminho|slug`, uma linha por cliente).

## Regras

- Nunca pedir senha do Cloudflare no chat. Login é sempre `wrangler login` no navegador do usuário.
- Link para cliente é sempre `https://`. Se o HTTPS não validar, aguarde a propagação antes de entregar.
