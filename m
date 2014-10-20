From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 0/5] Support new Exynos4415 SoC based on Cortex-A9 quad cores
Date: Mon, 20 Oct 2014 12:29:04 +0900
Message-ID: <1413775749-17539-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:14608 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751569AbaJTD3R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 19 Oct 2014 23:29:17 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk, mark.rutland@arm.com, arnd@arndb.de, olof@lixom.net, tomasz.figa@gmail.com, mturquette@linaro.org, thomas.abraham@linaro.org, linus.walleij@linaro.org, sw0312.kim@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com, geunsik.lim@samsung.com, jh80.chung@samsung.com, cw00.choi@samsung.com, jaewon02.kim@samsung.com, ideal.song@samsung.com, yj44.cho@samsung.com

This patchset support new Exynos4415 Samsung SoC based on Cortex-A9 quad cores.
Exynos4415 is a System-On-Chip (SoC) that is based on 32-bit RISC processor
for Smartphone. It is desigend with the 28nm low-power high-K metal gate process
and provides the best performance features.

This patchset include some patches such as:
- Support booting of Exynos4415
- Supoort uart/mct/adc/gic/i2c/spi/power-domain/pmu/mshc/ehci/ohci/pwm/amba
- Support the clock controller for Exynos4415 using common clk framework
- Support the gpio control for Exynos4415 using pinctrl subsystem

Chanwoo Choi (4):
  ARM: EXYNOS: Add EXYNOS4415 SoC ID
  clk: samsung: exynos4415: Add clocks using common clock framework
  clk: samsung: Document binding for Exynos4415 clock controller
  ARM: dts: Add dts files for Exynos4415 SoC

Tomasz Figa (1):
  pinctrl: exynos: Add support for Exynos4415

 .../devicetree/bindings/clock/exynos4415-clock.txt |   49 +
 arch/arm/boot/dts/exynos4415-pinctrl.dtsi          |  613 +++++++++++
 arch/arm/boot/dts/exynos4415.dtsi                  |  627 +++++++++++
 arch/arm/mach-exynos/Kconfig                       |    5 +
 arch/arm/mach-exynos/common.h                      |    8 +
 arch/arm/mach-exynos/exynos.c                      |    2 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos4415.c               | 1133 ++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.c           |   78 ++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |    2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |    1 +
 include/dt-bindings/clock/exynos4415.h             |  360 +++++++
 12 files changed, 2879 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos4415-clock.txt
 create mode 100644 arch/arm/boot/dts/exynos4415-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/exynos4415.dtsi
 create mode 100644 drivers/clk/samsung/clk-exynos4415.c
 create mode 100644 include/dt-bindings/clock/exynos4415.h

-- 
1.8.0
