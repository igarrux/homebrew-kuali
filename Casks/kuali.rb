cask "kuali" do
  version "0.1.0"
  sha256 "5038f8ccef34322a703fbded2a9ff18f63d6ed71ff24c8fc2d783b7e73eadcda"

  url "https://github.com/igarrux/kuali/releases/download/v#{version}/Kuali_#{version}_aarch64.dmg",
      verified: "github.com/igarrux/kuali/"
  name "Kuali"
  desc "Local-first meeting transcription with speaker attribution"
  homepage "https://github.com/igarrux/kuali"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Kuali.app"

  zap trash: [
    "~/.kuali",
    "~/Library/Application Support/com.onwev.Kuali",
    "~/Library/Preferences/com.onwev.Kuali",
  ]

  caveats <<~EOS
    Kuali is ad-hoc signed but not yet notarized by Apple. To open it after
    installation, review and run this command explicitly:

      xattr -dr com.apple.quarantine /Applications/Kuali.app
  EOS
end
