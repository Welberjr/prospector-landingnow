---
name: criar-site
description: Cria a landing page nova de um lead no padrão LandingNow. Acione quando o usuário rodar /criar-site, disser "criar o site", "montar a landing page", "redesenhar o site do cliente" ou pedir a página de um lead prospectado.
---

# Criar a landing page (padrão LandingNow)

Construir a versão nova e premium da página do cliente, mantendo o conteúdo, a logo e as fotos REAIS dele. O arquivo de referência `references/template-base.html` é uma página aprovada neste padrão: use como base visual e estrutural, trocando conteúdo, cores e imagens para a identidade de cada cliente.

## Passos

1. Leia o site atual do lead (web_fetch) e extraia: textos, serviços, contatos, redes sociais e as URLs das imagens (logo, foto do profissional, ambientes, serviços). Se o HTML esconder as imagens (lazy-load), use um subagente para varrer o conteúdo salvo.
2. Baixe as imagens reais para `clientes/[slug]/img/` na pasta conectada (via PowerShell `Invoke-WebRequest` no Windows ou `curl` no Mac). Nunca referencie imagem por link http do site antigo dentro da página nova.
3. Monte `clientes/[slug]/index.html` seguindo o checklist abaixo, adaptando a paleta de cores à identidade do cliente.
4. Gere favicon e imagem de preview (ver seção Favicon e Preview).
5. Confira o checklist inteiro antes de entregar e atualize o status do lead em `leads.md` para `site-criado`.

## Checklist obrigatório (não pule nenhum item)

Texto:
- NUNCA usar travessões (o traço longo). Vírgula, ponto ou parênteses no lugar.
- Parágrafos justificados. Títulos centralizados no mobile.
- Reescrever o conteúdo do cliente com outras palavras, mantendo o sentido.

Estética:
- Visual moderno, cores vivas adaptadas à marca do cliente, alto contraste.
- Cards com bordas bem arredondadas e conteúdo centralizado.
- Efeito neon em volta dos cards de destaque, sobre fundo escuro.
- Rodapé centralizado (logo, navegação, redes).
- Faixa de destaque do meio da página: SEMPRE com degradê nas cores da marca (fica bom em qualquer cliente). Foto de fundo nessa faixa é exceção: só com imagem de ambiente larga (1000px+) e nítida. Foto pequena, escura ou esticada nunca entra como fundo.
- PROIBIDO emoji como ícone. Redes sociais sempre com o ícone oficial correspondente em SVG.
- Ícones ARTESANAIS para QUALQUER nicho: todo ícone de serviço/diferencial é desenhado à mão em SVG multicamadas seguindo a ANATOMIA descrita em `references/icones-artesanais.html` (sombra na base + corpo com gradiente vivo + brilho no topo + detalhe em cor de contraste). O arquivo traz a receita completa, a tabela de símbolo por nicho (advogado = balança, dentista = dente, oficina = chave inglesa etc.) e 12 exemplos prontos de nichos variados. Desenhe o símbolo específico de cada serviço do cliente com as cores da marca dele. Nunca ícone chapado de biblioteca, nunca o padrão genérico das IAs, nunca emoji. Antes de entregar, confira ícone por ícone: se algum ficou monocromático ou sem as 4 camadas, redesenhe.
- Link de ação dos cards: texto padrão "Saiba mais" (nunca "Saber mais"), ancorado na base do card, com todos os links na MESMA linha entre cards vizinhos (card em flex column, texto com flex 1, link com margin-top auto). Vale no desktop e no mobile.
- RODAPÉ RICO horizontal com contato integrado (obrigatório, substitui o card de contato separado): fundo degradê escuro da marca + brilhos radiais. Estrutura: (1) topo centralizado com chip branco da logo, frase curta do negócio e redes sociais em circulinhos translúcidos; (2) TRÊS COLUNAS LADO A LADO, que permanecem 3 colunas TAMBÉM NO MOBILE (textos curtos): "Navegue" (links âncora), "Contato" (telefone, e-mail, Instagram como links) e "Onde estamos" (endereço em linhas curtas), com títulos pequenos em CAIXA ALTA na cor neon da marca (letter-spacing largo); (3) DIVISÓRIA DE LUZ: linha de 2px com gradiente transparente-neon-transparente e box-shadow de brilho (glow), antes da linha de direitos centralizada. A antiga seção de contato vira só o chamadão de agendamento (título + card degradê central com botão, classe cta-solo, id="agendar"). O id="contato" fica no footer e o menu aponta pra ele. Ver o bloco pronto no template-base. Nunca uma fileira solta de emojis.

Mobile (sempre otimizado):
- 100% responsivo, pensado primeiro no celular.
- Grade 2x2 SOMENTE para itens curtos (números, tags de 1 a 3 palavras, selos, convênios). Card com parágrafo descritivo ocupa a linha inteira no mobile: texto espremido com 1 ou 2 letras por linha é PROIBIDO.
- EFEITO CARDS EMPILHADOS (obrigatório no mobile): listas de cards com parágrafo (diferenciais, serviços/planos) usam sticky stack em CSS puro: container display block; cada card position sticky com top escalonado (88px, 104px, 120px..., degrau de 16px, começando abaixo do header) e margem inferior de 18px. Rolando, cada card gruda e o próximo sobe por cima deixando a beiradinha do anterior; rolando pra cima, reverte sozinho. Ver o bloco pronto no @media do template-base. Desktop fica em grade normal.
- Botões da primeira dobra lado a lado, nunca empilhados.
- Sem poluição de botões (um CTA de WhatsApp no hero basta, mais o flutuante).
- Botão flutuante do WhatsApp com espaço extra no rodapé para não cobrir texto.

Contato:
- Botão flutuante e CTAs em `wa.me/55DDDNUMERO` com mensagem pré-preenchida.
- Redes sociais reais do cliente no contato e no rodapé.

## Favicon e Preview (obrigatórios)

- Favicon gerado da logo do cliente, em ícone arredondado: `favicon.ico` na raiz + `img/favicon.png` (64px) + `img/apple-touch-icon.png` (180px). Referenciar com `?v=1` (e incrementar a cada atualização, para furar o cache).
- Preview de WhatsApp: `img/og-image.jpg` de 1200x630 (logo, foto real e um botão "Agende sua consulta" desenhado), mais as meta tags `og:title`, `og:description`, `og:image` (URL absoluta do domínio final), `og:image:width/height` e `twitter:card`. Nunca deixar o preview vazio.
- Gere as imagens com Python + Pillow (`pip install pillow --break-system-packages` se faltar).

## Validação final

- `grep` por travessões no HTML: precisa dar zero.
- Conferir que toda imagem referenciada existe em `img/`.
- Revisar mentalmente o mobile: grades 2x2, botões lado a lado, nada empilhado.
