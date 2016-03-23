From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/3] phy: exynos-mipi-video: Add support for Exynos 5420 and
 5433 SoCs
Date: Wed, 23 Mar 2016 12:09:18 +0100
Message-ID: <1458731358-773-4-git-send-email-m.szyprowski@samsung.com>
References: <1458731358-773-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:48308 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755061AbcCWLJm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 Mar 2016 07:09:42 -0400
In-reply-to: <1458731358-773-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kishon Vijay Abraham I <kishon@ti.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

This patch adds support for MIPI DPHYs found in Exynos5420-compatible
(5420, 5422 and 5800) and Exynos5433 SoCs. Those SoCs differs from
earlier by different offset of MIPI DPHY registers in PMU controllers
(Exynos 5420-compatible case) or by moving MIPI DPHY reset registers to
separate system register controllers (Exynos 5433 case). In both case
also additional 5th PHY (MIPI CSIS 2) has been added.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 .../devicetree/bindings/phy/samsung-phy.txt        |  18 ++-
 drivers/phy/phy-exynos-mipi-video.c                | 129 ++++++++++++++++++++-
 include/linux/mfd/syscon/exynos5-pmu.h             |   3 +
 3 files changed, 147 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index 0289d3b..9872ba8 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -2,9 +2,20 @@ Samsung S5P/EXYNOS SoC series MIPI CSIS/DSIM DPHY
 -------------------------------------------------
 
 Required properties:
-- compatible : should be "samsung,s5pv210-mipi-video-phy";
+- compatible : should be one of the listed compatibles:
+	- "samsung,s5pv210-mipi-video-phy"
+	- "samsung,exynos5420-mipi-video-phy"
+	- "samsung,exynos5433-mipi-video-phy"
 - #phy-cells : from the generic phy bindings, must be 1;
-- syscon - phandle to the PMU system controller;
+
+In case of s5pv210 and exynos5420 compatible PHYs:
+- syscon - phandle to the PMU system controller
+
+In case of exynos5433 compatible PHY:
+ - samsung,pmu-syscon - phandle to the PMU system controller
+ - samsung,disp-sysreg - phandle to the DISP system registers controller
+ - samsung,cam0-sysreg - phandle to the CAM0 system registers controller
+ - samsung,cam1-sysreg - phandle to the CAM1 system registers controller
 
 For "samsung,s5pv210-mipi-video-phy" compatible PHYs the second cell in
 the PHY specifier identifies the PHY and its meaning is as follows:
@@ -12,6 +23,9 @@ the PHY specifier identifies the PHY and its meaning is as follows:
   1 - MIPI DSIM 0,
   2 - MIPI CSIS 1,
   3 - MIPI DSIM 1.
+"samsung,exynos5420-mipi-video-phy" and "samsung,exynos5433-mipi-video-phy"
+supports additional fifth PHY:
+  4 - MIPI CSIS 2.
 
 Samsung EXYNOS SoC series Display Port PHY
 -------------------------------------------------
