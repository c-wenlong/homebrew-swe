# homebrew-swe

Homebrew tap for [SWE](https://github.com/c-wenlong/swe): the Mac app
(cask) and the `swe` CLI (formula). SWE Wraps Everything — it was
`quiver` before the rename, and this tap was `homebrew-quiver`.

## Install

The Mac app (Apple silicon, macOS 26 or later):

```bash
brew install --cask c-wenlong/swe/swe
```

The `swe` CLI on its own:

```bash
brew install c-wenlong/swe/swe
```

The app updates itself through Sparkle, so `brew upgrade` skips it unless you
pass `--greedy`. `brew upgrade swe` picks up new CLI releases.

## Migrating from `quiver`

`Casks/quiver.rb` is frozen at the last Quiver build (1.1.1) so installs and
uninstalls of it keep working; its `livecheck` is skipped so brew never
chases SWE releases under the old token. The first SWE release adds
`Casks/swe.rb`. To move over: `brew uninstall --cask quiver`,
then `brew install --cask swe` — or just run
`app/mac/script/install-app.sh` from the repo, which migrates the app and
its launch agents itself.

## How this tap is updated

SWE's release workflow rewrites `Casks/swe.rb` and `Formula/swe.rb` with
each release's version and SHA-256, then pushes here. Don't edit the
version lines by hand. The `Check` workflow runs `brew style`, `brew audit`
and a test install of `swe` on every push.
