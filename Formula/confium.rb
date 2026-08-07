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
  url "https://github.com/confium/confium/archive/refs/tags/v0.3.1.tar.gz"
  # SHA-256 of the tarball above. Auto-bumped by the release workflow.
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "BSD-2-Clause"
  head "https://github.com/confium/confium.git", branch: "main"

  # Confium requires Rust edition 2024 (Rust 1.85+).
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/confium-cli")
  end

  test do
    assert_match "Confium trust store framework", shell_output("#{bin}/confium --version")
  end
end
