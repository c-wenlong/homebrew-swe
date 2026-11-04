class Swe < Formula
  include Language::Python::Virtualenv

  desc "Manage AI coding CLIs, their sessions, usage and rate limits"
  homepage "https://github.com/c-wenlong/swe"
  url "https://github.com/c-wenlong/swe/releases/download/v1.2.1/swe-1.2.1-py3-none-any.whl",
      using: :nounzip
  sha256 "9ed761b22dc5a7fca7576396ad4ba1e07018e9c99e08c9d0dfb7dcb42d706d05"
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
