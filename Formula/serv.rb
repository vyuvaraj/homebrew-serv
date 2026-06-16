class Serv < Formula
  desc "Programming language for backend services, schedulers, and APIs"
  homepage "https://github.com/vyuvaraj/Serv-lang"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/vyuvaraj/Serv-lang/releases/download/v0.1.0/serv-darwin-arm64.tar.gz"
      sha256 "03280fa7be4915081c1199016dee22bf9531ffa881829c53fe098d4565fb6f45"
    else
      url "https://github.com/vyuvaraj/Serv-lang/releases/download/v0.1.0/serv-darwin-amd64.tar.gz"
      sha256 "cea92c24515db65fca995ee2a2d6c665c8c110b6ab3c5feb0c4f8d97ec1c3e84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/vyuvaraj/Serv-lang/releases/download/v0.1.0/serv-linux-arm64.tar.gz"
      sha256 "98368b9a828c95b2f562c54cf5e7015bb5613d807aade1570ba35f2ee066e09a"
    else
      url "https://github.com/vyuvaraj/Serv-lang/releases/download/v0.1.0/serv-linux-amd64.tar.gz"
      sha256 "b4e0b0f0273573ecd298d4dbaa4a25729dcab16da2ab533ec1c8e72b3ffc82c4"
    end
  end

  depends_on "go" => :build

  def install
    bin.install "serv"
    bin.install "serv-lsp"
    prefix.install "runtime"
    prefix.install "stdlib"
    prefix.install "go.mod"
    prefix.install "go.sum"

    # Set SERV_HOME so the compiler can find runtime/ and stdlib/
    ENV["SERV_HOME"] = prefix.to_s
  end

  def caveats
    <<~EOS
      To use Serv, set SERV_HOME in your shell profile:
        export SERV_HOME=#{prefix}

      Quick start:
        serv init myapp
        cd myapp
        serv run main.srv --watch
    EOS
  end

  test do
    (testpath/"hello.srv").write <<~EOS
      fn add(a: int, b: int) -> int {
          return a + b
      }

      test "addition" {
          assert add(2, 3) == 5
      }
    EOS
    ENV["SERV_HOME"] = prefix.to_s
    system bin/"serv", "build", "hello.srv", "-o", "hello"
    assert_predicate testpath/"hello", :exist?
  end
end
