param(
  [string]$AuthorizationPhrase = "",
  [string]$Dataset = "terminal-bench/terminal-bench-2-1",
  [string]$ModelId = "gpt-5.5",
  [string]$JobsDir = "",
  [string]$CodexAuthJsonPath = "",
  [int]$Concurrency = 1
)

$ErrorActionPreference = "Stop"

$required = "I authorize the clean public-safe Terminal-Bench 2.1 GPT-5.5 five-attempt run now."
if ($AuthorizationPhrase -ne $required) {
  throw "Start refused. Exact authorization phrase required."
}

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$skills = Join-Path $root "skills\dais-agent-public"
if (-not $JobsDir) {
  $JobsDir = Join-Path $root "jobs\official_candidate_full_5_attempts_v0_1"
}
if (-not $CodexAuthJsonPath) {
  $CodexAuthJsonPath = Join-Path $root "secrets\codex_openai_auth.json"
}
New-Item -ItemType Directory -Force -Path $JobsDir | Out-Null

$env:PATH = "$env:APPDATA\Python\Python313\Scripts;C:\Program Files\Docker\Docker\resources\bin;$env:PATH"
$env:PYTHONUTF8 = "1"
$env:PYTHONIOENCODING = "utf-8"

if (-not (Test-Path -LiteralPath $CodexAuthJsonPath)) {
  throw "Codex auth JSON path not found."
}
$env:CODEX_AUTH_JSON_PATH = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($CodexAuthJsonPath)

harbor run `
  -d $Dataset `
  -a codex `
  -m $ModelId `
  -k 5 `
  -n $Concurrency `
  -o $JobsDir `
  --skill $skills `
  --agent-kwarg "reasoning_effort=high" `
  --agent-kwarg "reasoning_summary=concise"
