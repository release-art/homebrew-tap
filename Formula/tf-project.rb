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
      url "https://github.com/release-art/tf-project/releases/download/v0.3.1/tf-project-0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "8c36e0640d2c182d4127a16ab78e88a628ca594d1bbb3792ad1f28e681da45aa"
    end
    on_intel do
      url "https://github.com/release-art/tf-project/releases/download/v0.3.1/tf-project-0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "f948a9ba3db7ebc67773174a24542e08557868fb21e2862ac09e00ab5439a3ad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/release-art/tf-project/releases/download/v0.3.1/tf-project-0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a2ef7ae9025a27fb68d9c9ff2279adace079e3c5946f27756c6f77d8104fa39a"
    end
    on_arm do
      url "https://github.com/release-art/tf-project/releases/download/v0.3.1/tf-project-0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f08f6434493f7bed6b82d92af2810d7f6db209c529c136dca1e91c53fdf599d4"
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
