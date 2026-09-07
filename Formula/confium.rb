# Homebrew formula for the Confium CLI.
#
# Installs the `confium` command-line tool. For the full product
# surface (signerd, log-server, etc.) install those formulae separately
# or use Docker images from ghcr.io/confium/*.
#
# Usage:
#   brew tap confium/confium
#   brew install confium
#   confium --version
#
# Auto-bumped by .github/workflows/release.yml in this tap when the
# upstream confium/confium repo cuts a new release tag.

class Confium < Formula
  desc "Threshold-native trust infrastructure — CLI"
  homepage "https://www.confium.org/"
  url "https://github.com/confium/confium/archive/refs/tags/v0.7.0.tar.gz"
  # SHA-256 of the tarball above. PLACEHOLDER until the auto-bump workflow runs.
  sha256 "19bb87878d84b7dbb8073a8f92348d1bcb04b02ba27daa2f2eef193d3cc9764a"
  license "BSD-2-Clause"
  head "https://github.com/confium/confium.git", branch: "main"

  # Confium requires Rust edition 2024 (Rust 1.85+).
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/confium-cli")
  end

  test do
    # `--version` prints `confium <semver>` (the about string is --help text).
    assert_match(/^confium \d+\.\d+\.\d+/, shell_output("#{bin}/confium --version"))
  end
end
