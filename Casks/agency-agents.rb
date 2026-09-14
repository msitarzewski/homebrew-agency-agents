cask "agency-agents" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "57d80cd98f0a4f112c3b70d15e341dc9b9fa483a3433ba6ed9ff594ecd039d22",
         intel: "0d24eaa45c1c5c1c85f35ab222572c7666fe97705f61f6fe42ae0351183b8986"

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
