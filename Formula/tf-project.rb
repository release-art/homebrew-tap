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
      url "https://github.com/release-art/tf-project/releases/download/v0.3.0/tf-project-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "bb6ed8eec9651daed0509fdc24bf0d2edbcc82cb187d12abd600942673304a18"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/release-art/tf-project/releases/download/v0.3.0/tf-project-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "713a2bd516c1063d084d84e7abca4e0c9cab5083680783d91284d53e9c47ca81"
    end
    on_arm do
      url "https://github.com/release-art/tf-project/releases/download/v0.3.0/tf-project-0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a33d84177ddfd26c9ffc6a54f868dd9d09d3fe3915ef54f72652a393ea5d72a0"
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
