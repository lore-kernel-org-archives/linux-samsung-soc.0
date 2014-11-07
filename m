From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v6 0/7] Enable support for Samsung Exynos7 SoC
Date: Fri, 07 Nov 2014 10:50:48 +0530
Message-ID: <1415337655-31003-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34006 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751689AbaKGFVD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Nov 2014 00:21:03 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de, tomasz.figa@gmail.com, kesavan.abhilash@gmail.com

Exynos7 is a System-On-Chip that is based on 64-bit ARMv8 RISC processor
(Cortex-A57). This patchset adds arch/device tree support for Exynos7.

These were originally part of 2 patchsets[1][2] adding support for Exynos7.
The clock and pinctrl patches are going through the respective maintainer's
tree; hence the remaining dt related patches have been consolidated and are
being posted here as a separate series.

This patchset has build dependencies on the following patches:
a] "[GIT PULL] Samsung clock changes for 3.19" - specifically the clock dt
   bindings header.
   http://comments.gmane.org/gmane.linux.kernel.samsung-soc/39142
b] "tty: serial: samsung: Clean-up selection of number of available UARTs"
   http://www.spinics.net/lists/linux-samsung-soc/msg37418.html
c] "dts, kbuild: Implement support for dtb vendor subdirs"(merged in linux-next)
   https://lkml.org/lkml/2014/10/21/654

[1] arch: arm64: Enable support for Samsung Exynos7 SoC
http://www.spinics.net/lists/linux-samsung-soc/msg37047.html
[2] Add clock and DT support for a few IPs on Exynos7
http://www.spinics.net/lists/linux-samsung-soc/msg37973.html

Abhilash Kesavan (2):
  arm64: dts: Add PMU DT node for exynos7 SoC
  arm64: dts: Add nodes for mmc, i2c, rtc, watchdog, adc on Exynos7

Alim Akhtar (2):
  arm64: exynos7: Enable ARMv8 based Exynos7 (SoC) support
  arm64: Enable Exynos7 SOC in the defconfig

Naveen Krishna Ch (2):
  arm64: dts: Add initial device tree support for EXYNOS7
  arm64: dts: Add initial pinctrl support to EXYNOS7

Pankaj Dubey (1):
  arm64: dts: add <dt-bindings/> symlink

 .../devicetree/bindings/arm/samsung/pmu.txt        |    1 +
 arch/arm64/Kconfig                                 |   17 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/exynos/Makefile                |    5 +
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |   84 +++
 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi    |  588 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  530 ++++++++++++++++++
 arch/arm64/boot/dts/include/dt-bindings            |    1 +
 arch/arm64/configs/defconfig                       |    4 +
 9 files changed, 1231 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7-espresso.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7.dtsi
 create mode 120000 arch/arm64/boot/dts/include/dt-bindings

-- 
1.7.9.5
