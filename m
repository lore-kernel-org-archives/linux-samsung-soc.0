From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 0/9] Exynos Adaptive Supply Voltage support
Date: Tue, 13 Aug 2019 17:08:18 +0200
Message-ID: <20190813150827.31972-1-s.nawrocki@samsung.com>
References: <CGME20190813150842eucas1p2c248537d9cd593073e12abeac2cacab5@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This is third iteration of my patch series adding ASV (Adaptive Supply 
Voltage) support for Exynos SoCs. The previous one can be found at:
https://lore.kernel.org/lkml/20190718143044.25066-1-s.nawrocki@samsung.com

There is no major changes in this series comparing to v2, only minor
corrections addressing review comments.

I was not sure it was a good idea to try to extend the OPP binding 
so as to include the ASV data tables in DT, so the tables are left
in the driver.

This patch set includes Exynos CHIPID driver posted by Pankaj Dubey and
futher improved by Bartłomiej Żołnierkiewicz [1].

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
 drivers/soc/samsung/Kconfig                   |  15 +
 drivers/soc/samsung/Makefile                  |   5 +
 drivers/soc/samsung/exynos-asv.c              | 184 +++++++
 drivers/soc/samsung/exynos-asv.h              |  82 +++
 drivers/soc/samsung/exynos-chipid.c           | 101 ++++
 drivers/soc/samsung/exynos5422-asv.c          | 498 ++++++++++++++++++
 drivers/soc/samsung/exynos5422-asv.h          |  25 +
 include/linux/soc/samsung/exynos-chipid.h     |  52 ++
 13 files changed, 979 insertions(+), 4 deletions(-)
 create mode 100644 drivers/soc/samsung/exynos-asv.c
 create mode 100644 drivers/soc/samsung/exynos-asv.h
 create mode 100644 drivers/soc/samsung/exynos-chipid.c
 create mode 100644 drivers/soc/samsung/exynos5422-asv.c
 create mode 100644 drivers/soc/samsung/exynos5422-asv.h
 create mode 100644 include/linux/soc/samsung/exynos-chipid.h

-- 
2.17.1
