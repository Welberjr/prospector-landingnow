@echo off
chcp 65001 >nul
title LandingNow - publicar no Cloudflare Pages
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0publicar-cloudflare.ps1" -Pasta "%~1"
