From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL] Samsung fixes for v3.19
Date: Mon, 12 Jan 2015 17:26:56 +0900
Message-ID: <54B38550.6010707@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:60462 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751537AbbALI1D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Jan 2015 03:27:03 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof, Kevin

Please pull samsung fixes for v3.19.

Thanks,
Kukjin

The following changes since commit 97bf6af1f928216fd6c5a66e8a57bfa95a659672:

  Linux 3.19-rc1 (2014-12-20 17:08:50 -0800)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
v3.19-samsung-fixes

Andreas Faerber (1):
      ARM: exynos_defconfig: Enable LM90 driver

Javier Martinez Canillas (1):
      ARM: exynos_defconfig: Enable options for display panel support

Vivek Gautam (1):
      arm: dts: Use pmu_system_controller phandle for dp phy

 arch/arm/boot/dts/exynos5250.dtsi |    2 +-
 arch/arm/boot/dts/exynos5420.dtsi |    4 ++--
 arch/arm/configs/exynos_defconfig |   18 +++++++++++++++++-
 3 files changed, 20 insertions(+), 4 deletions(-)
