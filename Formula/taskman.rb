class Taskman < Formula
  desc "Memory-first process manager for macOS with group kill"
  homepage "https://github.com/codyaverett/taskman"
  url "https://github.com/codyaverett/taskman/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "MIT"
  head "https://github.com/codyaverett/taskman.git", branch: "main"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "taskman", shell_output("#{bin}/taskman --version 2>&1", 1)
  end
end
