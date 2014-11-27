From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL 4/4] Samsung exynos7 updates for v3.19
Date: Thu, 27 Nov 2014 16:06:48 +0900
Message-ID: <5476CD88.1030406@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.19.201]:36333 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751005AbaK0HGx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Nov 2014 02:06:53 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 3b1f6f3450b6a64aead53d09fc6f8bba2999c450:

  Merge remote-tracking branch 'arm-soc/cleanup/dts-subdirs' into
v3.19-next/dt-samsung-64 (2014-11-26 16:02:13 +0900)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-dt-64

for you to fetch changes up to ab93f6ca63943d6eca9494547127fe1c337c1d83:

  arm64: Enable ARMv8 based exynos7 SoC support (2014-11-27 02:14:00 +0900)

----------------------------------------------------------------
Samsung arch/arm64 DT updates for v3.19

- to support ARMv8 based exynos7 SoC
  : add initial device tree and add pinctrl, PMU, mmc, i2c, rtc,
    watchdog, and adc nodes for exynos7 SoC and exynos7 based
    espresso board.

NOTE that this is including following dependencies
: cleanup/dts-subdirs in arm-soc for arm64 vendor support
: tags/samsung-driver for samsung serial
: for-v3.19/exynos-clk in samsung-clk tree for exynos7 clk

One more NOTE, for support exynos7 we need Liviu's "arm64: Create
link to include/dt-bindings to enable C preprocessor use" in arm-soc
tree and arm64 defconfig update should be handled directly.

----------------------------------------------------------------
Abhilash Kesavan (2):
      arm64: dts: Add PMU DT node for exynos7 SoC
      arm64: dts: Add nodes for mmc, i2c, rtc, watchdog, adc on exynos7

Alim Akhtar (1):
      arm64: Enable ARMv8 based exynos7 SoC support

Naveen Krishna Ch (2):
      arm64: dts: Add initial device tree support for exynos7
      arm64: dts: Add initial pinctrl support to exynos7

 .../devicetree/bindings/arm/samsung/pmu.txt        |   1 +
 arch/arm64/Kconfig                                 |  17 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   5 +
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |  84 +++
 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi    | 588
+++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi            | 530
+++++++++++++++++++
 7 files changed, 1226 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7-espresso.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7.dtsi
