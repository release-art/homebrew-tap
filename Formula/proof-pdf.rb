class ProofPdf < Formula
  desc "Verify print PDFs against PDF/X and prepress checks"
  homepage "https://github.com/release-art/proofpress"
  license "Apache-2.0"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/release-art/proofpress/releases/download/v0.4.0/proof-pdf-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "89ceff8447b92582cb6a3179a1151f403de379370762194db17a294a8eb379b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/release-art/proofpress/releases/download/v0.4.0/proof-pdf-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c95b029ef235ee4d23a0060d70c31810d9865233fc858311b328a1a12246ba76"
    end
    on_arm do
      url "https://github.com/release-art/proofpress/releases/download/v0.4.0/proof-pdf-0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "77960a39a525796561c64732305cf2930a755b498d5fd819cc1487c03c6430c6"
    end
  end

  def install
    bin.install "proof-pdf"
  end

  test do
    assert_equal "proof-pdf #{version}", shell_output("#{bin}/proof-pdf --version").strip
    (testpath/"empty.pdf").write ""
    shell_output("#{bin}/proof-pdf verify #{testpath}/empty.pdf", 2)
  end
end
