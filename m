From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 1/4] drm/exynos: hdmi: move hdmi subsystem registration to drm
 common hdmi
Date: Mon, 29 Apr 2013 20:20:50 +0530
Message-ID: <1367247053-17105-2-git-send-email-rahul.sharma@samsung.com>
References: <1367247053-17105-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54941 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757827Ab3D2O1a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Apr 2013 10:27:30 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MM000F0GTHSE210@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 29 Apr 2013 23:27:28 +0900 (KST)
In-reply-to: <1367247053-17105-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, r.sh.open@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

Exynos hdmi sub-system consists of mixer, hdmi ip, hdmi-phy and hdmi-ddc
components. Currently, drivers for these components are getting registered
in exynos_drm_drv.c, which is meant for registration of drm sub-drivers.

In this patch, registration of drm hdmi sub-driver and device, drivers for
hdmi sub-system components are moved to exynos_drm_hdmi.c. This ensures
limited & relevant exposure of hdmi-sub-system components to exynos_drm_drv.c.
It will also help in handling the hdmi-sub-system diversities within the
exynos-common-hdmi.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c  |   25 ++--------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |   14 ++++-----
 drivers/gpu/drm/exynos/exynos_drm_hdmi.c |   46 ++++++++++++++++++++++++------
 drivers/gpu/drm/exynos/exynos_drm_hdmi.h |    3 ++
 4 files changed, 49 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index ba6d995..4eabb6e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -331,19 +331,9 @@ static int __init exynos_drm_init(void)
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_HDMI
-	ret = platform_driver_register(&hdmi_driver);
+	ret = exynos_common_hdmi_register();
 	if (ret < 0)
 		goto out_hdmi;
-	ret = platform_driver_register(&mixer_driver);
-	if (ret < 0)
-		goto out_mixer;
-	ret = platform_driver_register(&exynos_drm_common_hdmi_driver);
-	if (ret < 0)
-		goto out_common_hdmi;
-
-	ret = exynos_platform_device_hdmi_register();
-	if (ret < 0)
-		goto out_common_hdmi_dev;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_VIDI
@@ -436,13 +426,7 @@ out_vidi:
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_HDMI
-	exynos_platform_device_hdmi_unregister();
-out_common_hdmi_dev:
-	platform_driver_unregister(&exynos_drm_common_hdmi_driver);
-out_common_hdmi:
-	platform_driver_unregister(&mixer_driver);
-out_mixer:
-	platform_driver_unregister(&hdmi_driver);
+	exynos_common_hdmi_unregister();
 out_hdmi:
 #endif
 
@@ -483,10 +467,7 @@ static void __exit exynos_drm_exit(void)
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_HDMI
-	exynos_platform_device_hdmi_unregister();
-	platform_driver_unregister(&exynos_drm_common_hdmi_driver);
-	platform_driver_unregister(&mixer_driver);
-	platform_driver_unregister(&hdmi_driver);
+	exynos_common_hdmi_unregister();
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_VIDI
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index eaa1966..34aa36d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -319,15 +319,16 @@ int exynos_drm_subdrv_open(struct drm_device *dev, struct drm_file *file);
 void exynos_drm_subdrv_close(struct drm_device *dev, struct drm_file *file);
 
 /*
- * this function registers exynos drm hdmi platform device. It ensures only one
- * instance of the device is created.
+ * this function registers exynos drm hdmi platform driver and singleton
+ * device. It also registers subdrivers like mixer, hdmi and hdmiphy.
  */
-int exynos_platform_device_hdmi_register(void);
+int exynos_common_hdmi_register(void);
 
 /*
- * this function unregisters exynos drm hdmi platform device if it exists.
+ * this function unregisters exynos drm hdmi platform driver and device,
+ * subdrivers for mixer, hdmi and hdmiphy.
  */
