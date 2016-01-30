From: Chanho Park <parkch98@gmail.com>
Subject: [PATCH] drm/exynos: support exynos5422 mipi-dsi
Date: Sat, 30 Jan 2016 23:11:50 +0900
Message-ID: <1454163110-20103-1-git-send-email-parkch98@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f169.google.com ([209.85.192.169]:36532 "EHLO
	mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754213AbcA3OMB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 30 Jan 2016 09:12:01 -0500
Received: by mail-pf0-f169.google.com with SMTP id n128so57467069pfn.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Jan 2016 06:12:00 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Chanho Park <chanho61.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

From: Chanho Park <chanho61.park@samsung.com>

This patch supports mipi dsi for exynos5422. The dsi register
offsets of the exynos5422 are similar with exynos5433. However,
the values of the registers are quite different from the
exynos5433. For example, the exynos5422 uses sw reset like
previous chips.

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
 .../bindings/display/exynos/exynos_dsim.txt        |  1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c            | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index 0e6f0c0..22756b3 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -6,6 +6,7 @@ Required properties:
 		"samsung,exynos4210-mipi-dsi" /* for Exynos4 SoCs */
 		"samsung,exynos4415-mipi-dsi" /* for Exynos4415 SoC */
 		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
+		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index d84a498..3eff6bf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -408,6 +408,24 @@ static unsigned int reg_values[] = {
 	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0b),
 };
 
+static unsigned int exynos5422_reg_values[] = {
+	[RESET_TYPE] = DSIM_SWRST,
+	[PLL_TIMER] = 500,
+	[STOP_STATE_CNT] = 0xf,
+	[PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0xaf),
+	[PHYCTRL_VREG_LP] = 0,
+	[PHYCTRL_SLEW_UP] = 0,
+	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x08),
+	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0d),
+	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x09),
+	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x30),
+	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0e),
+	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x0a),
+	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x0c),
+	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x11),
+	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0d),
+};
+
 static unsigned int exynos5433_reg_values[] = {
 	[RESET_TYPE] = DSIM_FUNCRST,
 	[PLL_TIMER] = 22200,
@@ -482,6 +500,17 @@ static struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
 	.reg_values = exynos5433_reg_values,
 };
 
+static struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
+	.reg_ofs = exynos5433_reg_ofs,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.num_clks = 2,
+	.max_freq = 1500,
+	.wait_for_reset = 1,
+	.num_bits_resol = 12,
+	.reg_values = exynos5422_reg_values,
+};
+
 static struct of_device_id exynos_dsi_of_match[] = {
 	{ .compatible = "samsung,exynos3250-mipi-dsi",
 	  .data = &exynos3_dsi_driver_data },
@@ -491,6 +520,8 @@ static struct of_device_id exynos_dsi_of_match[] = {
 	  .data = &exynos4415_dsi_driver_data },
 	{ .compatible = "samsung,exynos5410-mipi-dsi",
 	  .data = &exynos5_dsi_driver_data },
+	{ .compatible = "samsung,exynos5422-mipi-dsi",
+	  .data = &exynos5422_dsi_driver_data },
 	{ .compatible = "samsung,exynos5433-mipi-dsi",
 	  .data = &exynos5433_dsi_driver_data },
 	{ }
-- 
2.5.0
