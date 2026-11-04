class Swe < Formula
  include Language::Python::Virtualenv

  desc "Manage AI coding CLIs, their sessions, usage and rate limits"
  homepage "https://github.com/c-wenlong/swe"
  url "https://github.com/c-wenlong/swe/releases/download/v1.2.2/swe-1.2.2-py3-none-any.whl",
      using: :nounzip
  sha256 "36b97aeb986dbf86168481f4b2ab3dc0620f3adcf8b5063973619f2ab19922fa"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "python@3.14"

  def install
    # The release wheel is pure Python with no dependencies, so it goes
    # straight into the virtualenv: no build backend, no resources.
    venv = virtualenv_create(libexec, "python3.14")
    venv.pip_install_and_link buildpath/"swe-#{version}-py3-none-any.whl"
  end

  test do
    assert_match "swe #{version}", shell_output("#{bin}/swe --version")
  end
end
