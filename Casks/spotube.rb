cask "spotube" do
  version "5.1.2"
  sha256 "a14dc29d7778fad748062159541cd47e797719f37175df2726c74cd3c5519a48"

  url "https://github.com/KRTirtho/spotube/releases/download/v#{version}/Spotube-macos-universal.dmg",
      verified: "github.com/KRTirtho/spotube/"
  name "Spotube"
  desc "A cross-platform extensible open-source music streaming platform"
  homepage "https://spotube.krtirtho.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "spotube.app"

  zap trash: [
    "~/Library/Application Scripts/oss.krtirtho.spotube",
    "~/Library/Application Support/oss.krtirtho.spotube",
  ]

  depends_on formula: "yt-dlp"
end
