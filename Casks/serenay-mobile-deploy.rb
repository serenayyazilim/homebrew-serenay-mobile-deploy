cask "serenay-mobile-deploy" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.13"
  sha256 arm:   "ed9c032e407728b41dd77007ed555af1c724b801e9519d110f13098c84f41a24",
         intel: "ed02f0cf3dab62216af7e3ab0b2454801e31b4c31d2763ac36732078255a8564"

  url "https://github.com/serenayyazilim/serenay-mobile-deploy/releases/download/v#{version}/Serenay.Mobile.Deploy_#{version}_#{arch}.dmg"
  name "Serenay Mobile Deploy"
  desc "Run and deploy Flutter, React Native, Expo and native mobile apps"
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
