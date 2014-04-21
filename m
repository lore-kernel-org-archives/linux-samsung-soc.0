From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2 4/9] drm/exynos: add exynos_dp_panel driver registration to
 drm driver
Date: Tue, 22 Apr 2014 04:09:13 +0530
Message-ID: <1398119958-32005-5-git-send-email-ajaykumar.rs@samsung.com>
References: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:18814 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754527AbaDUWj5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 18:39:57 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4E00FYMKAK4H10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 22 Apr 2014 07:39:56 +0900 (KST)
In-reply-to: <1398119958-32005-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Register exynos_dp_panel before the list of exynos crtcs and
connectors are probed.

This is needed because exynos_dp_panel should be registered to
the drm_panel list via panel-exynos-dp probe, i.e much before
exynos_dp_bind calls of_drm_find_panel().

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
Changes since V1:
	Added platform_driver_unregister(&exynos_dp_panel_driver) to
	exynos_drm_platform_remove as per Jingoo Han's correction

 drivers/gpu/drm/exynos/exynos_drm_drv.c |   15 +++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_drv.h |    1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 1d653f8..2db7f67 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -530,12 +530,23 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 		goto err_unregister_ipp_drv;
 #endif
 
+#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
+	ret = platform_driver_register(&exynos_dp_panel_driver);
+	if (ret < 0)
+		goto err_unregister_dp_panel;
+#endif
+
 	ret = component_master_add(&pdev->dev, &exynos_drm_ops);
 	if (ret < 0)
 		DRM_DEBUG_KMS("re-tried by last sub driver probed later.\n");
 
 	return 0;
 
+#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
+	platform_driver_unregister(&exynos_dp_panel_driver);
+err_unregister_dp_panel:
+#endif
+
 #ifdef CONFIG_DRM_EXYNOS_IPP
 err_unregister_ipp_drv:
 	platform_driver_unregister(&ipp_driver);
@@ -587,6 +598,10 @@ err_unregister_fimd_drv:
 
 static int exynos_drm_platform_remove(struct platform_device *pdev)
 {
+#ifdef CONFIG_DRM_PANEL_EXYNOS_DP
+	platform_driver_unregister(&exynos_dp_panel_driver);
+#endif
+
 #ifdef CONFIG_DRM_EXYNOS_IPP
 	exynos_platform_device_ipp_unregister();
 	platform_driver_unregister(&ipp_driver);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index fc15fe6..b33050d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -368,4 +368,5 @@ extern struct platform_driver fimc_driver;
 extern struct platform_driver rotator_driver;
 extern struct platform_driver gsc_driver;
 extern struct platform_driver ipp_driver;
+extern struct platform_driver exynos_dp_panel_driver;
 #endif
-- 
1.7.9.5
