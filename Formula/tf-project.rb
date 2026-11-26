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
      url "https://github.com/release-art/tf-project/releases/download/v0.3.2/tf-project-0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "a0946480968009e160b9fcf0030d74e442c1f18bb65bc2a3b12ee4466998591b"
    end
    on_intel do
      url "https://github.com/release-art/tf-project/releases/download/v0.3.2/tf-project-0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "12d9b2643c675d6a10f1813c92cc75f26756bee8ab24e743f027c0fd451a82f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/release-art/tf-project/releases/download/v0.3.2/tf-project-0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6fe74373a3a902204b6f022b3f8511f749d2d546ebbfd8bbb46b4084bf79ff95"
    end
    on_arm do
      url "https://github.com/release-art/tf-project/releases/download/v0.3.2/tf-project-0.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0d71ceab1012aef644338a71571a3ffea474e888b1d1094c286b6d2ba3558b0"
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
