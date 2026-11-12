class Perch < Formula
  desc "Interactive Git branch and worktree switcher with merged-branch cleanup"
  homepage "https://github.com/brzzdev/perch"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/brzzdev/perch/releases/download/v2.9.1/perch-aarch64-apple-darwin.tar.gz"
      sha256 "a3cc5b093fad6dc260f7bb44057e4cde4ce43fae088d8e2a4e5f0855465a9acf"
    end
    on_intel do
      url "https://github.com/brzzdev/perch/releases/download/v2.9.1/perch-x86_64-apple-darwin.tar.gz"
      sha256 "e37f3a5e11d4dee6a89cc918a8bbbb93babbc6142dff1ab3ad4a15da2bad3315"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/brzzdev/perch/releases/download/v2.9.1/perch-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a8fe6f7f8398897ea0758128e355c8d67142f50a85dccb90ba410a3880e762b1"
    end
    on_intel do
      url "https://github.com/brzzdev/perch/releases/download/v2.9.1/perch-x86_64-unknown-linux-musl.tar.gz"
      sha256 "babf04fd3748cbd3d13f01f41e97c4e53f58197d258f265a9476944eb8063352"
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
