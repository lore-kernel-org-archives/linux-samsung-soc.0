From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH] drm/exynos: fix possible infinite loop issue
Date: Fri, 07 Nov 2014 21:49:40 +0900
Message-ID: <1415364581-14646-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:64520 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751763AbaKGMtn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Nov 2014 07:49:43 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NEO00MZN6ATZ600@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Nov 2014 21:49:41 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>

This patch fixes possible infinite loop issue by postponing
registration to non kms drivers after component_master_add_with_match
call, which can be incurred in all cases that non kms driver is probed
and then component bind is failed

This patch should be applied on top of below patches,
	http://comments.gmane.org/gmane.comp.video.dri.devel/117740
	http://www.spinics.net/lists/linux-samsung-soc/msg38624.html

Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c |   31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 14c6af7..e80a8db 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -584,10 +584,21 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 		goto err_unregister_mixer_drv;
 #endif
 
+	match = exynos_drm_match_add(&pdev->dev);
+	if (IS_ERR(match)) {
+		ret = PTR_ERR(match);
+		goto err_unregister_hdmi_drv;
+	}
+
+	ret = component_master_add_with_match(&pdev->dev, &exynos_drm_ops,
+						match);
+	if (ret < 0)
+		goto err_unregister_hdmi_drv;
+
 #ifdef CONFIG_DRM_EXYNOS_G2D
 	ret = platform_driver_register(&g2d_driver);
 	if (ret < 0)
-		goto err_unregister_hdmi_drv;
+		goto err_del_component_master;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_FIMC
@@ -618,23 +629,9 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 		goto err_unregister_ipp_drv;
 #endif
 
-	match = exynos_drm_match_add(&pdev->dev);
-	if (IS_ERR(match)) {
-		ret = PTR_ERR(match);
-		goto err_unregister_resources;
-	}
-
-	ret = component_master_add_with_match(&pdev->dev, &exynos_drm_ops,
-						match);
-	if (ret < 0)
-		goto err_unregister_resources;
-
 	return ret;
 
-err_unregister_resources:
-
 #ifdef CONFIG_DRM_EXYNOS_IPP
-	exynos_platform_device_ipp_unregister();
 err_unregister_ipp_drv:
 	platform_driver_unregister(&ipp_driver);
 err_unregister_gsc_drv:
@@ -657,9 +654,11 @@ err_unregister_g2d_drv:
 
 #ifdef CONFIG_DRM_EXYNOS_G2D
 	platform_driver_unregister(&g2d_driver);
-err_unregister_hdmi_drv:
+err_del_component_master:
 #endif
+	component_master_del(&pdev->dev, &exynos_drm_ops);
 
+err_unregister_hdmi_drv:
 #ifdef CONFIG_DRM_EXYNOS_HDMI
 	platform_driver_unregister(&hdmi_driver);
 err_unregister_mixer_drv:
-- 
1.7.9.5
