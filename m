From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm/exynos/fimc: fix runtime pm support
Date: Thu, 09 Apr 2015 10:46:00 +0200
Message-ID: <1428569160-20628-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:13411 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932317AbbDIIqc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Apr 2015 04:46:32 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NMJ001XU77ZA340@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Apr 2015 09:50:23 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, jy0922.shim@samsung.com

Once pm_runtime_set_active() gets called, the kernel assumes that given
device has already enabled runtime pm and will call pm_runtime_suspend()
without matching pm_runtime_resume(). In case of DRM FIMC IPP driver,
this will result in calling clk_disable() without respective call to
clk_enable(). This patch removes call to pm_runtime_set_active() to
ensure that pm_runtime_suspend/resume calls will match.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 842d6b8dc3c4..2a652359af64 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -1745,7 +1745,6 @@ static int fimc_probe(struct platform_device *pdev)
 	spin_lock_init(&ctx->lock);
 	platform_set_drvdata(pdev, ctx);
 
-	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
 
 	ret = exynos_drm_ippdrv_register(ippdrv);
-- 
1.9.2
