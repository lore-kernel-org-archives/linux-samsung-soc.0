From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/8] soc: samsung: pmu: Add dummy support for Exynos5433 SoC
Date: Thu, 26 Jan 2017 09:33:47 +0100
Message-ID: <1485419634-28331-2-git-send-email-m.szyprowski@samsung.com>
References: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126083401eucas1p24b0f04c62332e0b6e446ecca83145bc5@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add compatible for Exynos5433 SoC, so the driver will bind and let other
drivers to use PMU regmap.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/soc/samsung/exynos-pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index 813df6e7292d..56d9244ff981 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -44,7 +44,7 @@ void exynos_sys_powerdown_conf(enum sys_powerdown mode)
 	unsigned int i;
 	const struct exynos_pmu_data *pmu_data;
 
-	if (!pmu_context)
+	if (!pmu_context || !pmu_context->pmu_data)
 		return;
 
 	pmu_data = pmu_context->pmu_data;
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
