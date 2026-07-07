cask "availability-click" do
  version "1.0.0"
  sha256 "a85d2c97cb501640cae18ecfa37b3328b4e3befcc8438b24d2f374f5a3a95615"

  url "https://github.com/Reebz/availability-click/releases/download/v#{version}/availability-click_v#{version}.dmg",
      verified: "github.com/Reebz/availability-click/"
  name "Availability Click"
  desc "Menu bar app that copies your calendar availability to the clipboard"
  homepage "https://availabilityclick.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :sonoma

  app "AvailabilityClick.app"

  # Sandboxed app: user data lives in the container, not ~/Library/Preferences.
  zap trash: [
    "~/Library/Application Scripts/com.availabilityclick.AvailabilityClick",
    "~/Library/Containers/com.availabilityclick.AvailabilityClick",
  ]
end
