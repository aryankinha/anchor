class Anchorctl < Formula
  include Language::Python::Virtualenv

  desc "Zero-downtime deployment orchestrator — Terraform-style Blue/Green deploys with automated rollback"
  homepage "https://github.com/aryankinha/anchor"
  url "https://github.com/aryankinha/anchor/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "af1e17a11087f4d886b8e880e54c22a046599960898374186dc786d19b4bafa4"
  license "MIT"

  depends_on "python@3.11"

  def install
    venv = virtualenv_create(libexec, "python3.11")
    venv.pip_install_and_link buildpath
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anchorctl --version")
  end
end
