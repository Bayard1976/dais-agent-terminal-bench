# DAIS-Agent Terminal-Bench Lane

DAIS-Agent is a public-safe Harbor/Codex benchmark lane prepared by Disruptive AI Solutions - DAIS for Terminal-Bench 2.1 evaluation.

The lane uses Harbor's built-in `codex` agent with a compact public skill that emphasizes exact task inspection, faithful verifier matching, minimal changes, and local evidence before finalization.

## Scope

- Benchmark: Terminal-Bench 2.1
- Dataset: `terminal-bench/terminal-bench-2-1`
- Harness: Harbor
- Agent: Harbor built-in `codex`
- Public label: `GPT-5.5 High + DAIS-Agent`
- Technical model setting: `gpt-5.5 / reasoning_effort=high / DAIS public skill`
- Execution: local Docker through Harbor

## What This Repository Contains

- Public-safe benchmark guidance skill
- Local preflight script
- One-task compliance probe script
- Guarded full five-attempt run script
- Local readiness guidance
- Metadata template

It does not contain API keys, private local run artifacts, private prompts, protected project internals, or leaderboard submission data.

## Quick Start

Run preflight:

```powershell
.\RUN_PUBLIC_CODEX_PREFLIGHT.ps1
```

Run a one-task compliance probe:

```powershell
.\RUN_PUBLIC_CODEX_COMPLIANCE_PROBE.ps1
```

Run the full official-grade workload only after explicit authorization:

```powershell
.\RUN_PUBLIC_CODEX_FULL_5_ATTEMPTS_GUARDED.ps1 -AuthorizationPhrase "I authorize the clean public-safe Terminal-Bench 2.1 GPT-5.5 High + DAIS-Agent five-attempt run now."
```

Before upload, run the local readiness audit from the private working folder and confirm that trajectories, trace export, metadata, and exposure checks pass. Do not upload directly from this repository without that local audit.

## Public Claim Boundary

Internal or local scores are not official public leaderboard results. A public score claim should be made only after the official Terminal-Bench process accepts the submitted run.

## Contact

Bayard Galvao  
Founder, Disruptive AI Solutions - DAIS  
Brazil  
Email: bayardgalvao@yahoo.com  
LinkedIn: https://www.linkedin.com/in/bayardgalvao
