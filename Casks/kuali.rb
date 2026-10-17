cask "kuali" do
  version "0.1.17"
  sha256 "38559c9efd37f7cdb51aa5e47070b91b3e9cf313506984e31ecc10158d98f1d2"

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
  depends_on macos: :ventura

  app "Kuali.app"

  preflight_steps do
    run "/bin/sh", args: ["-c", <<~SH]
      version=$(/usr/bin/sw_vers -productVersion) || exit 1
      major=${version%%.*}
      minor=${version#*.}
      minor=${minor%%.*}
      if [ "$major" -lt 13 ] || { [ "$major" -eq 13 ] && [ "$minor" -lt 4 ]; }; then
        echo "Kuali requires macOS 13.4 or later." >&2
        exit 1
      fi
    SH
  end

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
