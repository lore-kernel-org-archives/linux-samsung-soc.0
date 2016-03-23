From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 0/3] phy: exynos-mipi-video: add support for Exynos 54xx SoCs
Date: Wed, 23 Mar 2016 12:09:15 +0100
Message-ID: <1458731358-773-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hello,

This patch series adds upport for MIPI Video DPHY found in Exynos
5420/5422/5800 and 5433 SoCs.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland


Patch summary:

Marek Szyprowski (2):
  phy: exynos-mipi-video: rewrite handling of phy registers
  phy: exynos-mipi-video: add support for Exynos 5420 and 5433 SoCs

Sylwester Nawrocki (1):
  phy: exynos-mipi-video: Drop support for direct access to PMU

 .../devicetree/bindings/phy/samsung-phy.txt        |  18 +-
 drivers/phy/phy-exynos-mipi-video.c                | 322 ++++++++++++++++-----
 include/linux/mfd/syscon/exynos5-pmu.h             |   3 +
 3 files changed, 276 insertions(+), 67 deletions(-)

-- 
1.9.2
