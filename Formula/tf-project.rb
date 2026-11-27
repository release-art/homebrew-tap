class TfProject < Formula
  desc "Terraform/OpenTofu wrapper with one slot per tfvars environment"
  homepage "https://github.com/release-art/tf-project"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/release-art/tf-project/releases/download/v0.4.0/tf-project-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "a7e77f54b5302cfced90199c75585e26284b5d3550acdf01668b0c7c1bf8155b"
    end
    on_intel do
      url "https://github.com/release-art/tf-project/releases/download/v0.4.0/tf-project-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "5ae820cb1891bd74f37a37e664fd2a72b7b7ddf8c13086da4509bcf7eb0e737a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/release-art/tf-project/releases/download/v0.4.0/tf-project-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6af112aa2a4bd3189edbe2040f383472fe5ec6c7a9eda21a14082771b4d246c3"
    end
    on_arm do
      url "https://github.com/release-art/tf-project/releases/download/v0.4.0/tf-project-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dbad5d56f069b7c60b829a6d7ee0779c3f8f3ee9bbc486d4d901005416dfcde0"
    end
  end

  def install
    bin.install "tf-project", "tfp"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/tfp --version").strip
    assert_match "Could not find tf_project.toml", shell_output("#{bin}/tfp status 2>&1", 1)
  end
end
