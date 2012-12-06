From: "R. Chandrasekar" <rcsekar@samsung.com>
Subject: [PATCH 3/3] drm: mie: add mie driver for exynos
Date: Thu, 06 Dec 2012 17:38:15 +0530
Message-ID: <1354795695-28009-4-git-send-email-rcsekar@samsung.com>
References: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55567 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754920Ab2LFMNM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Dec 2012 07:13:12 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MEL00MOXZ9638J0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Dec 2012 21:12:42 +0900 (KST)
Received: from sekar-ubuntu.sisodomain.com ([107.108.73.178])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MEL008T3Z2ZPL00@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Dec 2012 21:12:41 +0900 (KST)
In-reply-to: <1354795695-28009-1-git-send-email-rcsekar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, kyungmin.park@samsung.com, joshi@samsung.com, rcsekar.samsung@gmail.com, rcsekar@samsung.com

From: "R. Chandrasekar" <rcsekar@samsung.com>

Adding driver for the Mobile Image Enhancement (MIE)
module of exynos SoC. This cl scope is limited to dithereing.
mie dithering function is enabled from fimd

Signed-off-by: R. Chandrasekar <rcsekar@samsung.com>

Change-Id: I05be2a2a5484719ff7bdeff722d95223191b077f
---
 drivers/gpu/drm/exynos/Kconfig           |    7 +
 drivers/gpu/drm/exynos/Makefile          |    1 +
 drivers/gpu/drm/exynos/exynos_drm_mie.c  |  250 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/exynos/exynos_drm_mie.h  |   50 ++++++
 drivers/gpu/drm/exynos/exynos_regs-mie.h |   75 +++++++++
 5 files changed, 383 insertions(+)
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.c
 create mode 100644 drivers/gpu/drm/exynos/exynos_drm_mie.h
 create mode 100644 drivers/gpu/drm/exynos/exynos_regs-mie.h

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 86fb75d..6a0794f 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -28,6 +28,13 @@ config DRM_EXYNOS_FIMD
 	help
 	  Choose this option if you want to use Exynos FIMD for DRM.
 
+config DRM_EXYNOS_MIE
+	bool "Exynos DRM MIE"
+	depends on DRM_EXYNOS
+	help
+	  Choose this option if you want to use Exynos MIE for DRM.
+	  MIE provides only dithering functionality.
+
 config DRM_EXYNOS_HDMI
 	bool "Exynos DRM HDMI"
 	depends on DRM_EXYNOS && !VIDEO_SAMSUNG_S5P_TV
diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 26813b8..aa25e9d 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -16,5 +16,6 @@ exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)	+= exynos_hdmi.o exynos_mixer.o \
 					   exynos_drm_hdmi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_VIDI)	+= exynos_drm_vidi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_G2D)	+= exynos_drm_g2d.o
+exynosdrm-$(CONFIG_DRM_EXYNOS_MIE)	+= exynos_drm_mie.o
 
 obj-$(CONFIG_DRM_EXYNOS)		+= exynosdrm.o
