# Norm Package Standards

[简体中文](README.zh-CN.md)

The maintenance and delivery standard for libraries in the Norm ecosystem. The [standard](docs/standard.zh-CN.md) owns the requirements; repositories link to it instead of copying them.

It covers module boundaries, names, public APIs, repository structure, documentation, executable samples, licensing, reproducible builds, immutable releases, and consumer acceptance. Applications, toolchains, and infrastructure use the applicable delivery requirements without adopting library naming rules.

Language semantics remain defined by the [Norm module system](https://github.com/normlanguage/Norm/blob/main/docs/spec/module-system.md). Shared package automation belongs to [registry](https://github.com/normlanguage/registry).

Changes to the standard are reviewed through pull requests. A requirement must have an identifiable owner and a practical verification method; templates and automation must not create a second definition of it.

Licensed under [MPL-2.0](LICENSE).
