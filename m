From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 03/22] drm/exynos: gsc: add device tree support and remove
 usage of static mappings
Date: Mon, 30 Nov 2015 14:53:18 +0100
Message-ID: <1448891617-18830-4-git-send-email-m.szyprowski@samsung.com>
References: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:50748 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754089AbbK3Nxs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Nov 2015 08:53:48 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NYM00NV1RXL41B0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Nov 2015 13:53:45 +0000 (GMT)
In-reply-to: <1448891617-18830-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Gustavo Padovan <gustavo@padovan.org>, Javier Martinez Canillas <javier@osg.samsung.com>

From: Seung-Woo Kim <sw0312.kim@samsung.com>

This patch adds device tree support for exynos_drm_gsc. This patch
also fixed build issue on non-Exynos platforms, thus dependency on
!ARCH_MULTIPLATFORM can be now removed. The driver cannot be used
simultaneously with V4L2 Mem2Mem GScaller driver thought.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
[updated commit message, removed the need for wb-lcd property, because
all gscallers have support for lcd writeback, replaced dependency on
!ARCH_MULTIPLATFORM with !VIDEO_SAMSUNG_EXYNOS_GSC]
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../devicetree/bindings/media/exynos5-gsc.txt      |  4 +++
 drivers/gpu/drm/exynos/Kconfig                     |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c            | 30 +++++++++++++++++++---
 drivers/gpu/drm/exynos/regs-gsc.h                  |  4 +--
 4 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/exynos5-gsc.txt b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
index 0604d42f38d1..5fe9372abb37 100644
--- a/Documentation/devicetree/bindings/media/exynos5-gsc.txt
+++ b/Documentation/devicetree/bindings/media/exynos5-gsc.txt
@@ -7,6 +7,10 @@ Required properties:
 - reg: should contain G-Scaler physical address location and length.
 - interrupts: should contain G-Scaler interrupt number
 
+Optional properties:
+- samsung,sysreg: handle to syscon used to control the system registers to
+  set writeback input and destination
+
 Example:
 
 gsc_0:  gsc@0x13e00000 {
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 96e86cf4455b..83efca941388 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -118,7 +118,7 @@ config DRM_EXYNOS_ROTATOR
 
 config DRM_EXYNOS_GSC
 	bool "GScaler"
-	depends on DRM_EXYNOS_IPP && ARCH_EXYNOS5 && !ARCH_MULTIPLATFORM
+	depends on DRM_EXYNOS_IPP && ARCH_EXYNOS5 && !VIDEO_SAMSUNG_EXYNOS_GSC
 	help
 	  Choose this option if you want to use Exynos GSC for DRM.
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index ed55d37b6330..7aecd23cfa11 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -15,7 +15,8 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
-#include <plat/map-base.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 
 #include <drm/drmP.h>
 #include <drm/exynos_drm.h>
@@ -126,6 +127,7 @@ struct gsc_capability {
  * @ippdrv: prepare initialization using ippdrv.
  * @regs_res: register resources.
  * @regs: memory mapped io registers.
+ * @sysreg: handle to SYSREG block regmap.
  * @lock: locking of operations.
  * @gsc_clk: gsc gate clock.
  * @sc: scaler infomations.
@@ -138,6 +140,7 @@ struct gsc_context {
 	struct exynos_drm_ippdrv	ippdrv;
 	struct resource	*regs_res;
 	void __iomem	*regs;
+	struct regmap	*sysreg;
 	struct mutex	lock;
 	struct clk	*gsc_clk;
 	struct gsc_scaler	sc;
@@ -437,9 +440,12 @@ static int gsc_sw_reset(struct gsc_context *ctx)
 
 static void gsc_set_gscblk_fimd_wb(struct gsc_context *ctx, bool enable)
 {
-	u32 gscblk_cfg;
+	unsigned int gscblk_cfg;
 
-	gscblk_cfg = readl(SYSREG_GSCBLK_CFG1);
+	if (!ctx->sysreg)
+		return;
+
+	regmap_read(ctx->sysreg, SYSREG_GSCBLK_CFG1, &gscblk_cfg);
 
 	if (enable)
 		gscblk_cfg |= GSC_BLK_DISP1WB_DEST(ctx->id) |
@@ -448,7 +454,7 @@ static void gsc_set_gscblk_fimd_wb(struct gsc_context *ctx, bool enable)
 	else
 		gscblk_cfg |= GSC_BLK_PXLASYNC_LO_MASK_WB(ctx->id);
 
-	writel(gscblk_cfg, SYSREG_GSCBLK_CFG1);
+	regmap_write(ctx->sysreg, SYSREG_GSCBLK_CFG1, gscblk_cfg);
 }
 
 static void gsc_handle_irq(struct gsc_context *ctx, bool enable,
@@ -1663,6 +1669,15 @@ static int gsc_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
+	if (dev->of_node) {
+		ctx->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
+							"samsung,sysreg");
+		if (IS_ERR(ctx->sysreg)) {
+			dev_warn(dev, "failed to get system register.\n");
+			ctx->sysreg = NULL;
+		}
+	}
+
 	/* clock control */
 	ctx->gsc_clk = devm_clk_get(dev, "gscl");
 	if (IS_ERR(ctx->gsc_clk)) {
@@ -1796,6 +1811,12 @@ static const struct dev_pm_ops gsc_pm_ops = {
 	SET_RUNTIME_PM_OPS(gsc_runtime_suspend, gsc_runtime_resume, NULL)
 };
 
+static const struct of_device_id exynos_drm_gsc_of_match[] = {
+	{ .compatible = "samsung,exynos5-gsc" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, exynos_drm_gsc_of_match);
+
 struct platform_driver gsc_driver = {
 	.probe		= gsc_probe,
 	.remove		= gsc_remove,
@@ -1803,6 +1824,7 @@ struct platform_driver gsc_driver = {
 		.name	= "exynos-drm-gsc",
 		.owner	= THIS_MODULE,
 		.pm	= &gsc_pm_ops,
+		.of_match_table = of_match_ptr(exynos_drm_gsc_of_match),
 	},
 };
 
diff --git a/drivers/gpu/drm/exynos/regs-gsc.h b/drivers/gpu/drm/exynos/regs-gsc.h
index 9ad592707aaf..4704a993cbb7 100644
--- a/drivers/gpu/drm/exynos/regs-gsc.h
+++ b/drivers/gpu/drm/exynos/regs-gsc.h
@@ -273,12 +273,12 @@
 #define GSC_CLK_GATE_MODE_SNOOP_CNT(x)	((x) << 0)
 
 /* SYSCON. GSCBLK_CFG */
-#define SYSREG_GSCBLK_CFG1		(S3C_VA_SYS + 0x0224)
+#define SYSREG_GSCBLK_CFG1		0x0224
 #define GSC_BLK_DISP1WB_DEST(x)		(x << 10)
 #define GSC_BLK_SW_RESET_WB_DEST(x)	(1 << (18 + x))
 #define GSC_BLK_PXLASYNC_LO_MASK_WB(x)	(0 << (14 + x))
 #define GSC_BLK_GSCL_WB_IN_SRC_SEL(x)	(1 << (2 * x))
-#define SYSREG_GSCBLK_CFG2		(S3C_VA_SYS + 0x2000)
+#define SYSREG_GSCBLK_CFG2		0x2000
 #define PXLASYNC_LO_MASK_CAMIF_GSCL(x)	(1 << (x))
 
 #endif /* EXYNOS_REGS_GSC_H_ */
-- 
1.9.2
