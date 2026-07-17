# ============================================================
#  Prospector de Sites  ->  publicacao no CLOUDFLARE PAGES
#  Substitui o /publicar do plugin (que subia por FTP na HostGator).
#  Conta Cloudflare: Filmesecia.df@gmail.com (Wrangler ja logado nela)
#
#  3 jeitos de usar:
#   1) Dois cliques no publicar-cloudflare.bat
#        - se existir fila-cloudflare.txt, publica tudo que estiver nela
#        - se nao existir, ele pergunta a pasta do cliente
#   2) Arraste a pasta do cliente para cima do publicar-cloudflare.bat
#   3) Linha de comando:
#        powershell -File publicar-cloudflare.ps1 -Pasta "C:\...\cliente" -Slug "meu-slug"
#
#  Comando de deploy (o mesmo do seu painel LandingNow):
#   wrangler pages deploy . --project-name=<slug> --branch=main --commit-dirty=true
#   ( --branch=main so garante que projeto novo ja sobe em producao )
# ============================================================
param([string]$Pasta = "", [string]$Slug = "")
$ErrorActionPreference = "Continue"
$base = Split-Path -Parent $MyInvocation.MyCommand.Path
$logf = Join-Path $base "publicador-cloudflare-log.txt"
$fila = Join-Path $base "fila-cloudflare.txt"

function Log($m, $c = "Gray") {
  Write-Host $m -ForegroundColor $c
  Add-Content -Path $logf -Value ("[" + (Get-Date -Format "dd/MM HH:mm:ss") + "] " + $m)
}

function Slugify($nome) {
  $s = $nome.ToLowerInvariant().Normalize([Text.NormalizationForm]::FormD)
  $sb = New-Object System.Text.StringBuilder
  foreach ($ch in $s.ToCharArray()) {
    if ([Globalization.CharUnicodeInfo]::GetUnicodeCategory($ch) -ne [Globalization.UnicodeCategory]::NonSpacingMark) {
      [void]$sb.Append($ch)
    }
  }
  $s = $sb.ToString() -replace '[^a-z0-9]+', '-'
  return $s.Trim('-')
}

$temWrangler = [bool](Get-Command wrangler -ErrorAction SilentlyContinue)
$temNpx = [bool](Get-Command npx -ErrorAction SilentlyContinue)
if (-not $temWrangler -and -not $temNpx) {
  Log "ERRO: nao encontrei 'wrangler' nem 'npx'. Instale com:  npm i -g wrangler" "Red"
  Read-Host "Enter para fechar"; exit 1
}

function Deploy($pastaCliente, $slug) {
  if ([string]::IsNullOrWhiteSpace($pastaCliente) -or -not (Test-Path $pastaCliente)) {
    Log ("PULOU (pasta nao existe): " + $pastaCliente) "Yellow"; return $false
  }
  $pastaCliente = (Resolve-Path $pastaCliente).Path
  if ([string]::IsNullOrWhiteSpace($slug)) { $slug = Slugify (Split-Path $pastaCliente -Leaf) }
  if (-not (Test-Path (Join-Path $pastaCliente "index.html"))) {
    Log ("AVISO: nao achei index.html em " + $pastaCliente + " (publicando mesmo assim)") "Yellow"
  }
  Log ("Publicando " + $pastaCliente + "  ->  projeto '" + $slug + "'") "Cyan"
  $crArgs = @("pages", "project", "create", $slug, "--production-branch=main")
  $wrArgs = @("pages", "deploy", ".", "--project-name=$slug", "--branch=main", "--commit-dirty=true")
  Push-Location $pastaCliente
  try {
    # cria o projeto se ainda nao existir (se ja existir, o wrangler avisa e seguimos pro deploy)
    if ($temWrangler) { & wrangler @crArgs 2>&1 | Out-Host }
    else { & npx --yes wrangler @crArgs 2>&1 | Out-Host }
    # publica
    if ($temWrangler) { & wrangler @wrArgs 2>&1 | Out-Host }
    else { & npx --yes wrangler @wrArgs 2>&1 | Out-Host }
    $code = $LASTEXITCODE
  }
  finally { Pop-Location }
  if ($code -ne 0) { Log ("  FALHOU (wrangler retornou " + $code + ")") "Red"; return $false }
  $url = "https://" + $slug + ".pages.dev"
  $okv = $false
  foreach ($t in 1..2) {
    Start-Sleep -Seconds (3 * $t)
    try {
      $r = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 25
      if ($r.StatusCode -eq 200) { $okv = $true; break }
    }
    catch {}
  }
  if ($okv) { Log ("  OK, no ar  ->  " + $url) "Green" }
  else { Log ("  Publicado  ->  " + $url + "   (pode levar ~1 min pro https validar)") "Yellow" }
  return $true
}

$ok = 0; $falha = 0
if (-not [string]::IsNullOrWhiteSpace($Pasta)) {
  if (Deploy $Pasta $Slug) { $ok++ } else { $falha++ }
}
elseif (Test-Path $fila) {
  Log "Lendo fila-cloudflare.txt ..." "Cyan"
  foreach ($linha in (Get-Content $fila -Encoding UTF8)) {
    if ([string]::IsNullOrWhiteSpace($linha)) { continue }
    if ($linha.TrimStart().StartsWith("#")) { continue }
    $p = ""; $s = ""
    if ($linha.Contains("|")) { $par = $linha -split "\|", 2; $p = $par[0].Trim(); $s = $par[1].Trim() }
    else { $p = $linha.Trim() }
    if (Deploy $p $s) { $ok++ } else { $falha++ }
  }
  if ($falha -eq 0 -and $ok -gt 0) {
    Rename-Item $fila (Join-Path $base ("fila-publicada-" + (Get-Date -Format "yyyyMMdd-HHmm") + ".txt")) -Force
    Log "Fila concluida e arquivada." "Cyan"
  }
}
else {
  $p = Read-Host "Cole o caminho da pasta do cliente (ex.: C:\Users\welbe\Desktop\andrade-veiculos)"
  if (-not [string]::IsNullOrWhiteSpace($p