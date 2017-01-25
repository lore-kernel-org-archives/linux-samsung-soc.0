From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/7] soc: samsung: pmu: Add dummy support for Exynos5433 SoC
Date: Wed, 25 Jan 2017 12:50:25 +0100
Message-ID: <1485345031-2948-2-git-send-email-m.szyprowski@samsung.com>
References: <1485345031-2948-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170125115102eucas1p187f817f967c18a640098cf29268238d2@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1485345031-2948-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add compatible for Exynos5433 SoC, so the driver will bind and let other
drivers to use PMU regmap.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/soc/samsung/exynos-pmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 813df6e7292d..effb8a8a78c6 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -90,6 +90,8 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
 	}, {
 		.compatible = "samsung,exynos5420-pmu",
 		.data = &exynos5420_pmu_data,
+	}, {
+		.compatible = "samsung,exynos5433-pmu",
 	},
 	{ /*sentinel*/ },
 };
@@ -122,7 +124,7 @@ static int exynos_pmu_probe(struct platform_device *pdev)
 	pmu_context->dev = dev;
 	pmu_context->pmu_data = of_device_get_match_data(dev);
 
-	if (pmu_context->pmu_data->pmu_init)
+	if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_init)
 		pmu_context->pmu_data->pmu_init();
 
 	platform_set_drvdata(pdev, pmu_context);
-- 
1.9.1
