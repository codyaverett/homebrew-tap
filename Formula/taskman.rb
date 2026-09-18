class Taskman < Formula
  desc "Memory-first process manager for macOS with group kill"
  homepage "https://github.com/codyaverett/taskman"
  url "https://github.com/codyaverett/taskman/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "424806f65e84d8424aa24b04d6b2be6072491661b3e1259c3b61d1112600ed92"
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
