From: "R. Chandrasekar" <rcsekar@samsung.com>
Subject: [PATCH 2/3] drm: fimd: add mie plugin support for dithering
Date: Thu, 06 Dec 2012 17:38:14 +0530
Message-ID: <1354795695-28009-3-git-send-email-rcsekar@samsung.com>
References: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58440 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754920Ab2LFMLy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Dec 2012 07:11:54 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MEL005BBZ7LGIG0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Dec 2012 21:11:52 +0900 (KST)
Received: from sekar-ubuntu.sisodomain.com ([107.108.73.178])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MEL008T3Z2ZPL00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Dec 2012 21:11:51 +0900 (KST)
In-reply-to: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, joshi@samsung.com, rcsekar.samsung@gmail.com, rcsekar@samsung.com

From: "R. Chandrasekar" <rcsekar@samsung.com>

mie provides the dithereing functionality, fimd need to call the
mie dithering function is required when panel uses lesser
bits per pixel (bpp) of fimd.

This cl adds the functions to add the mie plugin, and calls the
mie dithereing function.

Signed-off-by: R. Chandrasekar <rcsekar@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c        |   58 ++++++++++++++++++++++-
 drivers/gpu/drm/exynos/exynos_drm_fimd_common.h |   20 ++++++++
 2 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimd_common.h

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index e2abae6..6e406d2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -27,6 +27,7 @@
 #include "exynos_drm_fbdev.h"
 #include "exynos_drm_crtc.h"
 #include "exynos_drm_iommu.h"
+#include "exynos_drm_mie.h"
 
 /*
  * FIMD is stand for Fully Interactive Mobile Display and
@@ -107,9 +108,59 @@ struct fimd_context {
 
 static const struct of_device_id fimd_dt_match[];
 
-static inline struct fimd_driver_data *drm_fimd_get_driver_data(
-	struct platform_device *pdev)
+static struct mie_plugin *mie;
+
+/* This function provides the fecility to add the mie plugin with fimd */
+void fimd_add_mie_plugin(struct mie_plugin *mie_plugin_data)
+{
+	mie = mie_plugin_data;
+}
+
+static int fimd_set_dithering_mode(struct fimd_context *ctx,
+					enum en_dither_mode dither_mode)
 {
+	struct fb_videomode *timing = &ctx->panel->timing;
+	struct mie_settings settings;
+	int ret = -1;
+
+	DRM_DEBUG_KMS(" %s Called\n", __func__);
+
+	if (!mie) {
+		DRM_DEBUG_KMS("invalid  mie plugin.\n");
+		return -EINVAL;
+	}
+
+	if ((!mie->ops.fn_configure_dither) || (!mie->ops.fn_dither_enable)) {
+		DRM_DEBUG_KMS("Invalid MIE function pointers\n");
+		return -EINVAL;
+	}
+
+	settings.xres = timing->xres;
+	settings.yres = timing->yres;
+	settings.left_margin = timing->left_margin;
+	settings.right_margin = timing->right_margin;
+	settings.upper_margin = timing->upper_margin;
+	settings.lower_margin = timing->lower_margin;
+	settings.hsync_len = timing->hsync_len;
+	settings.vsync_len = timing->vsync_len;
+
+	if (dither_mode < INVALID_DITHER_MODE)
+		settings.dither_mode = dither_mode;
+	else {
+		DRM_DEBUG_KMS("Invalid dithering mode[%d]\n", dither_mode);
+		return -EINVAL;
+	}
+
+	ret = mie->ops.fn_configure_dither(mie->dev, &settings);
+
+	if (!ret)
+		ret = mie->ops.fn_dither_enable(mie->dev, MIE_DITHER_EN);
+
+	return ret;
+}
+
+static inline struct fimd_driver_data *drm_fimd_get_driver_data(
+	struct platform_device *pdev) {
 #ifdef CONFIG_OF
 	if (pdev->dev.of_node) {
 		const struct of_device_id *match;
@@ -558,6 +609,9 @@ static void fimd_win_commit(struct device *dev, int zpos)
 	val |= WINCONx_ENWIN;
 	writel(val, ctx->regs + WINCON(win));
 
+	/* enable 6bit dithering  based on pannel type TBD*/
+	fimd_set_dithering_mode(ctx, DITHER_6BIT);
+
 	/* Enable DMA channel and unprotect windows */
 	val = readl(ctx->regs + SHADOWCON);
 	val |= SHADOWCON_CHx_ENABLE(win);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd_common.h b/drivers/gpu/drm/exynos/exynos_drm_fimd_common.h
new file mode 100644
index 0000000..bdd4fc7
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd_common.h
@@ -0,0 +1,20 @@
+/* exynos_drm_fimd_common.h
+ *
+ * Copyright (C) 2012 Samsung Electronics Co.Ltd
+ * Authors:
+ *	R. Chandrasekar <rcsekar@samsung.com>
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ *
+ */
+
+#ifndef __EXYNOS_DRM_FIMD_COMMON_H
+#define __EXYNOS_DRM_FIMD_COMMON_H
+
+
+void fimd_add_mie_plugin(struct mie_plugin *mie_plugin_data);
+
+#endif /*__EXYNOS_DRM_FIMD_COMMON_H */
-- 
1.7.9.5
