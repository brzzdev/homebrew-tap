class Perch < Formula
  desc "Interactive Git branch and worktree switcher with merged-branch cleanup"
  homepage "https://github.com/brzzdev/perch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brzzdev/perch/releases/download/v2.9.0/perch-aarch64-apple-darwin.tar.gz"
      sha256 "1cb2048013c143683dda89ddd4f4fec0aaf4d07b44393b31cda5f1c43ae10e74"
    end
    on_intel do
      url "https://github.com/brzzdev/perch/releases/download/v2.9.0/perch-x86_64-apple-darwin.tar.gz"
      sha256 "b1c15eb5913cdd435864ce08db7925dd454e071a38dc0dbe5331423cced054a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brzzdev/perch/releases/download/v2.9.0/perch-aarch64-unknown-linux-musl.tar.gz"
      sha256 "6523e27b5d3c9a87f4eda887872179ae7b7951184994bc6ec28aca8b1b27a3ce"
    end
    on_intel do
      url "https://github.com/brzzdev/perch/releases/download/v2.9.0/perch-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c4af0aa4c9bd8136604cb6095f42c5d9b9286ba217f8471f44fbc3f5e8fbb268"
    end
  end

  def install
    bin.install "perch"
    bash_completion.install "completions/perch.bash" => "perch"
    fish_completion.install "completions/perch.fish"
    zsh_completion.install "completions/_perch"
  end

  def caveats
    <<~EOS
      perch needs its shell integration to cd into worktrees. Load it with:
        perch shell install
    EOS
  end

  test do
    assert_match "perch #{version}", shell_output("#{bin}/perch --version")
  end
end
