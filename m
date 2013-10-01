From: Vyacheslav Tyrtov <v.tyrtov@samsung.com>
Subject: [PATCH 0/6] Exynos 5410 Dual cluster support
Date: Tue, 01 Oct 2013 20:17:01 +0400
Message-ID: <1380644227-12244-1-git-send-email-v.tyrtov@samsung.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Mike Turquette <mturquette@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Heiko Stuebner <heiko@sntech.de>, Naour Romain <romain.naour@openwide.fr>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@samsung.com>, Tyrtov Vyacheslav <v.tyrtov@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The series of patches represent support of Exynos 5410 SoC
    
The Exynos 5410 is the first Samsung SoC based on bigLITTLE architecture.
Patches allow all 8 CPU cores (4 x A7 and 4 x A15) to run at the same time
    
Patches add new platform description, support of clock controller,
dual cluster support, device tree for Exynos 5410 and minor fixes (CCI, MCT)
   
Has been builded on v3.12-rc3.
Has been tested on Exynos 5410 reference board (smdk5410_defconfig).
    
Thanks,
	Vyacheslav.

Tarek Dakhran (6):
  ARM: EXYNOS: Add support for EXYNOS5410 SoC
  clk: exynos5410: register clocks using common clock framework
  ARM: EXYNOS: add Exynos Dual Cluster Support
  ARM: dts: Add initial device tree support for EXYNOS5410
  ARM: EXYNOS: Minor fixes to enable EXYNOS5410 support
  ARM: smdk5410_defconfig: add defconfig for smdk5410

 .../devicetree/bindings/clock/exynos5410-clock.txt |  72 ++++++
 arch/arm/Kconfig                                   |   2 +-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/exynos5410-smdk5410.dts          |  67 +++++
 arch/arm/boot/dts/exynos5410.dtsi                  | 189 ++++++++++++++
 arch/arm/configs/smdk5410_defconfig                | 134 ++++++++++
 arch/arm/mach-exynos/Kconfig                       |  10 +
 arch/arm/mach-exynos/Makefile                      |   2 +
 arch/arm/mach-exynos/common.c                      |  18 ++
 arch/arm/mach-exynos/edcs.c                        | 217 ++++++++++++++++
 arch/arm/mach-exynos/edcs.h                        |  41 +++
 arch/arm/mach-exynos/edcs_status.c                 | 110 +++++++++
 arch/arm/mach-exynos/include/mach/map.h            |   1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |   1 +
 arch/arm/plat-samsung/include/plat/cpu.h           |   8 +
 drivers/bus/arm-cci.c                              |   7 +
 drivers/clk/samsung/Makefile                       |   1 +
 drivers/clk/samsung/clk-exynos5410.c               | 274 +++++++++++++++++++++
 drivers/clocksource/exynos_mct.c                   |   8 +-
 drivers/irqchip/exynos-combiner.c                  |  12 +-
 20 files changed, 1172 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos5410-clock.txt
 create mode 100644 arch/arm/boot/dts/exynos5410-smdk5410.dts
 create mode 100644 arch/arm/boot/dts/exynos5410.dtsi
 create mode 100644 arch/arm/configs/smdk5410_defconfig
 create mode 100644 arch/arm/mach-exynos/edcs.c
 create mode 100644 arch/arm/mach-exynos/edcs.h
 create mode 100644 arch/arm/mach-exynos/edcs_status.c
 create mode 100644 drivers/clk/samsung/clk-exynos5410.c

-- 
1.8.1.5

