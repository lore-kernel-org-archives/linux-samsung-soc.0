From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v4 0/6] Exynos Adaptive Supply Voltage support
Date: Tue, 10 Sep 2019 14:36:12 +0200
Message-ID: <20190910123618.27985-1-s.nawrocki@samsung.com>
References: <CGME20190910123632eucas1p2cf941da5f74b892288dd5a92ff9fa9fb@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org, vireshk@kernel.org
Cc: robh+dt@kernel.org, kgene@kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is fourth iteration of my patch series adding ASV (Adaptive Supply 
Voltage) support for Exynos SoCs. The previous one can be found at:
https://lkml.org/lkml/2019/8/13/808

Major change since v3 is a conversion to use dev_pm_opp_adjust_voltage(),
rather than removing and adding an OPP again. Hence the series now 
depends on patch [1].

I have included here a patch to address review comments
"opp: Handle target/min/max voltage in dev_pm_opp_adjust_voltage()",
which could be squashed with patch [1].

The CHIPID patches are dropped from the series as they have already 
been merged.

The patch set is based on for-next branch, 
git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git

Tested on Odroid XU3, XU3 Lite, XU4.

One of the things on TODO list is support for the Adaptive Body Bias.
This would require modifications on the cpufreq driver side in order 
to support multiple voltage regulators as well as changes in the OPP 
framework to support adding OPPs with multiple voltages.

[1] "[v4, 6/8] PM / OPP: Support adjusting OPP voltages at runtime"
    https://lore.kernel.org/linux-arm-kernel/1565703113-31479-7-git-send-email-andrew-sh.cheng@mediatek.com

Sylwester Nawrocki (6):
  opp: Handle target/min/max voltage in dev_pm_opp_adjust_voltage()
  dt-bindings: samsung: Update the CHIP ID binding documentation
  soc: samsung: Add Exynos Adaptive Supply Voltage driver
  ARM: EXYNOS: Enable exynos-asv driver for ARCH_EXYNOS
  ARM: dts: Add "syscon" compatible string to chipid node
  ARM: dts: Add samsung,asv-bin property for odroidxu3-lite

 .../bindings/arm/samsung/exynos-chipid.txt    |  10 +-
 arch/arm/boot/dts/exynos5.dtsi                |   4 +-
 .../boot/dts/exynos5422-odroidxu3-lite.dts    |   4 +
 arch/arm/mach-exynos/Kconfig                  |   1 +
 drivers/opp/core.c                            |  10 +-
 drivers/soc/samsung/Kconfig                   |  10 +
 drivers/soc/samsung/Makefile                  |   3 +
 drivers/soc/samsung/exynos-asv.c              | 179 ++++++
 drivers/soc/samsung/exynos-asv.h              |  82 +++
 drivers/soc/samsung/exynos5422-asv.c          | 509 ++++++++++++++++++
 drivers/soc/samsung/exynos5422-asv.h          |  25 +
 include/linux/pm_opp.h                        |   3 +-
 12 files changed, 833 insertions(+), 7 deletions(-)
 create mode 100644 drivers/soc/samsung/exynos-asv.c
 create mode 100644 drivers/soc/samsung/exynos-asv.h
 create mode 100644 drivers/soc/samsung/exynos5422-asv.c
 create mode 100644 drivers/soc/samsung/exynos5422-asv.h

-- 
2.17.1
