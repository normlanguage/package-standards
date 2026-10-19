$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$skill = Get-Content (Join-Path $root 'SKILL.md') -Raw
$required = @('# Package Standards Skill','## Source of truth','## Repository contract','## Skill publication','## Release and consumption','## Agent workflow')
foreach ($heading in $required) { if ($skill -notmatch [regex]::Escape($heading)) { throw "Missing Skill section: $heading" } }
if ($skill -notmatch 'docs/standard\.zh-CN\.md') { throw 'Skill must link to the canonical standard' }
Write-Output 'Package Standards Skill: contract passed'
