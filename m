From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] soc: samsung: chipid: Make exynos_chipid_early_init()
 static
Date: Wed,  4 Sep 2019 10:49:51 +0200
Message-ID: <20190904084951.28971-1-s.nawrocki@samsung.com>
References: <CGME20190904085001eucas1p2b3a120d6206983d47f0084b872042342@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add missing static qualifier to the chipid initcall function.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/soc/samsung/exynos-chipid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index c55a47cfe617..25562dd0b206 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -45,7 +45,7 @@ static const char * __init product_id_to_soc_id(unsigned int product_id)
 	return NULL;
 }
 
-int __init exynos_chipid_early_init(void)
+static int __init exynos_chipid_early_init(void)
 {
 	struct soc_device_attribute *soc_dev_attr;
 	struct soc_device *soc_dev;
-- 
2.17.1
