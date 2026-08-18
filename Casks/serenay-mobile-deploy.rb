cask "serenay-mobile-deploy" do
  version "0.2.0"
  sha256 "0db88e961d7bbbe593a7d7714c7720be47c29fc30146fb997fd14b4baa4630b0"

  url "https://github.com/serenayyazilim/serenay-mobile-deploy/releases/download/v#{version}/serenay-mobile-deploy_#{version}_aarch64.dmg"
  name "Serenay Mobile Deploy"
  desc "Flutter multi-app build and deploy tool"
  homepage "https://github.com/serenayyazilim/serenay-mobile-deploy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "serenay-mobile-deploy.app"

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
        xattr -dr com.apple.quarantine "#{appdir}/serenay-mobile-deploy.app"
    EOS
  end
end
