# Homebrew formula for confium-signerd (threshold signing daemon).
#
# Usage:
#   brew tap confium/confium
#   brew install confium-signerd
#   confium-signerd --help

class ConfiumSignerd < Formula
  desc "Confium threshold signing daemon"
  homepage "https://www.confium.org/threshold/"
  url "https://github.com/confium/confium/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "BSD-2-Clause"
  head "https://github.com/confium/confium.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/confium-signerd")
  end

  test do
    assert_match "usage", shell_output("#{bin}/confium-signerd --help")
  end
end
