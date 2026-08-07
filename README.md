# homebrew-confium

Homebrew tap for [Confium](https://www.confium.org/).

## Install

```sh
brew tap confium/confium
brew install confium           # CLI
brew install confium-signerd   # Threshold signing daemon
```

## Formulae

| Formula | What |
|---------|------|
| [`confium`](./Formula/confium.rb) | The `confium` CLI |
| [`confium-signerd`](./Formula/confium-signerd.rb) | Threshold signing daemon |

## Auto-update

When [`confium/confium`](https://github.com/confium/confium) cuts a new release tag, the [release workflow](./.github/workflows/release.yml) in this tap opens a PR bumping the formula `version` + `sha256`. The PR auto-merges once green.

## More

- Documentation: <https://www.confium.org/>
- Source: <https://github.com/confium/confium>
- Discussions: <https://github.com/confium/confium/discussions>
