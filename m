From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 4/4] drm/exynos: g2d: beautify probing message
Date: Thu, 22 Sep 2016 16:57:20 +0200
Message-ID: <1474556240-14055-5-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1474556240-14055-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55143 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1756829AbcIVO7l (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Sep 2016 10:59:41 -0400
In-Reply-To: <1474556240-14055-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, inki.dae@samsung.com, a.hajda@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Apply some 'make-up' in g2d_probe().

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 73cd83f..410d170 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -2423,7 +2423,7 @@ static int g2d_probe(struct platform_device *pdev)
 		goto err_put_clk;
 	}
 
-	dev_info(dev, "The exynos g2d(ver %d.%d) successfully probed\n",
+	dev_info(dev, "The Exynos G2D (ver %d.%d) successfully probed.\n",
 			G2D_HW_MAJOR_VER, G2D_HW_MINOR_VER);
 
 	return 0;
-- 
2.7.3
