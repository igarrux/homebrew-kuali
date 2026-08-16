cask "kuali" do
  version "0.1.13"
  sha256 "5d905da7c959f1f6b26c02e69ac6f065753ad41fb055efdc54a7e43f33dc7927"

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
