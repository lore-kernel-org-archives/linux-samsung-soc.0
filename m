From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 3/3] drm/exynos: Add device tree support for fimc ipp driver
Date: Tue, 16 Apr 2013 19:31:26 +0200
Message-ID: <1366133486-22973-4-git-send-email-s.nawrocki@samsung.com>
References: <1366133486-22973-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:31455 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964879Ab3DPRd1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Apr 2013 13:33:27 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLC00AYCZFQVAP0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Apr 2013 02:33:26 +0900 (KST)
In-reply-to: <1366133486-22973-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

This patch adds OF initialization support for the FIMC driver.
The binding documentation can be found at Documentation/devicetree/
bindings/media/samsung-fimc.txt.

The syscon regmap interface is used to serialize access to the
shared CAMBLK registers from within the V4L2 FIMC-IS and the DRM
FIMC drivers. The DRM driver uses this interface for setting up
the FIFO data link between FIMD and FIMC IP blocks, while the V4L2
one for setting up a data link between the camera ISP and FIMC for
camera capture. The CAMBLK registers are not accessed any more
through a statically mapped IO. Synchronized access to these
registers is required for simultaneous operation of the camera
ISP and the DRM IPP on Exynos4x12.

Exynos4 is going to be a dt-only platform since 3.10, thus the
driver data and driver_ids static data structures are removed.

Camera input signal polarities are not currently parsed from the
device tree.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/Kconfig           |    2 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c |  101 +++++++++++++++---------------
 drivers/gpu/drm/exynos/regs-fimc.h       |    7 +--
 3 files changed, 53 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 406f32a..5c4be2a 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -56,7 +56,7 @@ config DRM_EXYNOS_IPP
 
 config DRM_EXYNOS_FIMC
 	bool "Exynos DRM FIMC"
-	depends on DRM_EXYNOS_IPP
+	depends on DRM_EXYNOS_IPP && MFD_SYSCON && OF
 	help
 	  Choose this option if you want to use Exynos FIMC for DRM.
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 9bea585..f25801e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -12,11 +12,12 @@
  *
  */
 #include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
-#include <plat/map-base.h>
 
 #include <drm/drmP.h>
 #include <drm/exynos_drm.h>
@@ -140,15 +141,6 @@ struct fimc_capability {
 };
 
 /*
- * A structure of fimc driver data.
- *
- * @parent_clk: name of parent clock.
- */
-struct fimc_driverdata {
-	char	*parent_clk;
-};
-
-/*
  * A structure of fimc context.
  *
  * @ippdrv: prepare initialization using ippdrv.
@@ -158,6 +150,7 @@ struct fimc_driverdata {
  * @lock: locking of operations.
  * @clocks: fimc clocks.
  * @clk_frequency: LCLK clock frequency.
+ * @sysreg: handle to SYSREG block regmap.
  * @sc: scaler infomations.
  * @pol: porarity of writeback.
  * @id: fimc id.
@@ -172,8 +165,8 @@ struct fimc_context {
 	struct mutex	lock;
 	struct clk	*clocks[FIMC_CLKS_MAX];
 	u32		clk_frequency;
+	struct regmap	*sysreg;
 	struct fimc_scaler	sc;
-	struct fimc_driverdata	*ddata;
 	struct exynos_drm_ipp_pol	pol;
 	int	id;
 	int	irq;
@@ -217,17 +210,13 @@ static void fimc_sw_reset(struct fimc_context *ctx)
 	fimc_write(0x0, EXYNOS_CIFCNTSEQ);
 }
 
-static void fimc_set_camblk_fimd0_wb(struct fimc_context *ctx)
+static int fimc_set_camblk_fimd0_wb(struct fimc_context *ctx)
 {
-	u32 camblk_cfg;
-
 	DRM_DEBUG_KMS("%s\n", __func__);
 
-	camblk_cfg = readl(SYSREG_CAMERA_BLK);
-	camblk_cfg &= ~(SYSREG_FIMD0WB_DEST_MASK);
-	camblk_cfg |= ctx->id << (SYSREG_FIMD0WB_DEST_SHIFT);
-
-	writel(camblk_cfg, SYSREG_CAMERA_BLK);
+	return regmap_update_bits(ctx->sysreg, SYSREG_CAMERA_BLK,
+				  SYSREG_FIMD0WB_DEST_MASK,
+				  ctx->id << SYSREG_FIMD0WB_DEST_SHIFT);
 }
 
 static void fimc_set_type_ctrl(struct fimc_context *ctx, enum fimc_wb wb)
@@ -1628,7 +1617,9 @@ static int fimc_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
 		fimc_handle_lastend(ctx, true);
 
 		/* setup FIMD */
-		fimc_set_camblk_fimd0_wb(ctx);
+		ret = fimc_set_camblk_fimd0_wb(ctx);
+		if (ret < 0)
+			return ret;
 
 		set_wb.enable = 1;
 		set_wb.refresh = property->refresh_rate;
