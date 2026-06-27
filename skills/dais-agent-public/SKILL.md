# DAIS-Agent Public Benchmark Guidance

Use plain implementation language only.

For each Terminal-Bench task:

1. Read the task instruction, visible tests, verifier scripts, setup files, expected paths, ports, command names, stdin/stdout behavior, and required output artifacts before editing.
2. Identify the exact final state the verifier is likely to check.
3. Make the smallest task-relevant change needed to reach that state.
4. After changing files or starting processes, inspect the actual file, command, service, or output state rather than assuming it worked.
5. Run the visible verifier or the closest faithful local check before finishing.
6. Do not replace the verifier's expected path, port, command, filename, output format, or process behavior with a similar one.
7. Do not hardcode examples unless the task explicitly requires a fixed output.
8. Do not access benchmark websites, public solution repositories, hidden answers, credentials, or non-task external resources.
9. Do not print credentials, API keys, tokens, or secret values.
10. Keep the final task note short: changed files, verification command, result, and remaining risk if any.

Before finalizing, confirm:

- required artifact path exists;
- required command or service behavior matches the verifier;
- output format is exact;
- visible verifier or faithful local check passed;
- no unrelated changes were made.
