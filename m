From: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Subject: [PATCH v4 0/8] arch: arm64: enable support for Samsung Exynos7 SoC
Date: Fri, 12 Sep 2014 20:56:23 +0530
Message-ID: <1410535592-5782-1-git-send-email-ch.naveen@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54170 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751445AbaILPbx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Sep 2014 11:31:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: naveenkrishna.ch@gmail.com, linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, tomasz.figa@gmail.com, kgene.kim@samsung.com, gregkh@linuxfoundation.org

Changes since v3:
- Removed aliases for serial controllers from dtsi file and moved it
  into board specific dts file as suggested by Arnd.
- Based this series on Robert Richter's patches for adding vendor
  device tree sub-directories for arm64.
  http://comments.gmane.org/gmane.linux.kbuild.devel/12131

This patchset supports new Exynos7 Samsung SoC based on Cortex-A57.
Exynos7 is a System-On-Chip (SoC) that is based on 64-bit
ARMv8 RISC processor.

The following patches are tested based on Kgene's for-next tree.
https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/log/?h=for-next

The following patches are required for this series.
1- "tty/serial: fix config dependencies for samsung serial"
   https://www.mail-archive.com/linux-samsung-soc@vger.kernel.org/msg36208.html
2- "dts, kbuild: Implement support for dtb vendor subdirs" patch set 
   http://comments.gmane.org/gmane.linux.kbuild.devel/12131

Alim Akhtar (1):
  arm64: exynos7: Enable ARMv8 based Exynos7 (SoC) support

Naveen Krishna Chatradhi (6):
  clk: samsung: add support for 145xx and 1460x PLLs
  clk: samsung: Factor out the common code to clk.c
  clk: samsung: Add fixed_factor_clocks field to struct exynos_cmu_info
  clk: samsung: add initial clock support for Exynos7 SoC
  arm64: dts: Add initial device tree support for EXYNOS7
  tty/serial: samsung: enable usage for 64-bit Exynos platforms

Pankaj Dubey (1):
  arm64: dts: add <dt-bindings/> symlink

 .../devicetree/bindings/clock/exynos7-clock.txt    |   37 ++
 arch/arm64/Kconfig                                 |   12 +
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/exynos/Makefile                |    5 +
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |   39 ++
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  160 ++++++++
 arch/arm64/boot/dts/include/dt-bindings            |    1 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos5260.c               |  185 ++-------
 drivers/clk/samsung/clk-exynos7.c                  |  417 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   25 +-
 drivers/clk/samsung/clk-pll.h                      |    4 +
 drivers/clk/samsung/clk.c                          |   98 +++++
 drivers/clk/samsung/clk.h                          |   37 ++
 drivers/tty/serial/Kconfig                         |    2 +-
 include/dt-bindings/clock/exynos7-clk.h            |   39 ++
 16 files changed, 898 insertions(+), 165 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos7-clock.txt
 create mode 100644 arch/arm64/boot/dts/exynos/Makefile
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7-espresso.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7.dtsi
 create mode 120000 arch/arm64/boot/dts/include/dt-bindings
 create mode 100644 drivers/clk/samsung/clk-exynos7.c
 create mode 100644 include/dt-bindings/clock/exynos7-clk.h
