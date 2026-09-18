# taskman is a private repo, so there is no downloadable release tarball.
# HEAD-only over SSH: works on any machine whose key can read the repo.
#   brew install --HEAD codyaverett/tap/taskman
class Taskman < Formula
  desc "Memory-first process manager for macOS with group kill"
  homepage "https://github.com/codyaverett/taskman"
  license "MIT"
  head "git@github.com:codyaverett/taskman.git", branch: "main", using: :git

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "taskman", shell_output("#{bin}/taskman --version")
  end
end