diff --git a/drivers/gpu/drm/exynos/exynos_drm_mie.c b/drivers/gpu/drm/exynos/exynos_drm_mie.c
new file mode 100644
index 0000000..63de92c
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_drm_mie.c
@@ -0,0 +1,250 @@
+/* exynos_drm_mie.c
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
+#include "drmP.h"
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <drm/exynos_drm.h>
+#include "exynos_drm_drv.h"
+#include "exynos_regs-mie.h"
+#include "exynos_drm_mie.h"
+#include "exynos_drm_fimd_common.h"
+
+struct mie_context {
+	void __iomem *regs;
+	struct mie_plugin plugin;
+	bool enabled;
+	bool configured;
+};
+
+#define get_mie_context(dev) platform_get_drvdata(to_platform_device(dev))
+
+static int mie_dither_enable(struct device *dev, bool enable)
+{
+	struct mie_context *ctx = NULL;
+	int reg;
+
+	DRM_DEBUG_KMS(" %s Called\n", __func__);
+
+	if (!dev) {
+		DRM_DEBUG_KMS("[mie] invalid device @ %s\n", __func__);
+		return -EINVAL;
+	}
+
+	ctx = get_mie_context(dev);
+
+	if (!ctx) {
+		dev_err(dev, "[mie] invalid context.\n");
+		return -EINVAL;
+	}
+
+	reg = readl(ctx->regs + MIE_AUXCON);
+	reg &= ~MIE_DITHCON_EN; /* Clear Enable */
+
+	if (enable) {
+		if (!ctx->configured) {
+			DRM_DEBUG_KMS("MIE Not Configured ");
+			DRM_DEBUG_KMS("Confgure mie before calling enable\n");
+			return -EINVAL;
+		}
+		reg |= MIE_DITHCON_EN; /* Set Enable */
+	}
+
+	writel(MIE_DITHCON_EN, ctx->regs + MIE_AUXCON);
+	ctx->enabled = enable;
+
+	return 0;
+}
+
+static int mie_configure_dither(struct device *dev,
+		struct mie_settings *settings)
+{
+	struct mie_context *ctx;
+	unsigned long val;
+	int i, rgb_mode;
+
+	DRM_DEBUG_KMS(" %s Called\n", __func__);
+
+	if (!dev) {
+		DRM_DEBUG_KMS("[mie] invalid mie device @ %s\n", __func__);
+		return -EINVAL;
+	}
+
+	if (!settings) {
+		DRM_DEBUG_KMS("[mie] Settings ptr is null @ %s\n", __func__);
+		return -EINVAL;
+	}
+
+	ctx = get_mie_context(dev);
+
+	if (!ctx) {
+		dev_err(dev, "[mie] invalid context.\n");
+		return -EINVAL;
+	}
+
+	DRM_DEBUG_KMS("Xres = %d, Yres = %d, LeftMargin = %d\n", settings->xres,
+		settings->yres, settings->left_margin);
+
+	if (settings->dither_mode == DITHER_6BIT)
+		rgb_mode = MIE_RGB6MODE;
+	else if (settings->dither_mode == DITHER_8BIT)
+		rgb_mode = MIE_RGB8MODE;
+	else
+		return -EINVAL;
+
+	writel(MIE_HRESOL(settings->xres) | MIE_VRESOL(settings->yres) |
+				MIE_MODE_UI, ctx->regs + MIE_CTRL1);
+
+	writel(MIE_WINHADDR0(0) | MIE_WINHADDR1(settings->xres),
+						ctx->regs + MIE_WINHADDR);
+	writel(MIE_WINVADDR0(0) | MIE_WINVADDR1(settings->yres),
+						ctx->regs + MIE_WINVADDR);
+
+	val = (settings->xres + settings->left_margin +
+			settings->right_margin + settings->hsync_len) *
+		(settings->yres + settings->upper_margin +
+		settings->lower_margin + settings->vsync_len) /
+		(MIE_PWMCLKVAL + 1);
+
+	writel(PWMCLKCNT(val), ctx->regs + MIE_PWMCLKCNT);
+
+	writel((MIE_VBPD(settings->upper_margin)) |
+		MIE_VFPD(settings->lower_margin) |
+		MIE_VSPW(settings->vsync_len), ctx->regs + MIE_PWMVIDTCON1);
+
+	writel(MIE_HBPD(settings->left_margin) |
+		MIE_HFPD(settings->right_margin) |
+		MIE_HSPW(settings->hsync_len), ctx->regs + MIE_PWMVIDTCON2);
+
+	val = readl(ctx->regs + MIE_AUXCON);
+	val &= ~MIE_RGBMODE;
+	val |= rgb_mode;
+	writel(val, ctx->regs + MIE_AUXCON);
+	writel(MIE_RGB8MODE, ctx->regs + MIE_AUXCON);
+
+
+	/* Bypass MIE image brightness enhancement */
+	for (i = 0; i <= MIE_MAX_BRIGHTNESS_CNT_REGS; i += 4) {
+		writel(0, ctx->regs + MIE_BRIGTNESS_REG1_OFFSET + i);
+		writel(0, ctx->regs + MIE_BRIGTNESS_REG2_OFFSET + i);
+	}
+
+	ctx->configured = true;
+
+	return 0;
+}
+
+
+int mie_get_dither_state(struct device *dev, bool *is_enabled)
+{
+	struct mie_context *ctx = NULL;
+
+	DRM_DEBUG_KMS(" %s Called\n", __func__);
+
+	if (!dev) {
+		DRM_DEBUG_KMS("[mie] invalid device.\n");
+		return -EINVAL;
+	}
+
+	ctx = get_mie_context(dev);
+
+	if ((ctx) && (is_enabled))
+		*is_enabled = ctx->enabled;
+	 else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int __devinit mie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mie_context *ctx;
+	struct resource *res;
+
+	DRM_DEBUG_KMS(" %s Called\n", __func__);
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx) {
+		dev_err(dev, "[mie] context alocation failed\n");
+		return -ENOMEM;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "[mie] failed to find registers\n");
+		return -ENOENT;
+	}
+
+	ctx->regs = devm_request_and_ioremap(dev, res);
+	if (!ctx->regs) {
+		dev_err(dev, "[mie] failed to map registers\n");
+		return -ENXIO;
+	}
+
+	ctx->configured = false;
+	ctx->enabled = false;
+
+	ctx->plugin.dev = dev;
+	ctx->plugin.ops.fn_dither_enable = mie_dither_enable;
+	ctx->plugin.ops.fn_get_dither_state = mie_get_dither_state;
+	ctx->plugin.ops.fn_configure_dither = mie_configure_dither;
+
+	fimd_add_mie_plugin(&ctx->plugin);
+
+	platform_set_drvdata(pdev, ctx);
+
+	return 0;
+}
+
+static int __devexit mie_remove(struct platform_device *pdev)
+{
+	DRM_DEBUG_KMS(" %s Called\n", __func__);
+	return 0;
+}
+
+static const struct of_device_id mie_dt_match[] = {
+	{
+		.compatible = "samsung,exynos5-mie",
+	},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mie_dt_match);
+
+struct platform_device_id mie_driver_ids[] = {
+	{
+		.name = "exynos5-mie",
+	},
+	{},
+};
+
+MODULE_DEVICE_TABLE(platform, exynos_drm_driver_ids);
+
+struct platform_driver mie_driver = {
+	.probe = mie_probe,
+	.remove = __devexit_p(mie_remove),
+	.id_table = mie_driver_ids,
+	.driver = {
+		.name = "exynos-drm-mie",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(mie_dt_match),
+	},
+};
+
+module_platform_driver(mie_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("R. Chandrasekar <rcsekar@samsung.com>");
+MODULE_DESCRIPTION("Samsung Mobile Image Enhancement Driver");
diff --git a/drivers/gpu/drm/exynos/exynos_drm_mie.h b/drivers/gpu/drm/exynos/exynos_drm_mie.h
new file mode 100644
index 0000000..f6eaad8
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_drm_mie.h
@@ -0,0 +1,50 @@
+/* exynos_drm_mie.h
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
+#ifndef __EXYNOS_DRM_MIE_H
+#define __EXYNOS_DRM_MIE_H
+
+#define MIE_DITHER_EN 1
+
+enum en_dither_mode {
+	DITHER_6BIT,
+	DITHER_8BIT,
+
+	INVALID_DITHER_MODE
+};
+
+struct mie_settings {
+	u32 xres;
+	u32 yres;
+	u32 left_margin;
+	u32 right_margin;
+	u32 upper_margin;
+	u32 lower_margin;
+	u32 hsync_len;
+	u32 vsync_len;
+	enum en_dither_mode dither_mode;
+};
+
+struct mie_plugin_ops {
+	int (*fn_dither_enable)(struct device *dev, bool enable);
+	int (*fn_get_dither_state)(struct device *dev, bool *is_enabled);
+	int (*fn_configure_dither)(struct device *dev,
+		struct mie_settings *settings);
+};
+
+struct mie_plugin {
+	struct device *dev;
+	struct mie_plugin_ops ops;
+};
+
+#endif /*__EXYNOS_DRM_MIE_H */
diff --git a/drivers/gpu/drm/exynos/exynos_regs-mie.h b/drivers/gpu/drm/exynos/exynos_regs-mie.h
new file mode 100644
index 0000000..6b3dba2
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_regs-mie.h
@@ -0,0 +1,75 @@
+/* exynos_regs-mie.h
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
+#ifndef __EXYNOS_REGS_MIE_H
+#define __EXYNOS_REGS_MIE_H
+
+#define MIE_MAX_BRIGHTNESS_CNT_REGS 0x30	/* Max Brightness registers */
+#define MIE_BRIGTNESS_REG1_OFFSET 0x100		/* Brightness register set1 */
+#define MIE_BRIGTNESS_REG2_OFFSET 0x200		/* Brightness register set1 */
+
+/* MIE registers */
+
+#define MIE_CTRL1			0x0	/* MIE Control Register 1 */
+#define MIE_HRESOL_SHIFT		18
+#define MIE_HRESOL(x)			((x & 0xfff) << MIE_HRESOL_SHIFT)
+#define MIE_VRESOL_SHIFT		7
+#define MIE_VRESOL(x)			((x & 0x7ff) << MIE_VRESOL_SHIFT)
+#define MIE_MODE_UI			(1 << 5)
+
+/* Specifies Horizontal window position */
+#define MIE_WINHADDR			0x10
+#define MIE_WINHADDR0_SHIFT		0
+#define MIE_WINHADDR1_SHIFT		20
+#define MIE_WINHADDR0(x)		((x & 0xfff) << MIE_WINHADDR0_SHIFT)
+#define MIE_WINHADDR1(x)		(((x-1) & 0xfff)\
+						<< MIE_WINHADDR1_SHIFT)
+
+/* Specifies Vertical window position */
+#define MIE_WINVADDR			0x14
+#define MIE_WINVADDR0_SHIFT		0
+#define MIE_WINVADDR1_SHIFT		21
+#define MIE_WINVADDR0(x)		((x & 0x7ff) << MIE_WINVADDR0_SHIFT)
+#define MIE_WINVADDR1(x)		(((x - 1) & 0x7ff)\
+						<< MIE_WINVADDR1_SHIFT)
+
+/* PWM Clock Count Register */
+#define MIE_PWMCLKCNT			0x20
+#define MIE_PWMCLKVAL			1
+#define PWMCLKCNT(x)			((x & 0x3fffff) << 4)
+
+/* PWM Control Register 1 */
+#define MIE_PWMVIDTCON1			0x38
+#define MIE_VBPD(x)			((x - 1) << 16)
+#define MIE_VFPD(x)			((x - 1) << 8)
+#define MIE_VSPW(x)			(x - 1)
+
+/* PWM Control Register 2 */
+#define MIE_PWMVIDTCON2			0x3c
+#define MIE_HBPD(x)			((x - 1) << 16)
+#define MIE_HFPD(x)			((x - 1) << 8)
+#define MIE_HSPW(x)			(x - 1)
+
+/* AUX Control Register */
+#define MIE_AUXCON			0x300
+#define MIE_DITHCON			1
+#define MIE_DITHCON_EN			0x1
+#define MIE_DITHCON_DISABLE		0
+
+#define MIE_RGBMODE			2
+#define MIE_RGBMODE_SHIFT		1
+#define MIE_RGB6MODE			(0 << MIE_RGBMODE_SHIFT)
+#define MIE_RGB8MODE			(1 << MIE_RGBMODE_SHIFT)
+
+#endif /* __EXYNOS_REGS_MIE_H */
+
-- 
1.7.9.5
