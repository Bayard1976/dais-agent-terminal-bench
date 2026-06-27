param(
  [string]$Dataset = "terminal-bench/terminal-bench-2-1",
  [string]$ModelId = "gpt-5.5",
  [string]$TaskName = "",
  [int]$TaskLimit = 1,
  [string]$JobsDir = "",
  [string]$CodexAuthJsonPath = ""
)

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$skills = Join-Path $root "skills\dais-agent-public"
if (-not $JobsDir) {
  $JobsDir = Join-Path $root "jobs\compliance_probe_v0_1"
}
New-Item -ItemType Directory -Force -Path $JobsDir | Out-Null

$env:PATH = "$env:APPDATA\Python\Python313\Scripts;C:\Program Files\Docker\Docker\resources\bin;$env:PATH"
$env:PYTHONUTF8 = "1"
$env:PYTHONIOENCODING = "utf-8"

if ($CodexAuthJsonPath) {
  $resolvedAuth = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($CodexAuthJsonPath)
  if (-not (Test-Path -LiteralPath $resolvedAuth)) {
    throw "Codex auth JSON path not found."
  }
  $env:CODEX_AUTH_JSON_PATH = $resolvedAuth
} elseif (-not $env:CODEX_AUTH_JSON_PATH) {
  $defaultAuth = Join-Path $env:USERPROFILE ".codex\auth.json"
  if (Test-Path -LiteralPath $defaultAuth) {
    $env:CODEX_AUTH_JSON_PATH = $defaultAuth
  }
}

$taskArgs = @()
if ($TaskName -and $TaskName.Trim()) {
  $taskArgs += @("--task", $TaskName)
}

harbor run `
  -d $Dataset `
  -a codex `
  -m $ModelId `
  @taskArgs `
  -l $TaskLimit `
  -n 1 `
  -o $JobsDir `
  --skill $skills `
  --agent-kwarg "reasoning_effort=high" `
  --agent-kwarg "reasoning_summary=concise"
