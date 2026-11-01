# homebrew-quiver

Homebrew tap for [Quiver](https://github.com/c-wenlong/quiver): the Mac app
(cask) and the `swe` CLI (formula).

## Install

The Mac app (Apple silicon, macOS 26 or later):

```bash
brew install --cask c-wenlong/quiver/quiver
```

The `swe` CLI on its own:

```bash
brew install c-wenlong/quiver/swe
```

The app updates itself through Sparkle, so `brew upgrade` skips it unless you
pass `--greedy`. `brew upgrade swe` picks up new CLI releases.

## How this tap is updated

Quiver's release workflow rewrites `Casks/quiver.rb` and `Formula/swe.rb`
with each release's version and SHA-256, then pushes here. Don't edit the
version lines by hand. The `Check` workflow runs `brew style`, `brew audit`
and a test install of `swe` on every push.
