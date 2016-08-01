From: Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v2 0/2] Fix arch timer trigger
Date: Mon,  1 Aug 2016 10:54:14 +0100
Message-ID: <1470045256-9032-1-git-send-email-marc.zyngier@arm.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, arm@kernel.org
Cc: Mark Rutland <marc.rutland@arm.com>, Jon Hunter <jonathanh@nvidia.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Duc Dang <dhdang@apm.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Kukjin Kim <kgene@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Simek <michal.simek@xilinx.com>, soren.brinkmann@xilinx.com, Tirumalesh Chalamarla <tchalamarla@cavium.com>, Jan Glauber <jglauber@cavium.com>, Hou Zhiqiang <B48286@freescale.com>, Wenbin Song <Wenbin.Song@freescale.com>, Yuan Yao <yao.yuan@nxp.com>, Liu Gang <Gang.Liu@nxp.com>, Ming
List-Id: linux-samsung-soc@vger.kernel.org

Recent fixes in the IRQ layer (properly propagating the trigger
settings in the interrupt controler instead of silently failing)
uncovered a number of cases where DTs are describing the timer trigger
wrong (edge, while the interrupt is definitely level).

The result is a kernel that doesn't boot anymore (forever waiting for
an interrupt that can't trigger) or behave erratically (missing
interrupts).

This very small series addresses the issue in two ways:
(1) enforcing level triggered in the driver and spitting out a nastygram
so that the user can find out about the issue
(2) fix the existing issue by repainting the broken device trees.

(1) makes sure that a new kernel can run with an old DT, and (2)
addresses the issue properly.

Note that the two patches can be applied independently.

Tested on APM Mustang, which is one of the broken platforms.

Thanks,

	M.

* From v1:
  - Make GICv3-based platforms use the level triggered setting even if
  the HW actually precisly describes high or low settings.
  - Rebased on top of linux/master as of today.

Marc Zyngier (2):
  clocksource/arm_arch_timer: Force per-CPU interrupt to be
    level-triggered
  arm64: dts: Fix broken architected timer interrupt trigger

 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |  8 +++----
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  8 +++----
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |  8 +++----
 arch/arm64/boot/dts/broadcom/ns2.dtsi              |  8 +++----
 arch/arm64/boot/dts/cavium/thunder-88xx.dtsi       |  8 +++----
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  8 +++----
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  8 +++----
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     |  8 +++----
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi      |  8 +++----
 .../boot/dts/socionext/uniphier-ph1-ld20.dtsi      |  8 +++----
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi             |  8 +++----
 drivers/clocksource/arm_arch_timer.c               | 26 +++++++++++++++++++---
 12 files changed, 67 insertions(+), 47 deletions(-)

-- 
2.1.4
