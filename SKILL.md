# Package Standards Skill

Use this skill when creating, reviewing, publishing, or consuming a Norm library repository.

## Source of truth

- `module.norm` is the only source for module name, version, dependencies, exports, and binding fingerprints.
- Public API facts come from Norm declarations and their `@Document` metadata. Do not duplicate API signatures in README or registry data.
- The standard is defined by [`docs/standard.zh-CN.md`](docs/standard.zh-CN.md). This file is an agent-oriented index of that standard.

## Repository contract

A publishable library repository owns one public Module. The repository name and Module name use the same lowercase dot-separated identity. `exports` contains only maintained public API. Internal bindings remain behind module visibility.

Required entry points:

- `README.md` and `README.zh-CN.md` for discovery and a verified quick start.
- `LICENSE` for the repository license.
- The module's single `module.norm` declaration.
- A runnable `samples/` consumer using the released package.
- Tests and build entry points that work from a clean checkout.

Do not publish aliases, implementation-only modules, duplicate type definitions, generated caches, credentials, or samples inside the runtime artifact.

## Skill publication

Every publishable library exposes a root `SKILL.md` at the repository root. It is generated from declarations, `@Document`, and verified samples through the repository's canonical generator. The generated file must be checked in and reproducible; CI must fail when regeneration changes it.

A library Skill should state:

- module name, supported Norm version, and immutable release URL;
- public packages, types, functions, fields, errors, and resource lifecycles;
- the smallest verified examples and their required dependencies;
- unsupported or unavailable capabilities when agents might otherwise guess them;
- links back to source/API documentation.

The Skill describes the library; it does not replace API declarations, `module.norm`, README, or Registry ownership data.

## Release and consumption

Release versions are positive integers. Version `N` is tag `vN`; tags and artifacts are immutable. A release must contain the package artifact, SHA-256 sidecar, license contract, and a consumer check from an empty cache. Dependencies resolve through the package manager and must not rely on sibling checkouts, absolute paths, or hidden caches.

Before publishing, verify the public API, module declaration, tests, samples, README commands, generated Skill, artifact checksum, license, and clean-cache consumer installation. Use the shared workflows from [`normlanguage/registry`](https://github.com/normlanguage/registry) instead of copying packaging logic.

## Agent workflow

When an API is missing, inspect the library source and generated documentation first. Add a dependency only through `module.norm`, then implement and verify a public tool or sample against the published contract. Never invent an import or function name from another language.
