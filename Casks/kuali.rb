cask "kuali" do
  version "0.1.7"
  sha256 "1c6f54656a39cd0b83018aa3d1395723725b41ca5a4781ee0e03d3822d8d99f9"

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
