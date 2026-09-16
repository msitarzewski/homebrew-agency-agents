cask "agency-agents" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.1"
  sha256 arm:   "0c5e998f5e9990c4ac80142be56e43be0c85ea6869c727cd64241265290d3275",
         intel: "b5fb779f81812eea0669eb6740b537807918fb8274b8f8f9c1a40776f1cc6e94"

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
