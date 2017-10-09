From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] drm/exynos: Clear drvdata after component unbind
Date: Mon, 09 Oct 2017 10:44:01 +0200
Message-ID: <20171009084401.7237-1-m.szyprowski@samsung.com>
References: <CGME20171009084411eucas1p213cce9d027a1861d3c96ce99837a6fb0@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:40982 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750795AbdJIIoP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 04:44:15 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

When components are unbound, DRM driver is unregistered and freed,
so clear drvdata to avoid potential use-after-free issue in
suspend/resume paths.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index aa770bb0153c..82b72425a42f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -430,6 +430,7 @@ static void exynos_drm_unbind(struct device *dev)
 
 	kfree(drm->dev_private);
 	drm->dev_private = NULL;
+	dev_set_drvdata(dev, NULL);
 
 	drm_dev_unref(drm);
 }
-- 
2.14.2
