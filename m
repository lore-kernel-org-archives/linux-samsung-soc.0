From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [RFC 3/4] drm: exynos: add IELCD post processor
Date: Wed, 19 Mar 2014 19:52:54 +0530
Message-ID: <1395238975-24600-4-git-send-email-ajaykumar.rs@samsung.com>
References: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:58341 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965308AbaCSOWo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 10:22:44 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N2O00AGLT9ULF70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Mar 2014 23:22:43 +0900 (KST)
In-reply-to: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, marcheu@chromium.org, Ajay Kumar <ajaykumar.rs@samsung.com>, Shirish S <s.shirish@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

Add post processor ops for IELCD and their support functions.
Expose an interface for the FIMD to register IELCD PP.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
Signed-off-by: Shirish S <s.shirish@samsung.com>
Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/Makefile       |   3 +-
 drivers/gpu/drm/exynos/exynos_ielcd.c | 295 ++++++++++++++++++++++++++++++++++
 include/video/samsung_fimd.h          |  43 +++++
 3 files changed, 340 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/exynos/exynos_ielcd.c

diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
index 653eab5..f3d7314 100644
--- a/drivers/gpu/drm/exynos/Makefile
+++ b/drivers/gpu/drm/exynos/Makefile
@@ -10,7 +10,8 @@ exynosdrm-y := exynos_drm_drv.o exynos_drm_encoder.o \
 
 exynosdrm-$(CONFIG_DRM_EXYNOS_IOMMU) += exynos_drm_iommu.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DMABUF) += exynos_drm_dmabuf.o
-exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)	+= exynos_drm_fimd.o exynos_mdnie.o
+exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)	+= exynos_drm_fimd.o exynos_mdnie.o \
+						exynos_ielcd.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)	+= exynos_drm_dsi.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_DP)	+= exynos_dp_core.o exynos_dp_reg.o
 exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)	+= exynos_hdmi.o exynos_mixer.o
