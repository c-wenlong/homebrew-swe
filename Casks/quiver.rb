cask "quiver" do
  version "1.1.1"
  sha256 "bfe520dce920ff306717c6e14eaae359b764a8d7e4f9508ae92a1dac1d870e9f"

  url "https://github.com/c-wenlong/swe/releases/download/v#{version}/Quiver-#{version}.dmg"
  name "Quiver"
  desc "Manage AI coding CLIs, their sessions, usage and rate limits"
  homepage "https://github.com/c-wenlong/swe"

  livecheck do
    skip "Renamed to swe"
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Quiver.app"

  uninstall launchctl: "com.cwenlong.quiver.fan",
            delete:    [
              "/Library/LaunchDaemons/com.cwenlong.quiver.fan.plist",
              "/Library/PrivilegedHelperTools/com.cwenlong.quiver.fan",
            ]

  zap trash: [
    "~/Library/Caches/com.cwenlong.quiver",
    "~/Library/Containers/com.cwenlong.quiver.widgets",
    "~/Library/HTTPStorages/com.cwenlong.quiver",
    "~/Library/Preferences/com.cwenlong.quiver.plist",
    "~/Library/Saved Application State/com.cwenlong.quiver.savedState",
    "~/Library/WebKit/com.cwenlong.quiver",
  ]
end
