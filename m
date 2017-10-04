From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/7] Remove remaining Exynos4212-related dead code
Date: Wed, 04 Oct 2017 08:38:21 +0200
Message-ID: <20171004063828.22068-1-m.szyprowski@samsung.com>
References: <CGME20171004063834eucas1p118067cf2bf6c21f3ed1431de2b2dd313@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54531 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751197AbdJDGii (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 02:38:38 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi!

Support for Exynos4212 SoCs has been removed by commit bca9085e0ae9 ("ARM:
dts: exynos: remove Exynos4212 support (dead code)"), so there is no need
to keep remaining dead code related to this SoC version.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (7):
  ARM: EXYNOS: Remove Exynos4212 related dead code
  soc: samsung: Remove Exynos4212 related dead code
  mmc: sdhci-s3c: Fix driver data for Exynos4 SoCs
  media: exynos4-is: Remove dependency on obsolete SoC support
  clk: samsung: Remove support for Exynos4212 SoCs in Exynos CLKOUT
    driver
  phy: samsung: Remove dependency on obsolete SoC support
  cpufreq: dt: Remove support for Exynos4212 SoCs

 Documentation/devicetree/bindings/arm/samsung/pmu.txt |  1 -
 arch/arm/mach-exynos/Kconfig                          |  5 -----
 arch/arm/mach-exynos/common.h                         | 11 +----------
 arch/arm/mach-exynos/exynos.c                         |  2 --
 arch/arm/mach-exynos/firmware.c                       |  5 -----
 arch/arm/mach-exynos/pm.c                             |  3 +--
 arch/arm/mach-exynos/suspend.c                        |  4 ----
 drivers/clk/samsung/clk-exynos-clkout.c               |  2 --
 drivers/cpufreq/cpufreq-dt-platdev.c                  |  1 -
 drivers/media/platform/exynos4-is/Kconfig             |  2 +-
 drivers/media/platform/exynos4-is/fimc-core.c         |  2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c         |  2 +-
 drivers/mmc/host/sdhci-s3c.c                          | 18 +++++-------------
 drivers/phy/samsung/Kconfig                           |  2 +-
 drivers/soc/samsung/exynos-pmu.c                      |  9 ---------
 drivers/soc/samsung/exynos-pmu.h                      |  2 --
 drivers/soc/samsung/exynos4-pmu.c                     | 13 ++-----------
 17 files changed, 13 insertions(+), 71 deletions(-)

-- 
2.14.2
