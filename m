From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/7] drm/exynos: rotator: use generic of_device_get_match_data
 helper
Date: Fri, 01 Apr 2016 15:17:43 +0200
Message-ID: <1459516666-2004-5-git-send-email-m.szyprowski@samsung.com>
References: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:18376 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752362AbcDANSO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 Apr 2016 09:18:14 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O4Y00M6FIABL410@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 01 Apr 2016 14:18:11 +0100 (BST)
In-reply-to: <1459516666-2004-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Simplify code by replacing custom code by generic helper.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index f18fbe43f55f..404367a430b5 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 
 #include <drm/drmP.h>
@@ -696,7 +697,6 @@ static int rotator_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rot_context *rot;
 	struct exynos_drm_ippdrv *ippdrv;
-	const struct of_device_id *match;
 	int ret;
 
 	if (!dev->of_node) {
@@ -708,13 +708,8 @@ static int rotator_probe(struct platform_device *pdev)
 	if (!rot)
 		return -ENOMEM;
 
-	match = of_match_node(exynos_rotator_match, dev->of_node);
-	if (!match) {
-		dev_err(dev, "failed to match node\n");
-		return -ENODEV;
-	}
-	rot->limit_tbl = (struct rot_limit_table *)match->data;
-
+	rot->limit_tbl = (struct rot_limit_table *)
+				of_device_get_match_data(dev);
 	rot->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	rot->regs = devm_ioremap_resource(dev, rot->regs_res);
 	if (IS_ERR(rot->regs))
-- 
1.9.2
