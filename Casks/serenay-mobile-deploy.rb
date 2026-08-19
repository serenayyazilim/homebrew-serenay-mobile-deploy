cask "serenay-mobile-deploy" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "eaa2e1a99035c3bc1611b4964fab02518cbb488ae73c1a3b62700e50414f3d88",
         intel: "1375256dd51d0cbbfdead04342852eb9601673b63213c91a694cef689c3b613e"

  url "https://github.com/serenayyazilim/serenay-mobile-deploy/releases/download/v#{version}/Serenay.Mobile.Deploy_#{version}_#{arch}.dmg"
  name "Serenay Mobile Deploy"
  desc "Flutter multi-app build and deploy tool"
  homepage "https://github.com/serenayyazilim/serenay-mobile-deploy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Serenay Mobile Deploy.app"

  zap trash: [
    "~/Library/Application Support/com.serenaymobiledeploy.app",
    "~/Library/Caches/com.serenaymobiledeploy.app",
    "~/Library/WebKit/com.serenaymobiledeploy.app",
  ]

  caveats do
    <<~EOS
      This build is not signed with a paid Apple Developer ID, so macOS Gatekeeper
      will flag it as being from an unidentified developer on first launch.

      To open it, either right-click the app in Finder and choose "Open", or run:
        xattr -dr com.apple.quarantine "#{appdir}/Serenay Mobile Deploy.app"
    EOS
  end
end
