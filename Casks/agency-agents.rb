cask "agency-agents" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.2"
  sha256 arm:   "c1a291e1db7bb7599edbe217ae62a28b855e14d8dfa51452659261ed6e2af06b",
         intel: "8db1ec85d330bd7f6c3e6c8ab7df7abdcb262ae97fb6e602b61f74d25ecce497"

  url "https://github.com/msitarzewski/agency-agents-app/releases/download/v#{version}/Agency_Agents_#{version}_#{arch}.dmg"
  name "Agency Agents"
  desc "Native installer for AI agents"
  homepage "https://agencyagents.app/"

  # The app self-updates via tauri-plugin-updater as of v0.2.0, but brew-installed
  # copies are managed by brew — so bump version + sha256 every release to keep
  # `brew upgrade --cask` current. (v0.2.0 asset names use underscores, not the
  # auto-sanitized dots v0.1.0 shipped with — hence the `Agency_Agents_` url.)
  #
  # macOS 13+ (matches minimumSystemVersion). The bare `:ventura` symbol is a
  # minimum — "Ventura or newer" — not an exact pin. Homebrew deprecated the old
  # `">= :ventura"` string-comparison form (it warned on every `brew update`),
  # so the symbol form is now correct. See msitarzewski/agency-agents#638.
  depends_on macos: :ventura

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
