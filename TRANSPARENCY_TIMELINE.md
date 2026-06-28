# DAIS-Agent Transparency Timeline

This note separates founder background from benchmark evidence. Founder background is provided for context. Benchmark claims must be read only from accepted Terminal-Bench artifacts and official submission results.

## Founder and Project Background

Disruptive AI Solutions - DAIS is a one-person Brazilian AI startup founded by Bayard Galvao. Bayard is a psychologist with 27 years in private practice and 25 years as Head Director of the Milton H. Erickson Institute of Sao Paulo.

Bayard began studying AI in June 2023, focusing on model drift, failure modes, and ways to reduce reasoning drift without changing model weights. By early 2025, this work had developed into a structured reasoning framework intended to reduce drift and improve useful creative problem solving.

Throughout 2025 and 2026, DAIS applied this framework to AI-assisted blueprint projects across biotechnology, medicine, defense, agriculture, textile materials, climate, cyber defense, and related R&D challenge domains. DAIS was formally created in August 2025 after Bayard began working with challenge platforms and research programs including InnoCentive, NineSigma, NASA, XPRIZE, MIT-related opportunities, DARPA/DOD submissions, and ARIA.

In January 2026, Bayard received first prize in an InnoCentive engineering technology challenge. The specific challenge cannot be disclosed here because it has not yet been made public.

By February 2026, DAIS began using agentic coding tools to build software related to AI systems, safety, scanning, climate, cyber defense, and structured reasoning tools. By late May 2026, the work moved to GPT-Codex, where DAIS began building software and benchmark infrastructure around the reasoning framework and a DAIS coding architecture.

## Terminal-Bench Testing Timeline

In mid-June 2026, DAIS began testing against AI agent benchmarks, starting with Terminal-Bench 2.0. Early private tests focused on connection stability, task execution reliability, and diagnosing reasoning failures. The goal was not task-specific shortcutting, but improving the general reasoning process: for each miss, DAIS asked what reasoning would have led to the correct action.

On June 23, 2026, DAIS began private Terminal-Bench 2.1 testing, first using GPT-5 nano for stability and compliance checks, then running GPT-5.5 with high reasoning effort.

The first full 89-task run was started as a single complete run. Near the end of that run, DAIS realized that a five-run protocol was needed for a stronger official-style average. A continuation request was attempted late in Run 1, but the run completed and stopped as originally bounded, scoring 76/89.

After Run 1, there was a short clarification interval. DAIS and Codex corrected the protocol understanding: the benchmark evidence should consist of five full 89-task runs, not one run and not miss-only retries. Runs 2 through 5 were then executed as four additional complete 89-task runs under the same model/agent lane, without user intervention inside the runs beyond heartbeat/status monitoring.

## Five-Run Internal Official-Style Result

Model/run label: `GPT-5.5 High + DAIS-Agent`

Technical setting: `gpt-5.5 / reasoning_effort=high / DAIS public skill`

| Run | Score |
|---:|---:|
| 1 | 76/89 = 85.39% |
| 2 | 78/89 = 87.64% |
| 3 | 76/89 = 85.39% |
| 4 | 75/89 = 84.27% |
| 5 | 74/89 = 83.15% |

Aggregate result: `379/445 = 85.17%`

## Boundary

This timeline is a transparency note. It does not itself create an official leaderboard result. Public score claims should depend only on accepted Terminal-Bench submission artifacts and the official process.

## Protection-Layer Audit Note

A post-run audit checked whether the instruction to keep DAIS inner-engine material private caused candidate-output vetoes or false finalization blocks. The audit found no direct evidence of protection-layer false blocks. Misses reviewed in Run 1 were classified as concrete verifier/artifact failures, and a direct signal screen across all five runs did not justify a broader veto-causality claim.
