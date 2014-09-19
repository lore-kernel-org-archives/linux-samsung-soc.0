From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH] drm/exynos: init vblank with real number of crtcs
Date: Fri, 19 Sep 2014 14:57:20 +0200
Message-ID: <1411131440-15395-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:33861 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751829AbaISM5d (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Sep 2014 08:57:33 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>, Kukjin Kim <kgene.kim@samsung.com>, "open list:DRM DRIVERS FOR E..." <dri-devel@lists.freedesktop.org>, "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, drake@endlessm.com, daniel@ffwll.ch, m.szyprowski@samsung.com

Initialization of vblank with MAX_CRTC caused attempts
to disabling vblanks for non-existing crtcs in case
drm used fewer crtcs. The patch fixes it.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 9b00e4e..dc4affd 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -94,10 +94,6 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	/* init kms poll for handling hpd */
 	drm_kms_helper_poll_init(dev);
 
-	ret = drm_vblank_init(dev, MAX_CRTC);
-	if (ret)
-		goto err_mode_config_cleanup;
-
 	/* setup possible_clones. */
 	exynos_drm_encoder_setup(dev);
 
@@ -106,22 +102,26 @@ static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
 	/* Try to bind all sub drivers. */
 	ret = component_bind_all(dev->dev, dev);
 	if (ret)
-		goto err_cleanup_vblank;
+		goto err_mode_config_cleanup;
+
+	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
+	if (ret)
+		goto err_unbind_all;
 
 	/* Probe non kms sub drivers and virtual display driver. */
 	ret = exynos_drm_device_subdrv_probe(dev);
 	if (ret)
-		goto err_unbind_all;
+		goto err_cleanup_vblank;
 
 	/* force connectors detection */
 	drm_helper_hpd_irq_event(dev);
 
 	return 0;
 
-err_unbind_all:
-	component_unbind_all(dev->dev, dev);
 err_cleanup_vblank:
 	drm_vblank_cleanup(dev);
+err_unbind_all:
+	component_unbind_all(dev->dev, dev);
 err_mode_config_cleanup:
 	drm_mode_config_cleanup(dev);
 	drm_release_iommu_mapping(dev);
@@ -138,8 +138,8 @@ static int exynos_drm_unload(struct drm_device *dev)
 	exynos_drm_fbdev_fini(dev);
 	drm_kms_helper_poll_fini(dev);
 
-	component_unbind_all(dev->dev, dev);
 	drm_vblank_cleanup(dev);
+	component_unbind_all(dev->dev, dev);
 	drm_mode_config_cleanup(dev);
 	drm_release_iommu_mapping(dev);
 
-- 
1.9.1
