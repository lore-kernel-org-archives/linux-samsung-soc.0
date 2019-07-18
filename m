From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 0/9] Exynos Adaptive Supply Voltage support
Date: Thu, 18 Jul 2019 16:30:35 +0200
Message-ID: <20190718143044.25066-1-s.nawrocki@samsung.com>
References: <CGME20190718143117eucas1p1e534b9075d10fbbbe427c66192205eb1@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is second iteration of patch series adding ASV (Adaptive Supply 
Voltage) support for Exynos SoCs. The first one can be found at:
https://lore.kernel.org/lkml/20190404171735.12815-1-s.nawrocki@samsung.com

The main changes comparing to the first (RFC) version are:
 - moving ASV data tables from DT to the driver,
 - converting the chipid and the ASV drivers to use regmap,
 - converting the ASV driver to proper platform driver.

I tried the opp-supported-hw bitmask approach as in the Qualcomm CPUFreq
DT bindings but it resulted in too many OPPs and DT nodes, around 200
per CPU cluster. So the ASV OPP tables are now in the ASV driver, as in
downstream kernels.  I might give it a try and restrucure these tables
to avoid data repetition.

This patch set includes Exynos CHIPID driver posted by Pankaj Dubey and
futher improved by Bartlomiej Zolnierkiewicz [1].

Tested on Odroid XU3, XU3 Lite, XU4.

One of the things on TODO list is support for the Adaptive Body Bias.
This will require modifications on the cpufreq driver side in order to 
support multiple voltage regulators and changes in the OPP framework 
to support adding OPPs with multiple voltages.

[1] https://lkml.org/lkml/2018/11/15/908

Pankaj Dubey (3):
  soc: samsung: Add exynos chipid driver support
  ARM: EXYNOS: enable exynos_chipid for ARCH_EXYNOS
  ARM64: EXYNOS: enable exynos_chipid for ARCH_EXYNOS

Sylwester Nawrocki (6):
  soc: samsung: Convert exynos-chipid driver to use the regmap API
  soc: samsung: Add Exynos Adaptive Supply Voltage driver
  ARM: EXYNOS: Enable exynos-asv driver for ARCH_EXYNOS
  soc: samsung: Update the CHIP ID DT binding documentation
  ARM: dts: Add "syscon" compatible string to chipid node
  ARM: dts: Add samsung,asv-bin property for odroidxu3-lite

 .../bindings/arm/samsung/exynos-chipid.txt    |  10 +-
 arch/arm/boot/dts/exynos5.dtsi                |   4 +-
 .../boot/dts/exynos5422-odroidxu3-lite.dts    |   4 +
 arch/arm/mach-exynos/Kconfig                  |   2 +
 arch/arm64/Kconfig.platforms                  |   1 +
 drivers/soc/samsung/Kconfig                   |  16 +
 drivers/soc/samsung/Makefile                  |   5 +
 drivers/soc/samsung/exynos-asv.c              | 185 +++++++
 drivers/soc/samsung/exynos-asv.h              |  82 +++
 drivers/soc/samsung/exynos-chipid.c           | 104 ++++
 drivers/soc/samsung/exynos5422-asv.c          | 499 ++++++++++++++++++
 drivers/soc/samsung/exynos5422-asv.h          |  25 +
 include/linux/soc/samsung/exynos-chipid.h     |  48 ++
 13 files changed, 981 insertions(+), 4 deletions(-)
 create mode 100644 drivers/soc/samsung/exynos-asv.c
 create mode 100644 drivers/soc/samsung/exynos-asv.h
 create mode 100644 drivers/soc/samsung/exynos-chipid.c
 create mode 100644 drivers/soc/samsung/exynos5422-asv.c
 create mode 100644 drivers/soc/samsung/exynos5422-asv.h
 create mode 100644 include/linux/soc/samsung/exynos-chipid.h

-- 
2.17.1
