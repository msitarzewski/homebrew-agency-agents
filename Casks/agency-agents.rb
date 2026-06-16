cask "agency-agents" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "2e94966a3d5bf3012eacbcc011dd2bb407e88ae4bcbf5d20c17d491b1ccb68b9",
         intel: "716ea03290f8c69be99aac7e5a4d5ce05ba85755e1b4585510db86f5415b781a"

  url "https://github.com/msitarzewski/agency-agents-app/releases/download/v#{version}/Agency.Agents_#{version}_#{arch}.dmg",
      verified: "github.com/msitarzewski/agency-agents-app/"
  name "Agency Agents"
  desc "Native installer for AI agents"
  homepage "https://agencyagents.app/"

  # No in-app updater yet (deferred for v0.1.0) — brew manages versions. The
  # cask version + sha256 bump every release so `brew upgrade --cask` stays current.
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