@@ -1784,26 +1775,50 @@ e_clk_free:
 	return ret;
 }
 
+static int fimc_parse_dt(struct fimc_context *ctx)
+{
+	struct device_node *node = ctx->dev->of_node;
+
+	if (!of_property_read_bool(node, "samsung,lcd-wb"))
+		return -ENODEV;
+
+	if (of_property_read_u32(node, "clock-frequency",
+					&ctx->clk_frequency))
+		ctx->clk_frequency = FIMC_DEFAULT_LCLK_FREQUENCY;
+
+	ctx->id = of_alias_get_id(node, "fimc");
+	if (ctx->id < 0)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int fimc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct fimc_context *ctx;
 	struct resource *res;
 	struct exynos_drm_ippdrv *ippdrv;
-	struct exynos_drm_fimc_pdata *pdata;
-	struct fimc_driverdata *ddata;
 	int ret;
 
-	pdata = pdev->dev.platform_data;
-	if (!pdata) {
-		dev_err(dev, "no platform data specified.\n");
-		return -EINVAL;
-	}
+	if (!dev->of_node)
+		return -ENODEV;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	ctx->dev = dev;
+
+	ret = fimc_parse_dt(ctx);
+	if (ret < 0)
+		return ret;
+
+	ctx->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
+						"samsung,sysreg");
+	if (IS_ERR(ctx->sysreg))
+		return PTR_ERR(ctx->sysreg);
+
 	/* resource memory */
 	ctx->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ctx->regs = devm_ioremap_resource(dev, ctx->regs_res);
@@ -1828,10 +1843,6 @@ static int fimc_probe(struct platform_device *pdev)
 	ret = fimc_setup_clocks(ctx);
 	if (ret < 0)
 		goto err_free_irq;
-	/* context initailization */
-	ctx->id = pdev->id;
-	ctx->pol = pdata->pol;
-	ctx->ddata = ddata;
 
 	ippdrv = &ctx->ippdrv;
 	ippdrv->dev = dev;
@@ -1941,36 +1952,22 @@ static int fimc_runtime_resume(struct device *dev)
 }
 #endif
 
-static struct fimc_driverdata exynos4210_fimc_data = {
-	.parent_clk = "mout_mpll",
-};
-
-static struct fimc_driverdata exynos4410_fimc_data = {
-	.parent_clk = "mout_mpll_user",
-};
-
-static struct platform_device_id fimc_driver_ids[] = {
-	{
-		.name		= "exynos4210-fimc",
-		.driver_data	= (unsigned long)&exynos4210_fimc_data,
-	}, {
-		.name		= "exynos4412-fimc",
-		.driver_data	= (unsigned long)&exynos4410_fimc_data,
-	},
-	{},
-};
-MODULE_DEVICE_TABLE(platform, fimc_driver_ids);
-
 static const struct dev_pm_ops fimc_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(fimc_suspend, fimc_resume)
 	SET_RUNTIME_PM_OPS(fimc_runtime_suspend, fimc_runtime_resume, NULL)
 };
 
+static const struct of_device_id fimc_of_match[] = {
+	{ .compatible = "samsung,exynos4210-fimc" },
+	{ .compatible = "samsung,exynos4212-fimc" },
+	{ },
+};
+
 struct platform_driver fimc_driver = {
 	.probe		= fimc_probe,
 	.remove		= fimc_remove,
-	.id_table	= fimc_driver_ids,
 	.driver		= {
+		.of_match_table = fimc_of_match,
 		.name	= "exynos-drm-fimc",
 		.owner	= THIS_MODULE,
 		.pm	= &fimc_pm_ops,
diff --git a/drivers/gpu/drm/exynos/regs-fimc.h b/drivers/gpu/drm/exynos/regs-fimc.h
index b4f9ca1..3049613 100644
--- a/drivers/gpu/drm/exynos/regs-fimc.h
+++ b/drivers/gpu/drm/exynos/regs-fimc.h
@@ -661,9 +661,8 @@
 #define EXYNOS_CLKSRC_SCLK				(1 << 1)
 
 /* SYSREG for FIMC writeback */
-#define SYSREG_CAMERA_BLK			(S3C_VA_SYS + 0x0218)
-#define SYSREG_ISP_BLK				(S3C_VA_SYS + 0x020c)
-#define SYSREG_FIMD0WB_DEST_MASK	(0x3 << 23)
-#define SYSREG_FIMD0WB_DEST_SHIFT	23
+#define SYSREG_CAMERA_BLK			(0x0218)
+#define SYSREG_FIMD0WB_DEST_MASK		(0x3 << 23)
+#define SYSREG_FIMD0WB_DEST_SHIFT		23
 
 #endif /* EXYNOS_REGS_FIMC_H */
-- 
1.7.9.5
