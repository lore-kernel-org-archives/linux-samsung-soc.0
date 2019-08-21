From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] soc: samsung: chipid: Remove the regmap lookup error log
Date: Wed, 21 Aug 2019 17:05:39 +0200
Message-ID: <20190821150539.31207-1-s.nawrocki@samsung.com>
References: <CGME20190821150548eucas1p15139f733b00e3a1a107efe39f6712fe9@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: jonathanh@nvidia.com, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

In commit 40d8aff614f7 ("soc: samsung: chipid: Convert exynos-chipid
driver to use the regmap API") of_find_compatible_node() call was
substituted with syscon_regmap_lookup_by_compatible() but also an error
log was added for case where lookup fails. On multiplatform the lookup
will always fail on any non-samsung device so the log is incorrect.
Remove the error log and just return an error code from
syscon_regmap_lookup_by_compatible() which internally calls
of_find_compatible_node().

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/soc/samsung/exynos-chipid.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 75b6b880d9ef..c55a47cfe617 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -56,10 +56,8 @@ int __init exynos_chipid_early_init(void)
 	int ret;
 
 	regmap = syscon_regmap_lookup_by_compatible("samsung,exynos4210-chipid");
-	if (IS_ERR(regmap)) {
-		pr_err("Failed to get CHIPID regmap\n");
+	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
-	}
 
 	ret = regmap_read(regmap, EXYNOS_CHIPID_REG_PRO_ID, &product_id);
 	if (ret < 0)
-- 
2.17.1
