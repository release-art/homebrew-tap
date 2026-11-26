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
      url "https://github.com/release-art/tf-project/releases/download/v0.3.3/tf-project-0.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "807781ea1894b4eb0783cf5d4a9f0db1729d1c0eef87dbcfc085fdb2f45a23e9"
    end
    on_intel do
      url "https://github.com/release-art/tf-project/releases/download/v0.3.3/tf-project-0.3.3-x86_64-apple-darwin.tar.gz"
      sha256 "ffc25d2e8094a3254f02ed0f3d91da2fe0cad67d0f56e88ae177ee7d28e8e0b7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/release-art/tf-project/releases/download/v0.3.3/tf-project-0.3.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c05dd2bdcced461cd1b2494a1326cc7b1c9a0f3ee7f0747f6d05f1dcfc22773d"
    end
    on_arm do
      url "https://github.com/release-art/tf-project/releases/download/v0.3.3/tf-project-0.3.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ab09f3d5ec568092215ceb754bdabf49eed5204419a7bc1c545bfc1c4033703c"
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
