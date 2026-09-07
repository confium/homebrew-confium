# Homebrew formula for confium-signerd (threshold signing daemon).
#
# Usage:
#   brew tap confium/confium
#   brew install confium-signerd
#   confium-signerd --help

class ConfiumSignerd < Formula
  desc "Confium threshold signing daemon"
  homepage "https://www.confium.org/threshold/"
  url "https://github.com/confium/confium/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "19bb87878d84b7dbb8073a8f92348d1bcb04b02ba27daa2f2eef193d3cc9764a"
  license "BSD-2-Clause"
  head "https://github.com/confium/confium.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/confium-signerd")
  end

  test do
    # clap prints "Usage:" (capital U) in --help.
    assert_match(/Usage:/, shell_output("#{bin}/confium-signerd --help"))
  end
end
