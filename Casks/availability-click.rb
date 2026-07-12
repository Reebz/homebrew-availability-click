cask "availability-click" do
  version "1.2.0"
  sha256 "232fbfa4b5b5240bb45d5d8575417d79f71df4e54dd8e1a353f706b8b602489c"

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
