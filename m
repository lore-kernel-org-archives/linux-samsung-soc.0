From: Tarek Dakhran <t.dakhran@samsung.com>
Subject: [PATCH v9 0/3] Exynos 5410 support
Date: Mon, 19 May 2014 07:37:17 +0400
Message-ID: <1400470640-30611-1-git-send-email-t.dakhran@samsung.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Rob Landley <rob@landley.net>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Ben Dooks <ben-linux@fluff.org>, Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, Vyacheslav Tyrtov <v.tyrtov@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, Romain Naour <romain.naour@openwide.fr>, Chander Kashyap <chander.kashyap@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tarek Dakhran <t.dakhran@gmail.com>, Tarek Dakhran <t.dakhran@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The series of patches represent support of Exynos 5410 SoC

The Exynos 5410 is the first Samsung SoC based on big.LITTLE architecture

Patches add new platform description, support of clock controller and device
tree for Exynos 5410.

Has been build on Samsung Linux Kernel
  (branch: for-next, commit: ccf5511 ARM: EXYNOS: Add MCPM call-back functions)
Has been tested on: 1) Exynos 5410 reference board (exynos_defconfig)
		    2) Odroid-XU board (exynos_defconfig)

Tarek.

Tarek Dakhran (3):
  ARM: EXYNOS: Add support for EXYNOS5410 SoC
  clk: exynos5410: register clocks using common clock framework
  ARM: dts: Add initial device tree support for EXYNOS5410

 .../devicetree/bindings/clock/exynos5410-clock.txt |   51 +++++
 arch/arm/boot/dts/Makefile                         |    1 +
 arch/arm/boot/dts/exynos5410-smdk5410.dts          |   65 ++++++
 arch/arm/boot/dts/exynos5410.dtsi                  |  158 ++++++++++++++
 arch/arm/mach-exynos/Kconfig                       |    8 +
 arch/arm/mach-exynos/exynos.c                      |    1 +
 arch/arm/mach-exynos/platsmp.c                     |    4 +
 arch/arm/plat-samsung/include/plat/cpu.h           |   11 +-
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos5410.c               |  223 ++++++++++++++++++++
 include/dt-bindings/clock/exynos5410.h             |   33 +++
 11 files changed, 555 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos5410-clock.txt
 create mode 100644 arch/arm/boot/dts/exynos5410-smdk5410.dts
 create mode 100644 arch/arm/boot/dts/exynos5410.dtsi
 create mode 100644 drivers/clk/samsung/clk-exynos5410.c
 create mode 100644 include/dt-bindings/clock/exynos5410.h

-- 
1.7.9.5