diff --git a/drivers/gpu/drm/exynos/exynos_ielcd.c b/drivers/gpu/drm/exynos/exynos_ielcd.c
new file mode 100644
index 0000000..33d0d34
--- /dev/null
+++ b/drivers/gpu/drm/exynos/exynos_ielcd.c
@@ -0,0 +1,295 @@
+/* drivers/gpu/drm/exynos/exynos_ielcd.c
+ *
+ * Samsung IELCD driver
+ *
+ * Copyright (C) 2014 Samsung Electronics Co., Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the
+ * Free Software Foundation; either version 2 of the License, or (at your
+ * option) any later version.
+*/
+
+#include <linux/errno.h>
+#include <linux/of_device.h>
+#include <linux/delay.h>
+
+#include <video/samsung_fimd.h>
+
+#include <drm/drmP.h>
+
+#include "exynos_drm_drv.h"
+#include "exynos_fimd_pp.h"
+
+#define exynos_ielcd_readl(addr)	readl(ielcd->exynos_ielcd_base + addr)
+#define exynos_ielcd_writel(addr, val) \
+				writel(val, ielcd->exynos_ielcd_base + addr)
+#define IELCD_TIMEOUT_CNT	1000
+
+struct ielcd_context {
+	void __iomem			*exynos_ielcd_base;
+	unsigned		vdisplay;
+	unsigned		vsync_len;
+	unsigned		vbpd;
+	unsigned		vfpd;
+	unsigned		hdisplay;
+	unsigned		hsync_len;
+	unsigned		hbpd;
+	unsigned		hfpd;
+	unsigned		vidcon0;
+	unsigned		vidcon1;
+};
+
+static int ielcd_logic_start(struct ielcd_context *ielcd)
+{
+	exynos_ielcd_writel(IELCD_AUXCON, IELCD_MAGIC_KEY);
+
+	return 0;
+}
+
+static void ielcd_set_polarity(struct ielcd_context *ielcd)
+{
+	unsigned int cfg;
+
+	cfg = exynos_ielcd_readl(IELCD_VIDCON1);
+
+	cfg &= ~(VIDCON1_INV_VCLK | VIDCON1_INV_HSYNC
+				| VIDCON1_INV_VSYNC | VIDCON1_INV_VDEN);
+	cfg |= ielcd->vidcon1;
+	exynos_ielcd_writel(IELCD_VIDCON1, cfg);
+}
+
+static void ielcd_set_timing(struct ielcd_context *ielcd)
+{
+	unsigned int cfg;
+
+	/*LCD verical porch setting*/
+	cfg = VIDTCON0_VBPD(ielcd->vbpd - 1) |
+		VIDTCON0_VFPD(ielcd->vfpd - 1) |
+		VIDTCON0_VSPW(ielcd->vsync_len - 1);
+
+	exynos_ielcd_writel(IELCD_VIDTCON0, cfg);
+	/*LCD horizontal porch setting*/
+	cfg = VIDTCON1_HBPD(ielcd->hbpd - 1) |
+		VIDTCON1_HFPD(ielcd->hfpd - 1) |
+		VIDTCON1_HSPW(ielcd->hsync_len - 1);
+
+	exynos_ielcd_writel(IELCD_VIDTCON1, cfg);
+}
+
+static void ielcd_set_lcd_size(struct ielcd_context *ielcd)
+{
+	unsigned int cfg;
+
+	cfg = (IELCD_VIDTCON2_LINEVAL(ielcd->vdisplay - 1) |
+				IELCD_VIDTCON2_HOZVAL(ielcd->hdisplay - 1));
+	exynos_ielcd_writel(IELCD_VIDTCON2, cfg);
+
+	/* window0 position setting */
+	exynos_ielcd_writel(IELCD_VIDOSD0A, 0);
+	cfg = (IELCD_VIDOSDB_XPOS_END(ielcd->hdisplay - 1)) |
+			(IELCD_VIDOSDB_YPOS_END(ielcd->vdisplay - 1));
+	exynos_ielcd_writel(IELCD_VIDOSD0B, cfg);
+
+	/* window0 osd size setting */
+	exynos_ielcd_writel(IELCD_VIDOSD0C, ielcd->hdisplay *
+							ielcd->vdisplay);
+
+	/* window0 page size(bytes) */
+	exynos_ielcd_writel(IELCD_VIDW00ADD2, ielcd->hdisplay * 4);
+}
+
+static int exynos_ielcd_hw_trigger_check(struct ielcd_context *ielcd)
+{
+	unsigned int cfg;
+	unsigned int count = 0;
+
+	cfg = exynos_ielcd_readl(IELCD_TRIGCON);
+	cfg &= ~(SWTRGCMD_W0BUF | TRGMODE_W0BUF);
+	cfg |= (SWTRGCMD_W0BUF | TRGMODE_W0BUF);
+	exynos_ielcd_writel(IELCD_TRIGCON, cfg);
+
+	do {
+		cfg = exynos_ielcd_readl(IELCD_SHADOWCON);
+		cfg |= IELCD_W0_SW_SHADOW_UPTRIG;
+		exynos_ielcd_writel(IELCD_SHADOWCON, cfg);
+
+		cfg = exynos_ielcd_readl(IELCD_VIDCON0);
+		cfg |= IELCD_SW_SHADOW_UPTRIG;
+		exynos_ielcd_writel(IELCD_VIDCON0, cfg);
+
+		count++;
+		if (count > IELCD_TIMEOUT_CNT) {
+			DRM_ERROR("ielcd start fail\n");
+			return -EBUSY;
+		}
+		udelay(10);
+	} while (exynos_ielcd_readl(IELCD_WINCON0) & IELCD_TRGSTATUS);
+
+	return 0;
+}
+
+static int exynos_ielcd_display_on(struct ielcd_context *ielcd)
+{
+	unsigned int cfg;
+
+	cfg = exynos_ielcd_readl(IELCD_VIDCON0);
+	cfg |= (VIDCON0_ENVID | VIDCON0_ENVID_F);
+	exynos_ielcd_writel(IELCD_VIDCON0, cfg);
+
+	return exynos_ielcd_hw_trigger_check(ielcd);
+}
+
+int exynos_ielcd_display_off(void *pp_ctx)
+{
+	struct ielcd_context *ielcd = pp_ctx;
+	unsigned int cfg, ielcd_count = 0;
+	int ret = 0;
+
+	cfg = exynos_ielcd_readl(IELCD_VIDCON0);
+	cfg &= ~(VIDCON0_ENVID | VIDCON0_ENVID_F);
+
+	exynos_ielcd_writel(IELCD_VIDCON0, cfg);
+
+	do {
+		if (++ielcd_count > IELCD_TIMEOUT_CNT) {
+			DRM_ERROR("ielcd off TIMEDOUT\n");
+			ret = -ETIMEDOUT;
+			break;
+		}
+
+		if (!(exynos_ielcd_readl(IELCD_VIDCON1) &
+						VIDCON1_LINECNT_MASK)) {
+			ret = 0;
+			break;
+		}
+		udelay(200);
+	} while (1);
+
+	return ret;
+}
+
+static void exynos_ielcd_config_rgb(struct ielcd_context *ielcd)
+{
+	unsigned int cfg;
+
+	cfg = exynos_ielcd_readl(IELCD_VIDCON0);
+	cfg &= ~(VIDCON0_VIDOUT_MASK | VIDCON0_VCLK_MASK);
+	cfg |= VIDCON0_VIDOUT_RGB;
+	cfg |= VIDCON0_VCLK_NORMAL;
+
+	exynos_ielcd_writel(IELCD_VIDCON0, cfg);
+}
+
+int exynos_ielcd_power_on(void *pp_ctx)
+{
+	struct ielcd_context *ielcd = pp_ctx;
+	unsigned int cfg;
+	int ret = 0;
+
+	ielcd_logic_start(ielcd);
+	ielcd_set_polarity(ielcd);
+
+	ielcd_set_lcd_size(ielcd);
+	ielcd_set_timing(ielcd);
+
+	/* window0 setting , fixed */
+	cfg = WINCONx_ENLOCAL | WINCON0_BPPMODE_24BPP_888 | WINCONx_ENWIN;
+	exynos_ielcd_writel(IELCD_WINCON0, cfg);
+
+	exynos_ielcd_config_rgb(ielcd);
+
+	ret = exynos_ielcd_display_on(ielcd);
+	if (ret) {
+		DRM_ERROR("IELCD failed to start\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void exynos_ielcd_mode_set(void *pp_ctx,
+				const struct drm_display_mode *in_mode)
+{
+	struct ielcd_context *ielcd = pp_ctx;
+
+	ielcd->vdisplay = in_mode->crtc_vdisplay;
+	ielcd->vsync_len = in_mode->crtc_vsync_end - in_mode->crtc_vsync_start;
+	ielcd->vbpd = in_mode->crtc_vtotal - in_mode->crtc_vsync_end;
+	ielcd->vfpd = in_mode->crtc_vsync_start - in_mode->crtc_vdisplay;
+
+	ielcd->hdisplay = in_mode->crtc_hdisplay;
+	ielcd->hsync_len = in_mode->crtc_hsync_end - in_mode->crtc_hsync_start;
+	ielcd->hbpd = in_mode->crtc_htotal - in_mode->crtc_hsync_end;
+	ielcd->hfpd = in_mode->crtc_hsync_start - in_mode->crtc_hdisplay;
+}
+
+static struct exynos_fimd_pp_ops ielcd_ops = {
+	.power_on =	exynos_ielcd_power_on,
+	.power_off =	exynos_ielcd_display_off,
+	.mode_set =	exynos_ielcd_mode_set,
+};
+
+static struct exynos_fimd_pp ielcd_pp = {
+	.ops =		&ielcd_ops,
+};
+
+int exynos_ielcd_init(struct device *dev, struct exynos_fimd_pp **pp)
+{
+	struct device_node *ielcd_np;
+	struct ielcd_context *ielcd;
+	u32 addr[2];
+	int ret = 0;
+
+	ielcd = kzalloc(sizeof(struct ielcd_context), GFP_KERNEL);
+	if (!ielcd) {
+		DRM_ERROR("failed to allocate ielcd\n");
+		ret = -ENOMEM;
+		goto error0;
+	}
+
+	ielcd_np = of_parse_phandle(dev->of_node, "samsung,ielcd", 0);
+	if (!ielcd_np) {
+		DRM_ERROR("No ielcd node present, "
+					"MDNIE feature will be disabled\n");
+		ret = -ENODEV;
+		goto error1;
+	}
+
+	if (of_property_read_u32_array(ielcd_np, "reg", addr, 2)) {
+		DRM_ERROR("failed to get base address for IELCD\n");
+		ret = -ENOMEM;
+		goto error1;
+	}
+
+	ielcd->exynos_ielcd_base = ioremap(addr[0], addr[1]);
+	if (!ielcd->exynos_ielcd_base) {
+		DRM_ERROR("failed to ioremap ielcd device\n");
+		ret = -ENOMEM;
+		goto error1;
+	}
+
+	if (of_get_property(dev->of_node, "samsung,fimd-vidout-rgb", NULL))
+		ielcd->vidcon0 |= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB;
+	if (of_get_property(dev->of_node, "samsung,fimd-inv-hsync", NULL))
+		ielcd->vidcon1 |= VIDCON1_INV_HSYNC;
+	if (of_get_property(dev->of_node, "samsung,fimd-inv-vsync", NULL))
+		ielcd->vidcon1 |= VIDCON1_INV_VSYNC;
+	if (of_get_property(dev->of_node, "samsung,fimd-inv-vclk", NULL))
+		ielcd->vidcon1 |= VIDCON1_INV_VCLK;
+	if (of_get_property(dev->of_node, "samsung,fimd-inv-vden", NULL))
+		ielcd->vidcon1 |= VIDCON1_INV_VDEN;
+
+	ielcd_pp.ctx = ielcd;
+
+	*pp = &ielcd_pp;
+
+	DRM_INFO("IELCD initialzation done\n");
+
+	return 0;
+error1:
+	kfree(ielcd);
+error0:
+	return ret;
+}
+EXPORT_SYMBOL(exynos_ielcd_init);
diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
index 3ff7cad..cc64757 100644
--- a/include/video/samsung_fimd.h
+++ b/include/video/samsung_fimd.h
@@ -60,7 +60,9 @@
 #define VIDCON0_CLKVAL_F_SHIFT			6
 #define VIDCON0_CLKVAL_F_LIMIT			0xff
 #define VIDCON0_CLKVAL_F(_x)			((_x) << 6)
+#define VIDCON0_VCLK_MASK			(1 << 5)
 #define VIDCON0_VCLKFREE			(1 << 5)
+#define VIDCON0_VCLK_NORMAL			(0 << 5)
 #define VIDCON0_CLKDIR				(1 << 4)
 
 #define VIDCON0_CLKSEL_MASK			(0x3 << 2)
@@ -466,3 +468,44 @@
 #define FIMD_V8_VIDTCON2	0x20018
 #define FIMD_V8_VIDTCON3	0x2001C
 #define FIMD_V8_VIDCON1		0x20004
+
+/* IELCD Register Offsets */
+#define IELCD_VIDCON0			(0x0000)
+#define IELCD_VIDCON1			(0x0004)
+
+#define IELCD_VIDTCON0			(0x0010)
+#define IELCD_VIDTCON1			(0x0014)
+#define IELCD_VIDTCON2			(0x0018)
+
+#define IELCD_WINCON0			(0x0020)
+#define IELCD_TRGSTATUS			(1 << 25)
+
+#define IELCD_SHADOWCON			(0x0034)
+
+#define IELCD_VIDOSD0A			(0x0040)
+#define IELCD_VIDOSD0B			(0x0044)
+#define IELCD_VIDOSD0C			(0x0048)
+#define IELCD_VIDW00ADD2		(0x0100)
+
+#define IELCD_TRIGCON			(0x01A4)
+#define IELCD_AUXCON			(0x0278)
+
+/* Value */
+#define IELCD_MAGIC_KEY			(0x2ff47)
+
+/* Register bit */
+#define IELCD_VIDTCON2_LINEVAL(_x)	((_x) << 12)
+#define IELCD_VIDTCON2_HOZVAL(_x)	((_x) << 0)
+
+/* IELCD_VIDCON0 */
+#define IELCD_SW_SHADOW_UPTRIG		(1 << 14)
+
+/* IELCD_SHADOWCON */
+#define IELCD_W0_SW_SHADOW_UPTRIG	(1 << 16)
+
+/* IELCD_IELCD_VIDOSD */
+#define IELCD_VIDOSDB_XPOS_END(_x)	((_x) << 11)
+#define IELCD_VIDOSDB_YPOS_END(_x)	((_x) << 0)
+
+#define SWTRGCMD_W0BUF		(1 << 6)
+#define TRGMODE_W0BUF		(1 << 5)
-- 
1.8.1.2
