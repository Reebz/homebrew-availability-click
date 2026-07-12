cask "availability-click" do
  version "1.2.1"
  sha256 "50d600c2877b305bb1331989750d6ebd6192a93b253662b9710299691c38a1d7"

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
