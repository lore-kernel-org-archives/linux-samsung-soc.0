From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 1/3] drm/exynos: Remove redundant devm_kfree()
Date: Tue, 16 Apr 2013 19:31:24 +0200
Message-ID: <1366133486-22973-2-git-send-email-s.nawrocki@samsung.com>
References: <1366133486-22973-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41999 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964879Ab3DPRdH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Apr 2013 13:33:07 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLC003M0ZF5PP00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Apr 2013 02:33:05 +0900 (KST)
In-reply-to: <1366133486-22973-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

There is no need for explicit calls of devm_kfree(), as
the allocated memory will be freed during driver's detach.
Remove the redundant devm_kfree() calls from probe() and
remove() callbacks.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 411f69b7..d812c57 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1843,7 +1843,6 @@ static int fimc_probe(struct platform_device *pdev)
 	return 0;
 
 err_ippdrv_register:
-	devm_kfree(dev, ippdrv->prop_list);
 	pm_runtime_disable(dev);
 err_get_irq:
 	free_irq(ctx->irq, ctx);
@@ -1857,7 +1856,6 @@ static int fimc_remove(struct platform_device *pdev)
 	struct fimc_context *ctx = get_fimc_context(dev);
 	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
 
-	devm_kfree(dev, ippdrv->prop_list);
 	exynos_drm_ippdrv_unregister(ippdrv);
 	mutex_destroy(&ctx->lock);
 
-- 
1.7.9.5
