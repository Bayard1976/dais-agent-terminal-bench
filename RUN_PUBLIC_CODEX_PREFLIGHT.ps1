param(
  [string]$Dataset = "terminal-bench/terminal-bench-2-1",
  [string]$ModelId = "gpt-5.5"
)

$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$reportDir = Join-Path $root "reports\preflight_v0_1"
New-Item -ItemType Directory -Force -Path $reportDir | Out-Null

$env:PATH = "$env:APPDATA\Python\Python313\Scripts;C:\Program Files\Docker\Docker\resources\bin;$env:PATH"

function Probe {
  param([string]$Name, [scriptblock]$Script)
  try {
    $out = & $Script 2>&1
    [pscustomobject]@{ name = $Name; status = "PASS"; output_seen = [bool]$out }
  } catch {
    [pscustomobject]@{ name = $Name; status = "FAIL"; output_seen = $false; error = $_.Exception.Message }
  }
}

$checks = @()
$checks += Probe "harbor_help" { harbor --help }
$checks += Probe "docker_version" { docker --version }
$checks += Probe "skill_exists" { if (-not (Test-Path -LiteralPath (Join-Path $root "skills\dais-agent-public\SKILL.md"))) { throw "missing skill" } }
$checks += Probe "path_ascii" { if ($root -match "[^\x00-\x7F]") { throw "non-ascii root" } }

$result = [pscustomobject][ordered]@{
  schema = "public_codex_preflight_v0_1"
  generated_local = (Get-Date).ToString("s")
  root = $root
  dataset = $Dataset
  model = $ModelId
  agent = "codex"
  checks = $checks
  ready_for_small_probe = (($checks | Where-Object { $_.status -ne "PASS" }).Count -eq 0)
  benchmark_task_executed = $false
  model_api_call_made = $false
  upload_or_submission_performed = $false
}

$result | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath (Join-Path $reportDir "PUBLIC_CODEX_PREFLIGHT.json") -Encoding UTF8
$result | ConvertTo-Json -Depth 5
