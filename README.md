# Release.art Homebrew tap

[Homebrew](https://brew.sh) formulae for [Release.art](https://github.com/release-art)'s
command-line tools.

## Install

```sh
brew install release-art/tap/<formula>
```

or add the tap once and use the short names:

```sh
brew tap release-art/tap
brew install <formula>
```

`brew upgrade` keeps them up to date.

## Formulae

| Formula | What it is | Platforms |
| --- | --- | --- |
| [`tf-project`](Formula/tf-project.rb) | [tf-project](https://github.com/release-art/tf-project) (`tfp`): a Terraform / OpenTofu wrapper with one slot per tfvars environment, safe applies and secrets from 1Password or Azure Key Vault. | macOS (Apple Silicon, Intel), Linux (x86_64, arm64) |

The formulae install the prebuilt programs attached to each project's GitHub
release, after checking their SHA-256.

## Maintaining

Each formula lives in `Formula/<name>.rb`.

**tf-project updates itself:** its release workflow regenerates
`Formula/tf-project.rb` from the release's archives and commits it as the
*Release.art workflow bot* after each stable release. Edit the generator,
[`bin/homebrew-formula.py`](https://github.com/release-art/tf-project/blob/main/bin/homebrew-formula.py),
rather than the formula, or the next release overwrites your change.

For a formula without that automation, a new release means updating the
download URLs (Homebrew reads the version from them) and the `sha256` of each
archive. GitHub shows an asset's checksum on the release page, or:

```sh
gh release view v0.3.1 --repo release-art/tf-project --json assets \
  -q '.assets[] | select(.name | test("^tf-project-.*\\.tar\\.gz$")) | "\(.name) \(.digest)"'
```

To try a change the way CI checks it, work in Homebrew's own clone of the
tap. `brew tap` clones the repository, so edits elsewhere aren't seen:

```sh
brew tap release-art/tap
brew trust --tap release-art/tap        # needed for audit and test, not for installing
cd "$(brew --repository release-art/tap)"
# edit Formula/<name>.rb, then:
brew style release-art/tap
brew audit --strict --online release-art/tap/<name>
brew install release-art/tap/<name> && brew test release-art/tap/<name>
```

CI runs `brew style`, `brew audit` and an install plus `brew test` of every
formula on macOS and Linux for each push and pull request.
