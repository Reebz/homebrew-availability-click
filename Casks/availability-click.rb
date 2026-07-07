cask "availability-click" do
  version "1.0.0"
  sha256 "c6292a6ca84d46297ed2a89b0afa2b09dd5aab5a5fb18f63cad3478df26fc521"

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
