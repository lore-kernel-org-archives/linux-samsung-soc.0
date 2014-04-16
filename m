From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 4/7] drm/exynos: add exynos_dp_panel driver registration to drm
 driver
Date: Wed, 16 Apr 2014 20:03:03 +0530
Message-ID: <1397658786-26138-5-git-send-email-ajaykumar.rs@samsung.com>
References: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:39998 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161089AbaDPOdl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 10:33:41 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4400HGEOG4XM10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Apr 2014 23:33:40 +0900 (KST)
In-reply-to: <1397658786-26138-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, a.hajda@samsung.com, treding@nvidia.com, kyungmin.park@samsung.com, seanpaul@google.com, abrestic@chromium.org, rahul.sharma@samsung.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Register exynos_dp_panel before the list of exynos crtcs and
connectors are probed.

This is needed because exynos_dp_panel should be registered to
the drm_panel list via panel-exynos-dp probe, i.e much before
exynos_dp_bind calls of_drm_find_panel().

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 11 +++++++++++
 drivers/gpu/drm/exynos/exynos_drm_drv.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 1d1c604..47266e7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -560,12 +560,23 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 		goto err_unregister_ipp;
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
 	exynos_platform_device_ipp_unregister();
 err_unregister_ipp:
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 257ce09..f606290 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -368,4 +368,5 @@ extern struct platform_driver fimc_driver;
 extern struct platform_driver rotator_driver;
 extern struct platform_driver gsc_driver;
 extern struct platform_driver ipp_driver;
+extern struct platform_driver exynos_dp_panel_driver;
 #endif
-- 
1.8.1.2
