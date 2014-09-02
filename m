From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH v2 0/7] arch: arm64: enable support for Samsung Exynos7 SoC
Date: Tue, 02 Sep 2014 21:05:36 +0530
Message-ID: <1409672143-8574-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23727 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751735AbaIBPky (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Sep 2014 11:40:54 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: naveenkrishna.ch@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, t.figa@samsung.com, kgene.kim@samsung.com

Changes since v1:
- Reduced the number of features targetted for the initial platform support.

This patchset supports new Exynos7 Samsung SoC based on Cortex-A57.
Exynos7 is a System-On-Chip (SoC) that is based on 64-bit
ARMv8 RISC processor.

NOTE:
We tested these patches with the 
"arm64: dts: add <dt-bindings/> symlink" change posted @
https://lkml.org/lkml/2014/9/1/688

The following patches are tested based on Kgene's for-next tree.
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next

The following patches are required for this series.
1- "irqchip: exynos-combiner: Fix compilation error on ARM64"
   https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg36209.html
2- "tty/serial: fix config dependencies for samsung serial"
   https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg36208.html

Alim Akhtar (1):
  arm64: exynos7: Enable ARMv8 based Exynos7 (SoC) support

Naveen Krishna Chatradhi (6):
  clk: samsung: add support for 145xx and 1460x PLLs
  clk: samsung: Factor out the common code to clk.c
  clk: samsung: Add fixed_factor_clocks field to struct exynos_cmu_info
  clk: samsung: add initial clock support for Exynos7 SoC
  tty/serial: samsung: enable usage for 64-bit Exynos platforms
  arm64: dts: Add initial device tree support for EXYNOS7

 .../devicetree/bindings/clock/exynos7-clock.txt    |   37 ++
 arch/arm64/Kconfig                                 |   12 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |   31 ++
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  168 ++++++++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos5260.c               |  183 ++------
 drivers/clk/samsung/clk-exynos7.c                  |  438 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   25 +-
 drivers/clk/samsung/clk-pll.h                      |    4 +
 drivers/clk/samsung/clk.c                          |   98 +++++
 drivers/clk/samsung/clk.h                          |   37 ++
 drivers/tty/serial/Kconfig                         |    2 +-
 include/dt-bindings/clock/exynos7-clk.h            |   55 +++
 14 files changed, 929 insertions(+), 163 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos7-clock.txt
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7-espresso.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7.dtsi
 create mode 100644 drivers/clk/samsung/clk-exynos7.c
 create mode 100644 include/dt-bindings/clock/exynos7-clk.h

-- 
1.7.9.5
