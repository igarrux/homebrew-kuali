# Homebrew tap for Kuali

**English** · [Español](README.es.md)

This tap installs the official [Kuali](https://github.com/igarrux/kuali)
macOS release. Kuali is a local-first meeting transcription app with live
speaker attribution for Discord and browser calls.

## Install

```sh
brew install --cask igarrux/kuali/kuali
xattr -dr com.apple.quarantine /Applications/Kuali.app
```

The fully qualified name makes Homebrew trust only the Kuali cask and adds this
tap automatically. Kuali currently requires macOS 11 or newer on Apple Silicon.

Kuali is ad-hoc signed but not yet notarized by Apple. The second command
explicitly removes the quarantine attribute only from the installed
`Kuali.app`. Review it and run it only if you trust this repository and the
linked Kuali release.

## Upgrade

```sh
brew update
brew upgrade --cask kuali
```

## Uninstall

Remove only the application:

```sh
brew uninstall --cask kuali
```

Remove the application and Kuali data stored in its default locations:

```sh
brew uninstall --cask --zap kuali
```

The zap operation does not remove unrelated files or models moved to a custom
external directory.

## License

The tap is available under the [MIT License](LICENSE). Kuali licensing is
documented in the [main repository](https://github.com/igarrux/kuali#license).
