cask "kuali" do
  version "0.1.14"
  sha256 "c876bad7e35fe3ae07bb7d6f1a0865503e03e3c598fbad64909409b293ba8055"

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