diff --git a/drivers/phy/phy-exynos-mipi-video.c b/drivers/phy/phy-exynos-mipi-video.c
index 7ba0936..3e6656c 100644
--- a/drivers/phy/phy-exynos-mipi-video.c
+++ b/drivers/phy/phy-exynos-mipi-video.c
@@ -1,7 +1,7 @@
 /*
  * Samsung S5P/EXYNOS SoC series MIPI CSIS/DSIM DPHY driver
  *
- * Copyright (C) 2013 Samsung Electronics Co., Ltd.
+ * Copyright (C) 2013,2016 Samsung Electronics Co., Ltd.
  * Author: Sylwester Nawrocki <s.nawrocki@samsung.com>
  *
  * This program is free software; you can redistribute it and/or modify
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon/exynos4-pmu.h>
+#include <linux/mfd/syscon/exynos5-pmu.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -28,11 +29,15 @@ enum exynos_mipi_phy_id {
 	EXYNOS_MIPI_PHY_ID_DSIM0,
 	EXYNOS_MIPI_PHY_ID_CSIS1,
 	EXYNOS_MIPI_PHY_ID_DSIM1,
+	EXYNOS_MIPI_PHY_ID_CSIS2,
 	EXYNOS_MIPI_PHYS_NUM
 };
 
 enum exynos_mipi_phy_regmap_id {
 	EXYNOS_MIPI_REGMAP_PMU,
+	EXYNOS_MIPI_REGMAP_DISP,
+	EXYNOS_MIPI_REGMAP_CAM0,
+	EXYNOS_MIPI_REGMAP_CAM1,
 	EXYNOS_MIPI_REGMAPS_NUM
 };
 
@@ -97,6 +102,122 @@ static const struct mipi_phy_device_desc s5pv210_mipi_phy = {
 	},
 };
 
+static const struct mipi_phy_device_desc exynos5420_mipi_phy = {
+	.num_regmaps = 1,
+	.regmap_names = {"syscon"},
+	.num_phys = 5,
+	.phys = {
+		{
+			/* EXYNOS_MIPI_PHY_ID_CSIS0 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM0,
+			.enable_val = EXYNOS5_PHY_ENABLE,
+			.enable_reg = EXYNOS5420_MIPI_PHY0_CONTROL,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = EXYNOS5_MIPI_PHY_S_RESETN,
+			.resetn_reg = EXYNOS5420_MIPI_PHY0_CONTROL,
+			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_DSIM0 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS0,
+			.enable_val = EXYNOS5_PHY_ENABLE,
+			.enable_reg = EXYNOS5420_MIPI_PHY0_CONTROL,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = EXYNOS5_MIPI_PHY_M_RESETN,
+			.resetn_reg = EXYNOS5420_MIPI_PHY0_CONTROL,
+			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_CSIS1 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM1,
+			.enable_val = EXYNOS5_PHY_ENABLE,
+			.enable_reg = EXYNOS5420_MIPI_PHY1_CONTROL,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = EXYNOS5_MIPI_PHY_S_RESETN,
+			.resetn_reg = EXYNOS5420_MIPI_PHY1_CONTROL,
+			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_DSIM1 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS1,
+			.enable_val = EXYNOS5_PHY_ENABLE,
+			.enable_reg = EXYNOS5420_MIPI_PHY1_CONTROL,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = EXYNOS5_MIPI_PHY_M_RESETN,
+			.resetn_reg = EXYNOS5420_MIPI_PHY1_CONTROL,
+			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_CSIS2 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
+			.enable_val = EXYNOS5_PHY_ENABLE,
+			.enable_reg = EXYNOS5420_MIPI_PHY2_CONTROL,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = EXYNOS5_MIPI_PHY_S_RESETN,
+			.resetn_reg = EXYNOS5420_MIPI_PHY2_CONTROL,
+			.resetn_map = EXYNOS_MIPI_REGMAP_PMU,
+		},
+	},
+};
+
+#define EXYNOS5433_SYSREG_DISP_MIPI_PHY		0x100C
+#define EXYNOS5433_SYSREG_CAM0_MIPI_DPHY_CON	0x1014
+#define EXYNOS5433_SYSREG_CAM1_MIPI_DPHY_CON	0x1020
+
+static const struct mipi_phy_device_desc exynos5433_mipi_phy = {
+	.num_regmaps = 4,
+	.regmap_names = {
+		"samsung,pmu-syscon",
+		"samsung,disp-sysreg",
+		"samsung,cam0-sysreg",
+		"samsung,cam1-sysreg"
+	},
+	.num_phys = 5,
+	.phys = {
+		{
+			/* EXYNOS_MIPI_PHY_ID_CSIS0 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_DSIM0,
+			.enable_val = EXYNOS5_PHY_ENABLE,
+			.enable_reg = EXYNOS5433_MIPI_PHY0_CONTROL,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(0),
+			.resetn_reg = EXYNOS5433_SYSREG_CAM0_MIPI_DPHY_CON,
+			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_DSIM0 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_CSIS0,
+			.enable_val = EXYNOS5_PHY_ENABLE,
+			.enable_reg = EXYNOS5433_MIPI_PHY0_CONTROL,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(0),
+			.resetn_reg = EXYNOS5433_SYSREG_DISP_MIPI_PHY,
+			.resetn_map = EXYNOS_MIPI_REGMAP_DISP,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_CSIS1 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
+			.enable_val = EXYNOS5_PHY_ENABLE,
+			.enable_reg = EXYNOS5433_MIPI_PHY1_CONTROL,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(1),
+			.resetn_reg = EXYNOS5433_SYSREG_CAM0_MIPI_DPHY_CON,
+			.resetn_map = EXYNOS_MIPI_REGMAP_CAM0,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_DSIM1 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
+			.enable_val = EXYNOS5_PHY_ENABLE,
+			.enable_reg = EXYNOS5433_MIPI_PHY1_CONTROL,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(1),
+			.resetn_reg = EXYNOS5433_SYSREG_DISP_MIPI_PHY,
+			.resetn_map = EXYNOS_MIPI_REGMAP_DISP,
+		}, {
+			/* EXYNOS_MIPI_PHY_ID_CSIS2 */
+			.coupled_phy_id = EXYNOS_MIPI_PHY_ID_NONE,
+			.enable_val = EXYNOS5_PHY_ENABLE,
+			.enable_reg = EXYNOS5433_MIPI_PHY2_CONTROL,
+			.enable_map = EXYNOS_MIPI_REGMAP_PMU,
+			.resetn_val = BIT(0),
+			.resetn_reg = EXYNOS5433_SYSREG_CAM1_MIPI_DPHY_CON,
+			.resetn_map = EXYNOS_MIPI_REGMAP_CAM1,
+		},
+	},
+};
 
 struct exynos_mipi_video_phy {
 	struct regmap *regmaps[EXYNOS_MIPI_REGMAPS_NUM];
@@ -242,6 +363,12 @@ static const struct of_device_id exynos_mipi_video_phy_of_match[] = {
 	{
 		.compatible = "samsung,s5pv210-mipi-video-phy",
 		.data = &s5pv210_mipi_phy,
+	}, {
+		.compatible = "samsung,exynos5420-mipi-video-phy",
+		.data = &exynos5420_mipi_phy,
+	}, {
+		.compatible = "samsung,exynos5433-mipi-video-phy",
+		.data = &exynos5433_mipi_phy,
 	},
 	{ /* sentinel */ },
 };
diff --git a/include/linux/mfd/syscon/exynos5-pmu.h b/include/linux/mfd/syscon/exynos5-pmu.h
index 9352adc..76f30f9 100644
--- a/include/linux/mfd/syscon/exynos5-pmu.h
+++ b/include/linux/mfd/syscon/exynos5-pmu.h
@@ -38,6 +38,9 @@
 
 /* Exynos5433 specific register definitions */
 #define EXYNOS5433_USBHOST30_PHY_CONTROL	(0x728)
+#define EXYNOS5433_MIPI_PHY0_CONTROL		(0x710)
+#define EXYNOS5433_MIPI_PHY1_CONTROL		(0x714)
+#define EXYNOS5433_MIPI_PHY2_CONTROL		(0x718)
 
 #define EXYNOS5_PHY_ENABLE			BIT(0)
 
-- 
1.9.2
