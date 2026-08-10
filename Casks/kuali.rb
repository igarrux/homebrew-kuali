cask "kuali" do
  version "0.1.8"
  sha256 "a271bc8605b9b0c2e13ee94a6586b297eeab8a12267fa7b0ead1e81d40e97eb1"

  url "https://github.com/igarrux/kuali/releases/download/v#{version}/Kuali_#{version}_aarch64.dmg",
      verified: "github.com/igarrux/kuali/"
  name "Kuali"
  desc "Local-first meeting transcription with speaker attribution"
  homepage "https://github.com/igarrux/kuali"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Kuali.app"

  zap trash: [
    "~/.kuali",
    "~/Library/Application Support/com.onwev.Kuali",
    "~/Library/Preferences/com.onwev.Kuali",
  ]

  caveats <<~EOS
    To open Kuali after installation, run:

      xattr -dr com.apple.quarantine /Applications/Kuali.app
  EOS
end
