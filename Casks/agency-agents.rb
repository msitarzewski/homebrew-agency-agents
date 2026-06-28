cask "agency-agents" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "8e67279beae9bd1d63045ce44a7d99ee9083e93d15031683598c904ebf4ee5df",
         intel: "0c9730eead95c0b19452a557d5d29f1f1534d86836b85b6094109761f1c8f09d"

  url "https://github.com/msitarzewski/agency-agents-app/releases/download/v#{version}/Agency_Agents_#{version}_#{arch}.dmg",
      verified: "github.com/msitarzewski/agency-agents-app/"
  name "Agency Agents"
  desc "Native installer for AI agents"
  homepage "https://agencyagents.app/"

  # The app self-updates via tauri-plugin-updater as of v0.2.0, but brew-installed
  # copies are managed by brew — so bump version + sha256 every release to keep
  # `brew upgrade --cask` current. (v0.2.0 asset names use underscores, not the
  # auto-sanitized dots v0.1.0 shipped with — hence the `Agency_Agents_` url.)
  #
  # `>= :ventura` (macOS 13+, matching minimumSystemVersion) — NOT the bare
  # `:ventura` symbol, which pins to Ventura exactly and would block newer macOS.
  # `brew style --fix` rewrites this; do not accept that autocorrect.
  depends_on macos: ">= :ventura"

  app "Agency Agents.app"

  zap trash: [
    "~/Library/Application Support/com.zerologic.agency-agents-app",
    "~/Library/Caches/com.zerologic.agency-agents-app",
    "~/Library/HTTPStorages/com.zerologic.agency-agents-app",
    "~/Library/Preferences/com.zerologic.agency-agents-app.plist",
    "~/Library/Saved Application State/com.zerologic.agency-agents-app.savedState",
    "~/Library/WebKit/com.zerologic.agency-agents-app",
  ]
end