-void exynos_platform_device_hdmi_unregister(void);
+void exynos_common_hdmi_unregister(void);
 
 /*
  * this function registers exynos drm ipp platform device.
@@ -340,9 +341,6 @@ int exynos_platform_device_ipp_register(void);
 void exynos_platform_device_ipp_unregister(void);
 
 extern struct platform_driver fimd_driver;
-extern struct platform_driver hdmi_driver;
-extern struct platform_driver mixer_driver;
-extern struct platform_driver exynos_drm_common_hdmi_driver;
 extern struct platform_driver vidi_driver;
 extern struct platform_driver g2d_driver;
 extern struct platform_driver fimc_driver;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
index 060fbe8..7ab5f9f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.c
@@ -41,6 +41,8 @@ static struct exynos_drm_hdmi_context *mixer_ctx;
 static struct exynos_hdmi_ops *hdmi_ops;
 static struct exynos_mixer_ops *mixer_ops;
 
+struct platform_driver exynos_drm_common_hdmi_driver;
+
 struct drm_hdmi_context {
 	struct exynos_drm_subdrv	subdrv;
 	struct exynos_drm_hdmi_context	*hdmi_ctx;
@@ -49,29 +51,55 @@ struct drm_hdmi_context {
 	bool	enabled[MIXER_WIN_NR];
 };
 
-int exynos_platform_device_hdmi_register(void)
+int exynos_common_hdmi_register(void)
 {
 	struct platform_device *pdev;
+	int ret;
 
 	if (exynos_drm_hdmi_pdev)
 		return -EEXIST;
 
+	ret = platform_driver_register(&hdmi_driver);
+	if (ret < 0)
+		goto out_hdmi;
+
+	ret = platform_driver_register(&mixer_driver);
+	if (ret < 0)
+		goto out_mixer;
+
+	ret = platform_driver_register(&exynos_drm_common_hdmi_driver);
+	if (ret < 0)
+		goto out_common_hdmi;
+
 	pdev = platform_device_register_simple(
 			"exynos-drm-hdmi", -1, NULL, 0);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
+	if (IS_ERR(pdev)) {
+		ret = PTR_ERR(pdev);
+		goto out_common_hdmi_dev;
+	}
 
 	exynos_drm_hdmi_pdev = pdev;
-
 	return 0;
+
+out_common_hdmi_dev:
+	platform_driver_unregister(&exynos_drm_common_hdmi_driver);
+out_common_hdmi:
+	platform_driver_unregister(&mixer_driver);
+out_mixer:
+	platform_driver_unregister(&hdmi_driver);
+out_hdmi:
+	return ret;
 }
 
-void exynos_platform_device_hdmi_unregister(void)
+void exynos_common_hdmi_unregister(void)
 {
-	if (exynos_drm_hdmi_pdev) {
-		platform_device_unregister(exynos_drm_hdmi_pdev);
-		exynos_drm_hdmi_pdev = NULL;
-	}
+	if (!exynos_drm_hdmi_pdev)
+		return;
+	platform_device_unregister(exynos_drm_hdmi_pdev);
+	platform_driver_unregister(&exynos_drm_common_hdmi_driver);
+	platform_driver_unregister(&mixer_driver);
+	platform_driver_unregister(&hdmi_driver);
+	exynos_drm_hdmi_pdev = NULL;
 }
 
 void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
index 724cab1..8861b90 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_hdmi.h
@@ -60,6 +60,9 @@ struct exynos_mixer_ops {
 	int (*check_mode)(void *ctx, struct drm_display_mode *mode);
 };
 
+extern struct platform_driver hdmi_driver;
+extern struct platform_driver mixer_driver;
+
 void exynos_hdmi_drv_attach(struct exynos_drm_hdmi_context *ctx);
 void exynos_mixer_drv_attach(struct exynos_drm_hdmi_context *ctx);
 void exynos_hdmi_ops_register(struct exynos_hdmi_ops *ops);
-- 
1.7.10.4
