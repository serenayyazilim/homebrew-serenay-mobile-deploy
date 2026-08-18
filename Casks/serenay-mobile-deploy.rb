cask "serenay-mobile-deploy" do
  version "0.1.0"
  sha256 "09ce02b7c8151c02dacc4f7d2a5bccba0270ef3e05010445c703cf9f1936632c"

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
