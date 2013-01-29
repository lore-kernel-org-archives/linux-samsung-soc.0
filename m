From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 1/1] video: drm: exynos: Adds display-timing node parsing using
 video helper function
Date: Tue, 29 Jan 2013 03:12:26 -0500
Message-ID: <1359447146-23359-2-git-send-email-l.krishna@samsung.com>
References: <1359447146-23359-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:8619 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753045Ab3A2HvN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 02:51:13 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHD00A2SN4XU7P0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 16:51:09 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MHD00DY4N4VWE70@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 29 Jan 2013 16:51:08 +0900 (KST)
In-reply-to: <1359447146-23359-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: inki.dae@samsung.com, kgene.kim@samsung.com, vikas.sajjan@linaro.org, linux-samsung-soc@vger.kernel.org, s.trumtrar@pengutronix.de

This patch adds display-timing node parsing using video helper function

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
Tested-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 9537761..19dc842 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -876,6 +876,8 @@ static int fimd_probe(struct platform_device *pdev)
 	struct fimd_context *ctx;
 	struct exynos_drm_subdrv *subdrv;
 	struct exynos_drm_fimd_pdata *pdata;
+	struct fb_videomode *fbmode;
+	struct device *disp_dev = &pdev->dev;
 	struct exynos_drm_panel_info *panel;
 	struct resource *res;
 	int win;
@@ -883,10 +885,31 @@ static int fimd_probe(struct platform_device *pdev)
 
 	DRM_DEBUG_KMS("%s\n", __FILE__);
 
-	pdata = pdev->dev.platform_data;
-	if (!pdata) {
-		dev_err(dev, "no platform data specified\n");
-		return -EINVAL;
+	if (pdev->dev.of_node) {
+		pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+		if (!pdata) {
+			DRM_ERROR("memory allocation for pdata failed\n");
+			return -ENOMEM;
+		}
+
+		fbmode = devm_kzalloc(dev, sizeof(*fbmode), GFP_KERNEL);
+		if (!fbmode) {
+			DRM_ERROR("memory allocation for fbmode failed\n");
+			return -ENOMEM;
+		}
+
+		ret = of_get_fb_videomode(disp_dev->of_node, fbmode, -1);
+		if (ret) {
+			DRM_ERROR("failed to get fb_videomode\n");
+			return -EINVAL;
+		}
+		pdata->panel.timing = (struct fb_videomode) *fbmode;
+	} else {
+		pdata = pdev->dev.platform_data;
+		if (!pdata) {
+			DRM_ERROR("no platform data specified\n");
+			return -EINVAL;
+		}
 	}
 
 	panel = &pdata->panel;
-- 
1.8.0
