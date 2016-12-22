From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] clk/samsung: exynos542x: mark some clocks as critical
Date: Thu, 22 Dec 2016 10:44:30 +0100
Message-ID: <1482399870-18563-1-git-send-email-m.szyprowski@samsung.com>
References: <CGME20161222094441epcas5p330bb16763e02149a275c30eb644b0e7c@epcas5p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47842 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750792AbcLVJoo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Dec 2016 04:44:44 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Some parent clocks of the Exynos542x clock blocks, which have separate
power domains (like DISP, MFC, MSC, GSC, FSYS and G2D) must be always
enabled to access any register related to power management unit or devices
connected to it. For the time being, until a proper solution based on
runtime PM is applied, mark those clocks as critical (instead of ignore
unused or even no flags) to prevent disabling them.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 8c8b495cbf0d..cdc092a1d9ef 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -586,7 +586,7 @@ static void __init exynos5420_clk_sleep_init(void) {}
 	GATE(CLK_ACLK550_CAM, "aclk550_cam", "mout_user_aclk550_cam",
 				GATE_BUS_TOP, 24, 0, 0),
 	GATE(CLK_ACLK432_SCALER, "aclk432_scaler", "mout_user_aclk432_scaler",
-				GATE_BUS_TOP, 27, 0, 0),
+				GATE_BUS_TOP, 27, CLK_IS_CRITICAL, 0),
 };
 
 static const struct samsung_mux_clock exynos5420_mux_clks[] __initconst = {
@@ -956,20 +956,20 @@ static void __init exynos5420_clk_sleep_init(void) {}
 	GATE(CLK_SMMU_G2D, "smmu_g2d", "aclk333_g2d", GATE_IP_G2D, 7, 0, 0),
 
 	GATE(0, "aclk200_fsys", "mout_user_aclk200_fsys",
-			GATE_BUS_FSYS0, 9, CLK_IGNORE_UNUSED, 0),
+			GATE_BUS_FSYS0, 9, CLK_IS_CRITICAL, 0),
 	GATE(0, "aclk200_fsys2", "mout_user_aclk200_fsys2",
 			GATE_BUS_FSYS0, 10, CLK_IGNORE_UNUSED, 0),
 
 	GATE(0, "aclk333_g2d", "mout_user_aclk333_g2d",
 			GATE_BUS_TOP, 0, CLK_IGNORE_UNUSED, 0),
 	GATE(0, "aclk266_g2d", "mout_user_aclk266_g2d",
-			GATE_BUS_TOP, 1, CLK_IGNORE_UNUSED, 0),
+			GATE_BUS_TOP, 1, CLK_IS_CRITICAL, 0),
 	GATE(0, "aclk300_jpeg", "mout_user_aclk300_jpeg",
 			GATE_BUS_TOP, 4, CLK_IGNORE_UNUSED, 0),
 	GATE(0, "aclk333_432_isp0", "mout_user_aclk333_432_isp0",
 			GATE_BUS_TOP, 5, 0, 0),
 	GATE(0, "aclk300_gscl", "mout_user_aclk300_gscl",
-			GATE_BUS_TOP, 6, CLK_IGNORE_UNUSED, 0),
+			GATE_BUS_TOP, 6, CLK_IS_CRITICAL, 0),
 	GATE(0, "aclk333_432_gscl", "mout_user_aclk333_432_gscl",
 			GATE_BUS_TOP, 7, CLK_IGNORE_UNUSED, 0),
 	GATE(0, "aclk333_432_isp", "mout_user_aclk333_432_isp",
@@ -983,20 +983,20 @@ static void __init exynos5420_clk_sleep_init(void) {}
 	GATE(0, "aclk166", "mout_user_aclk166",
 			GATE_BUS_TOP, 14, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_ACLK333, "aclk333", "mout_user_aclk333",
-			GATE_BUS_TOP, 15, CLK_IGNORE_UNUSED, 0),
+			GATE_BUS_TOP, 15, CLK_IS_CRITICAL, 0),
 	GATE(0, "aclk400_isp", "mout_user_aclk400_isp",
 			GATE_BUS_TOP, 16, 0, 0),
 	GATE(0, "aclk400_mscl", "mout_user_aclk400_mscl",
 			GATE_BUS_TOP, 17, 0, 0),
 	GATE(0, "aclk200_disp1", "mout_user_aclk200_disp1",
-			GATE_BUS_TOP, 18, 0, 0),
+			GATE_BUS_TOP, 18, CLK_IS_CRITICAL, 0),
 	GATE(CLK_SCLK_MPHY_IXTAL24, "sclk_mphy_ixtal24", "mphy_refclk_ixtal24",
 			GATE_BUS_TOP, 28, 0, 0),
 	GATE(CLK_SCLK_HSIC_12M, "sclk_hsic_12m", "ff_hsic_12m",
 			GATE_BUS_TOP, 29, 0, 0),
 
 	GATE(0, "aclk300_disp1", "mout_user_aclk300_disp1",
-			SRC_MASK_TOP2, 24, 0, 0),
+			SRC_MASK_TOP2, 24, CLK_IS_CRITICAL, 0),
 
 	GATE(CLK_MAU_EPLL, "mau_epll", "mout_mau_epll_clk",
 			SRC_MASK_TOP7, 20, 0, 0),
-- 
1.9.1
