From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/3] clk: samsung: exynos5433: Add IDs for
 PHYCLK_MIPIDPHY0_* clocks
Date: Thu, 26 Jan 2017 13:37:52 +0100
Message-ID: <1485434274-6579-2-git-send-email-m.szyprowski@samsung.com>
References: <1485434274-6579-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126123805eucas1p2fd873698f59addae8aab7ac3ad0f6de4@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35525 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751628AbdAZMiJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2017 07:38:09 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKE00LCD0FIL020@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 26 Jan 2017 12:38:06 +0000 (GMT)
In-reply-to: <1485434274-6579-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

Add missing identifiers for phyclk_mipidphy0_bitclkdiv8_phy and
phyclk_mipidphy0_rxclkesc0_phy clocks. Access to those clocks is needed
to setup initial clock configuration for display subsystem in device tree
in order to avoid dependency on the configuration left by the bootloader.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Chanwoo Choi <cw00.choi@samsugn.com>
---
 drivers/clk/samsung/clk-exynos5433.c   | 6 ++++--
 include/dt-bindings/clock/exynos5433.h | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 8fd7f6e88e3c..6ee91ae875c3 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -2559,8 +2559,10 @@ static void __init exynos5433_cmu_g2d_init(struct device_node *np)
 	FRATE(0, "phyclk_mipidphy1_bitclkdiv8_phy", NULL, 0, 188000000),
 	FRATE(0, "phyclk_mipidphy1_rxclkesc0_phy", NULL, 0, 100000000),
 	/* PHY clocks from MIPI_DPHY0 */
-	FRATE(0, "phyclk_mipidphy0_bitclkdiv8_phy", NULL, 0, 188000000),
-	FRATE(0, "phyclk_mipidphy0_rxclkesc0_phy", NULL, 0, 100000000),
+	FRATE(CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY, "phyclk_mipidphy0_bitclkdiv8_phy",
+			NULL, 0, 188000000),
+	FRATE(CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY, "phyclk_mipidphy0_rxclkesc0_phy",
+			NULL, 0, 100000000),
 	/* PHY clocks from HDMI_PHY */
 	FRATE(CLK_PHYCLK_HDMIPHY_TMDS_CLKO_PHY, "phyclk_hdmiphy_tmds_clko_phy",
 			NULL, 0, 300000000),
diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 4fa6bb2136e3..be39d23e6a32 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -771,7 +771,10 @@
 
 #define CLK_PCLK_DECON					113
 
-#define DISP_NR_CLK					114
+#define CLK_PHYCLK_MIPIDPHY0_BITCLKDIV8_PHY		114
+#define CLK_PHYCLK_MIPIDPHY0_RXCLKESC0_PHY		115
+
+#define DISP_NR_CLK					116
 
 /* CMU_AUD */
 #define CLK_MOUT_AUD_PLL_USER				1
-- 
1.9.1
