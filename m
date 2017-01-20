From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 2/3] drm/exynos: g2d: change platform driver name to 'exynos-drm-g2d'
Date: Fri, 20 Jan 2017 17:02:51 +0100
Message-ID: <1484928172-16784-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1484928172-16784-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47208 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752590AbdATQDN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 11:03:13 -0500
In-Reply-To: <1484928172-16784-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The current name is 's5p-g2d', which is identical with the driver
name of the old V4L2 driver in media/platform.
This is probably due to the DRM driver being based on the V4L2
driver when it was initially created. Still the clashing of driver
names is confusing, so rename it to something in line with the
other DRM subdrivers.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index fbd13fa..6962f6b1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1668,7 +1668,7 @@ struct platform_driver g2d_driver = {
 	.probe		= g2d_probe,
 	.remove		= g2d_remove,
 	.driver		= {
-		.name	= "s5p-g2d",
+		.name	= "exynos-drm-g2d",
 		.owner	= THIS_MODULE,
 		.pm	= &g2d_pm_ops,
 		.of_match_table = exynos_g2d_match,
-- 
2.7.3
