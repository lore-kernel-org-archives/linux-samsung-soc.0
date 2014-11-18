From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [RFC PATCH 1/1] drm/exynos: Move platform drivers registration to module init
Date: Tue, 18 Nov 2014 14:53:41 +0100
Message-ID: <1416318821-7925-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:58357 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753833AbaKRNxy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Nov 2014 08:53:54 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Kevin Hilman <khilman@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The Exynos DRM driver register its sub-devices platform drivers in
the probe function but after commit 43c0767 ("of/platform: Move
platform devices under /sys/devices/platform"), this is causing
a deadlock in __driver_attach(). Fix this by moving the platform
drivers registration to exynos_drm_init().

Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---

This issue was reported by both Krzysztof Kozlowski [0] and Kevin Hilman [1].

Inki Dae said that he will fix it property by separating the Exynos DRM
driver in different sub-modules but I post this patch as RFC anyways so
others can test if this fixes their boot issue.

[0]: https://lkml.org/lkml/2014/11/6/125
[1]: http://www.spinics.net/lists/linux-samsung-soc/msg39050.html

 drivers/gpu/drm/exynos/exynos_drm_drv.c | 163 ++++++++++++++++----------------
 1 file changed, 79 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index e277d4f..5386fea 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -559,15 +559,58 @@ static const struct component_master_ops exynos_drm_ops = {
 static int exynos_drm_platform_probe(struct platform_device *pdev)
 {
 	struct component_match *match;
-	int ret;
 
 	pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
 	exynos_drm_driver.num_ioctls = ARRAY_SIZE(exynos_ioctls);
 
+	match = exynos_drm_match_add(&pdev->dev);
+	if (IS_ERR(match))
+		return PTR_ERR(match);
+
+	return component_master_add_with_match(&pdev->dev, &exynos_drm_ops,
+					       match);
+}
+
+static int exynos_drm_platform_remove(struct platform_device *pdev)
+{
+	component_master_del(&pdev->dev, &exynos_drm_ops);
+	return 0;
+}
+
+static struct platform_driver exynos_drm_platform_driver = {
+	.probe	= exynos_drm_platform_probe,
+	.remove	= exynos_drm_platform_remove,
+	.driver	= {
+		.name	= "exynos-drm",
+		.pm	= &exynos_drm_pm_ops,
+	},
+};
+
+static int exynos_drm_init(void)
+{
+	int ret;
+
+	/*
+	 * Register device object only in case of Exynos SoC.
+	 *
+	 * Below codes resolves temporarily infinite loop issue incurred
+	 * by Exynos drm driver when using multi-platform kernel.
+	 * So these codes will be replaced with more generic way later.
+	 */
+	if (!of_machine_is_compatible("samsung,exynos3") &&
+			!of_machine_is_compatible("samsung,exynos4") &&
+			!of_machine_is_compatible("samsung,exynos5"))
+		return -ENODEV;
+
+	exynos_drm_pdev = platform_device_register_simple("exynos-drm", -1,
+								NULL, 0);
+	if (IS_ERR(exynos_drm_pdev))
+		return PTR_ERR(exynos_drm_pdev);
+
 #ifdef CONFIG_DRM_EXYNOS_FIMD
 	ret = platform_driver_register(&fimd_driver);
 	if (ret < 0)
-		return ret;
+		goto err_unregister_pdev;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_DP
@@ -591,21 +634,10 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 		goto err_unregister_mixer_drv;
 #endif
 
-	match = exynos_drm_match_add(&pdev->dev);
-	if (IS_ERR(match)) {
-		ret = PTR_ERR(match);
-		goto err_unregister_hdmi_drv;
-	}
-
-	ret = component_master_add_with_match(&pdev->dev, &exynos_drm_ops,
-						match);
-	if (ret < 0)
-		goto err_unregister_hdmi_drv;
-
 #ifdef CONFIG_DRM_EXYNOS_G2D
 	ret = platform_driver_register(&g2d_driver);
 	if (ret < 0)
-		goto err_del_component_master;
+		goto err_unregister_hdmi_drv;
 #endif
 
 #ifdef CONFIG_DRM_EXYNOS_FIMC
@@ -636,9 +668,27 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 		goto err_unregister_ipp_drv;
 #endif
 
-	return ret;
+#ifdef CONFIG_DRM_EXYNOS_VIDI
+	ret = exynos_drm_probe_vidi();
+	if (ret < 0)
+		goto err_unregister_ipp_dev;
+#endif
+
+	ret = platform_driver_register(&exynos_drm_platform_driver);
+	if (ret)
+		goto err_remove_vidi;
+
+	return 0;
+
+err_remove_vidi:
+#ifdef CONFIG_DRM_EXYNOS_VIDI
+	exynos_drm_remove_vidi();
+err_unregister_pd:
+#endif
 
 #ifdef CONFIG_DRM_EXYNOS_IPP
+err_unregister_ipp_dev:
+	exynos_platform_device_ipp_unregister();
 err_unregister_ipp_drv:
 	platform_driver_unregister(&ipp_driver);
 err_unregister_gsc_drv:
@@ -661,11 +711,9 @@ err_unregister_g2d_drv:
 
 #ifdef CONFIG_DRM_EXYNOS_G2D
 	platform_driver_unregister(&g2d_driver);
-err_del_component_master:
+err_unregister_hdmi_drv:
 #endif
-	component_master_del(&pdev->dev, &exynos_drm_ops);
 
-err_unregister_hdmi_drv:
 #ifdef CONFIG_DRM_EXYNOS_HDMI
 	platform_driver_unregister(&hdmi_driver);
 err_unregister_mixer_drv:
@@ -686,11 +734,21 @@ err_unregister_fimd_drv:
 #ifdef CONFIG_DRM_EXYNOS_FIMD
 	platform_driver_unregister(&fimd_driver);
 #endif
+
+err_unregister_pdev:
+	platform_device_unregister(exynos_drm_pdev);
+
 	return ret;
 }
 
-static int exynos_drm_platform_remove(struct platform_device *pdev)
+static void exynos_drm_exit(void)
 {
+	platform_driver_unregister(&exynos_drm_platform_driver);
+
+#ifdef CONFIG_DRM_EXYNOS_VIDI
+	exynos_drm_remove_vidi();
+#endif
+
 #ifdef CONFIG_DRM_EXYNOS_IPP
 	exynos_platform_device_ipp_unregister();
 	platform_driver_unregister(&ipp_driver);
@@ -721,75 +779,12 @@ static int exynos_drm_platform_remove(struct platform_device *pdev)
 	platform_driver_unregister(&fimd_driver);
 #endif
 
-#ifdef CONFIG_DRM_EXYNOS_DSI
-	platform_driver_unregister(&dsi_driver);
-#endif
-
 #ifdef CONFIG_DRM_EXYNOS_DP
 	platform_driver_unregister(&dp_driver);
 #endif
-	component_master_del(&pdev->dev, &exynos_drm_ops);
-	return 0;
-}
 
-static struct platform_driver exynos_drm_platform_driver = {
-	.probe	= exynos_drm_platform_probe,
-	.remove	= exynos_drm_platform_remove,
-	.driver	= {
-		.name	= "exynos-drm",
-		.pm	= &exynos_drm_pm_ops,
-	},
-};
-
-static int exynos_drm_init(void)
-{
-	int ret;
-
-	/*
-	 * Register device object only in case of Exynos SoC.
-	 *
-	 * Below codes resolves temporarily infinite loop issue incurred
-	 * by Exynos drm driver when using multi-platform kernel.
-	 * So these codes will be replaced with more generic way later.
-	 */
-	if (!of_machine_is_compatible("samsung,exynos3") &&
-			!of_machine_is_compatible("samsung,exynos4") &&
-			!of_machine_is_compatible("samsung,exynos5"))
-		return -ENODEV;
-
-	exynos_drm_pdev = platform_device_register_simple("exynos-drm", -1,
-								NULL, 0);
-	if (IS_ERR(exynos_drm_pdev))
-		return PTR_ERR(exynos_drm_pdev);
-
-#ifdef CONFIG_DRM_EXYNOS_VIDI
-	ret = exynos_drm_probe_vidi();
-	if (ret < 0)
-		goto err_unregister_pd;
-#endif
-
-	ret = platform_driver_register(&exynos_drm_platform_driver);
-	if (ret)
-		goto err_remove_vidi;
-
-	return 0;
-
-err_remove_vidi:
-#ifdef CONFIG_DRM_EXYNOS_VIDI
-	exynos_drm_remove_vidi();
-
-err_unregister_pd:
-#endif
-	platform_device_unregister(exynos_drm_pdev);
-
-	return ret;
-}
-
-static void exynos_drm_exit(void)
-{
-	platform_driver_unregister(&exynos_drm_platform_driver);
-#ifdef CONFIG_DRM_EXYNOS_VIDI
-	exynos_drm_remove_vidi();
+#ifdef CONFIG_DRM_EXYNOS_DSI
+	platform_driver_unregister(&dsi_driver);
 #endif
 	platform_device_unregister(exynos_drm_pdev);
 }
-- 
2.1.0
