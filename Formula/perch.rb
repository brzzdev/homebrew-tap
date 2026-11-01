class Perch < Formula
  desc "Interactive Git branch and worktree switcher with merged-branch cleanup"
  homepage "https://github.com/brzzdev/perch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brzzdev/perch/releases/download/v2.8.0/perch-aarch64-apple-darwin.tar.gz"
      sha256 "79658d1d57206d74babc8a91e4a987005ce4f886f8a207ed1f0696f7be0f389d"
    end
    on_intel do
      url "https://github.com/brzzdev/perch/releases/download/v2.8.0/perch-x86_64-apple-darwin.tar.gz"
      sha256 "79de513659c31d43b3a9efba2ca1253f1f6465cd3dd4e4fded6cf3b78a704ba2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brzzdev/perch/releases/download/v2.8.0/perch-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7b924b46017fc67f2e3576c2f8b2cb6fb90cca8e7f249a6e0766b6192dd2c271"
    end
    on_intel do
      url "https://github.com/brzzdev/perch/releases/download/v2.8.0/perch-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d72aa51b33aabfc4149eff9ba74ba7b56a10e4b1e0edf090ce5421c81d45fbf0"
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
