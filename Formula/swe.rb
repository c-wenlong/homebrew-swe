class Swe < Formula
  include Language::Python::Virtualenv

  desc "Manage AI coding CLIs, their sessions, usage and rate limits"
  homepage "https://github.com/c-wenlong/quiver"
  url "https://github.com/c-wenlong/quiver/releases/download/v1.1.1/quiver-1.1.1-py3-none-any.whl",
      using: :nounzip
  sha256 "63be610f2c433bafdb7f00c352cc6acbf5f5502bbc6932a63572c9cb0b40dc55"
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
    venv.pip_install_and_link buildpath/"quiver-#{version}-py3-none-any.whl"
  end

  test do
    assert_match "swe #{version}", shell_output("#{bin}/swe --version")
  end
end
