From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 6/7] phy: samsung: Remove dependency on obsolete SoC support
Date: Wed, 04 Oct 2017 08:38:27 +0200
Message-ID: <20171004063828.22068-7-m.szyprowski@samsung.com>
References: <20171004063828.22068-1-m.szyprowski@samsung.com>
        <CGME20171004063837eucas1p22344a95b7ad1b36c6a6bc70d5d5c5ada@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20171004063828.22068-1-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Viresh Kumar <viresh.kumar@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

Support for Exynos4212 SoCs has been removed by commit bca9085e0ae9 ("ARM:
dts: exynos: remove Exynos4212 support (dead code)"), so there is no need
to keep remaining dead code related to this SoC version.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/phy/samsung/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/Kconfig b/drivers/phy/samsung/Kconfig
index b7e0645a7bd9..2a5d33cb0e7e 100644
--- a/drivers/phy/samsung/Kconfig
+++ b/drivers/phy/samsung/Kconfig
@@ -49,7 +49,7 @@ config PHY_EXYNOS4210_USB2
 config PHY_EXYNOS4X12_USB2
 	bool
 	depends on PHY_SAMSUNG_USB2
-	default SOC_EXYNOS3250 || SOC_EXYNOS4212 || SOC_EXYNOS4412
+	default SOC_EXYNOS3250 || SOC_EXYNOS4412
 
 config PHY_EXYNOS5250_USB2
 	bool
-- 
2.14.2
