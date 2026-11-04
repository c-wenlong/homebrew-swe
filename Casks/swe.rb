cask "swe" do
  version "1.2.2"
  sha256 "a031f1a05df481229036be1d8d37b7b2357a68294f0d5fad0cbb7f58823cfb2a"

  url "https://github.com/c-wenlong/swe/releases/download/v#{version}/SWE-#{version}.dmg"
  name "SWE"
  desc "Manage AI coding CLIs, their sessions, usage and rate limits"
  homepage "https://github.com/c-wenlong/swe"

  livecheck do
    url "https://github.com/c-wenlong/swe/releases/latest/download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "SWE.app"

  uninstall launchctl: [
              "com.cwenlong.swe.fan",
              "com.cwenlong.quiver.fan",
            ],
            delete:    [
              "/Library/LaunchDaemons/com.cwenlong.swe.fan.plist",
              "/Library/LaunchDaemons/com.cwenlong.quiver.fan.plist",
              "/Library/PrivilegedHelperTools/com.cwenlong.swe.fan",
              "/Library/PrivilegedHelperTools/com.cwenlong.quiver.fan",
            ]

  zap trash: [
    "~/Library/Caches/com.cwenlong.swe",
    "~/Library/Caches/com.cwenlong.quiver",
    "~/Library/Containers/com.cwenlong.swe.widgets",
    "~/Library/Containers/com.cwenlong.quiver.widgets",
    "~/Library/HTTPStorages/com.cwenlong.swe",
    "~/Library/HTTPStorages/com.cwenlong.quiver",
    "~/Library/Preferences/com.cwenlong.swe.plist",
    "~/Library/Preferences/com.cwenlong.quiver.plist",
    "~/Library/Saved Application State/com.cwenlong.swe.savedState",
    "~/Library/Saved Application State/com.cwenlong.quiver.savedState",
    "~/Library/WebKit/com.cwenlong.swe",
    "~/Library/WebKit/com.cwenlong.quiver",
  ]
end
