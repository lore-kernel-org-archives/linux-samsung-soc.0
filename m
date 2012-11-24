From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 00/12] clk: exynos4: migrate to common clock framework
Date: Sun, 25 Nov 2012 02:47:53 +0530
Message-ID: <1353791885-2566-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:37092 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752285Ab2KXVS3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 24 Nov 2012 16:18:29 -0500
Received: by mail-da0-f46.google.com with SMTP id p5so3117661dak.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 24 Nov 2012 13:18:28 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, mturquette@ti.com, mturquette@linaro.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com

Changes since v3:
- Includes changes suggested by Tomasz Figa <tomasz.figa@gmail.com>

This patch series migrates the Samsung Exynos4 SoC clock code to adopt the
common clock framework. The use of Samsung specific clock structures has
been removed and all board support code has been updated. imx-style of
clock registration and lookup has been adopted for device tree based
exynos4 platforms.

This patch series is based on the for-next branch of Samsung maintainer's
tree with all patches merged from clk-next branch of Mike's tree. This
series has been tested on Exynos4210 based Origen board and Exynos4412
based smdk board.

Thomas Abraham (12):
  clk: samsung: add common clock framework helper functions for Samsung platforms
  clk: samsung: add pll clock registration helper functions
  clk: exynos4: register clocks using common clock framework
  ARM: Exynos: Rework timer initialization sequence
  ARM: Exynos4: Migrate clock support to common clock framework
  ARM: dts: add exynos4 clock controller nodes
  ARM: dts: add xxti and xusbxti fixed rate clock nodes for exynos4 based platforms
  ARM: Exynos4: allow legacy board support to specify xxti and xusbxti clock speed
  ARM: dts: add clock provider information for all controllers in Exynos4 SoC
  ARM: Exynos4: remove auxdata table from machine file
  ARM: Exynos: use fin_pll clock as the tick clock source for mct
  ARM: Exynos: add support for mct clock setup

 .../devicetree/bindings/clock/exynos4-clock.txt    |  215 +++
 arch/arm/boot/dts/exynos4.dtsi                     |   48 +
 arch/arm/boot/dts/exynos4210-origen.dts            |   12 +
 arch/arm/boot/dts/exynos4210-smdkv310.dts          |   12 +
 arch/arm/boot/dts/exynos4210.dtsi                  |    6 +
 arch/arm/boot/dts/exynos4412-smdk4412.dts          |   12 +
 arch/arm/boot/dts/exynos4x12.dtsi                  |    6 +
 arch/arm/mach-exynos/Kconfig                       |    1 +
 arch/arm/mach-exynos/Makefile                      |    3 -
 arch/arm/mach-exynos/clock-exynos4.c               | 1602 --------------------
 arch/arm/mach-exynos/clock-exynos4.h               |   35 -
 arch/arm/mach-exynos/clock-exynos4210.c            |  188 ---
 arch/arm/mach-exynos/clock-exynos4212.c            |  192 ---
 arch/arm/mach-exynos/common.c                      |   57 +-
 arch/arm/mach-exynos/common.h                      |   21 +-
 arch/arm/mach-exynos/mach-armlex4210.c             |    3 +-
 arch/arm/mach-exynos/mach-exynos4-dt.c             |   71 +-
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 +-
 arch/arm/mach-exynos/mach-nuri.c                   |    5 +-
 arch/arm/mach-exynos/mach-origen.c                 |    5 +-
 arch/arm/mach-exynos/mach-smdk4x12.c               |    5 +-
 arch/arm/mach-exynos/mach-smdkv310.c               |    7 +-
 arch/arm/mach-exynos/mach-universal_c210.c         |    3 +-
 arch/arm/mach-exynos/mct.c                         |   32 +-
 arch/arm/plat-samsung/Kconfig                      |    4 +-
 drivers/clk/Makefile                               |    1 +
 drivers/clk/samsung/Makefile                       |    6 +
 drivers/clk/samsung/clk-exynos4.c                  |  655 ++++++++
 drivers/clk/samsung/clk-pll.c                      |  400 +++++
 drivers/clk/samsung/clk-pll.h                      |   38 +
 drivers/clk/samsung/clk.c                          |  180 +++
 drivers/clk/samsung/clk.h                          |  216 +++
 32 files changed, 1905 insertions(+), 2138 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt
 delete mode 100644 arch/arm/mach-exynos/clock-exynos4.c
 delete mode 100644 arch/arm/mach-exynos/clock-exynos4.h
 delete mode 100644 arch/arm/mach-exynos/clock-exynos4210.c
 delete mode 100644 arch/arm/mach-exynos/clock-exynos4212.c
 create mode 100644 drivers/clk/samsung/Makefile
 create mode 100644 drivers/clk/samsung/clk-exynos4.c
 create mode 100644 drivers/clk/samsung/clk-pll.c
 create mode 100644 drivers/clk/samsung/clk-pll.h
 create mode 100644 drivers/clk/samsung/clk.c
 create mode 100644 drivers/clk/samsung/clk.h

-- 
1.7.4.4
