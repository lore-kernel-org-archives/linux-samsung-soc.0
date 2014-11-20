From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 2/3] Revert "drm/exynos: fix null pointer dereference issue"
Date: Thu, 20 Nov 2014 21:42:55 -0200
Message-ID: <1416526976-9467-3-git-send-email-gustavo@padovan.org>
References: <1416526976-9467-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f46.google.com ([209.85.216.46]:35235 "EHLO
	mail-qa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756600AbaKTXnI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 18:43:08 -0500
Received: by mail-qa0-f46.google.com with SMTP id u7so2701065qaz.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2014 15:43:08 -0800 (PST)
In-Reply-To: <1416526976-9467-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

This reverts commit cea24824ab432f8acabb254d6805e9aa756de6af.

Moving subdriver probe to exynos_drm_platform_probe() was making
exynos_drm_device_subdrv_probe() fail because the platform data wasn't set
yet. It only gets set in exynos_drm_load.

We need to find a smarter way to fix this issue.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index b94c9d1..91891cf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -108,6 +108,11 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto err_unbind_all;
 
+	/* Probe non kms sub drivers and virtual display driver. */
+	ret = exynos_drm_device_subdrv_probe(dev);
+	if (ret)
+		goto err_cleanup_vblank;
+
 	/*
 	 * enable drm irq mode.
 	 * - with irq_enabled = true, we can use the vblank feature.
@@ -133,6 +138,8 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 
 	return 0;
 
+err_cleanup_vblank:
+	drm_vblank_cleanup(dev);
 err_unbind_all:
 	component_unbind_all(dev->dev, dev);
 err_mode_config_cleanup:
@@ -146,6 +153,8 @@ err_free_private:
 
 static int exynos_drm_unload(struct drm_device *dev)
 {
+	exynos_drm_device_subdrv_remove(dev);
+
 	exynos_drm_fbdev_fini(dev);
 	drm_kms_helper_poll_fini(dev);
 
@@ -608,14 +617,8 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_unregister_non_kms_drivers;
 
-	/* Probe non kms sub drivers and virtual display driver. */
-	ret = exynos_drm_device_subdrv_probe(platform_get_drvdata(pdev));
-	if (ret)
-		goto err_unregister_resources;
-
 	return ret;
 
-err_unregister_resources:
 #ifdef CONFIG_DRM_EXYNOS_IPP
 	exynos_platform_device_ipp_unregister();
 #endif
@@ -637,8 +640,6 @@ static int exynos_drm_platform_remove(struct platform_device *pdev)
 {
 	int i;
 
-	exynos_drm_device_subdrv_remove(platform_get_drvdata(pdev));
-
 #ifdef CONFIG_DRM_EXYNOS_IPP
 	exynos_platform_device_ipp_unregister();
 #endif
-- 
1.9.3
