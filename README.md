# Homebrew Tap for Serv

[Serv](https://github.com/vyuvaraj/Serv-lang) is a programming language for building backend services, schedulers, and APIs. It compiles to native binaries via Go.

## Install

```bash
brew tap vyuvaraj/serv
brew install serv
```

## Update

```bash
brew update
brew upgrade serv
```

## Verify

```bash
serv --help
```

## Post-install

Add to your shell profile (`~/.zshrc` or `~/.bashrc`):

```bash
export SERV_HOME=$(brew --prefix serv)
```

## Quick Start

```bash
serv init myapp
cd myapp
serv run main.srv --watch
```

## Requirements

- [Go 1.22+](https://go.dev/dl/) (installed automatically by Homebrew as a dependency)

## Links

- [Serv Language](https://github.com/vyuvaraj/Serv-lang)
- [Getting Started](https://github.com/vyuvaraj/Serv-lang/blob/main/docs/getting-started.md)
- [Language Reference](https://github.com/vyuvaraj/Serv-lang/blob/main/docs/language-reference.md)
- [Standard Library](https://github.com/vyuvaraj/Serv-lang/blob/main/docs/stdlib.md)
