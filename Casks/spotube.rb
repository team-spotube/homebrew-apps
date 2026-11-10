cask "spotube" do
  version "6.0.0"
  sha256 "e460de6a0a0c60afda63af1d1c022f3e39d03610852cd7e2f4dedbc612d245d3"

  url "https://github.com/team-spotube/spotube/releases/download/v#{version}/Spotube-macos-apple-silicon.dmg",
      verified: "github.com/team-spotube/spotube/"
  name "Spotube"
  desc "Open source, plugin powered music streaming client"
  homepage "https://spotube.cc/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Intel macs aren't supported: GraalVM native-image can't cross-compile the DMG
  depends_on arch: :arm64

  app "Spotube.app"

  zap trash: [
    "~/Library/Application Support/Spotube",
    "~/Library/Caches/Spotube",
    "~/Library/Preferences/org.spotube.spotube.plist",
    "~/Library/Saved Application State/org.spotube.spotube.savedState",
    "~/Library/WebKit/org.spotube.spotube",
  ]
end
