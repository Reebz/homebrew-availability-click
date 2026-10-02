cask "availability-click" do
  version "1.3.0"
  sha256 "3ee16918d237dd167d5f1e632cc5cf6d6eed82e2e618ad6df9882f52228401f8"

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
