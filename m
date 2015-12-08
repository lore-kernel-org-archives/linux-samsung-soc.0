From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] clk: samsung: exynos5422: add missing parent GSCL block
 clocks
Date: Tue, 08 Dec 2015 14:46:54 +0100
Message-ID: <1449582415-30164-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:16611 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756396AbbLHNrO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Dec 2015 08:47:14 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@baylibre.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>

This patch adds clocks, which are required for preserving parent clock
configuration on GSCL power domain on/off.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c   | 8 ++++----
 include/dt-bindings/clock/exynos5420.h | 2 ++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 389af3c..4bae2e3 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -677,8 +677,8 @@ static struct samsung_mux_clock exynos5x_mux_clks[] __initdata = {
 			SRC_TOP5, 20, 1),
 	MUX(CLK_MOUT_USER_ACLK300_DISP1, "mout_user_aclk300_disp1",
 			mout_user_aclk300_disp1_p, SRC_TOP5, 24, 1),
-	MUX(0, "mout_user_aclk300_gscl", mout_user_aclk300_gscl_p,
-			SRC_TOP5, 28, 1),
+	MUX(CLK_MOUT_USER_ACLK300_GSCL, "mout_user_aclk300_gscl",
+			mout_user_aclk300_gscl_p, SRC_TOP5, 28, 1),
 
 	MUX(0, "mout_sclk_mpll", mout_mpll_p, SRC_TOP6, 0, 1),
 	MUX(CLK_MOUT_VPLL, "mout_sclk_vpll", mout_vpll_p, SRC_TOP6, 4, 1),
@@ -729,8 +729,8 @@ static struct samsung_mux_clock exynos5x_mux_clks[] __initdata = {
 			SRC_TOP12, 20, 1),
 	MUX(CLK_MOUT_SW_ACLK300, "mout_sw_aclk300_disp1",
 			mout_sw_aclk300_disp1_p, SRC_TOP12, 24, 1),
-	MUX(0, "mout_sw_aclk300_gscl", mout_sw_aclk300_gscl_p,
-			SRC_TOP12, 28, 1),
+	MUX(CLK_MOUT_SW_ACLK300_GSCL, "mout_sw_aclk300_gscl",
+			mout_sw_aclk300_gscl_p, SRC_TOP12, 28, 1),
 
 	/* DISP1 Block */
 	MUX(0, "mout_mipi1", mout_group2_p, SRC_DISP10, 16, 3),
diff --git a/include/dt-bindings/clock/exynos5420.h b/include/dt-bindings/clock/exynos5420.h
index 99da0d1..b5af23a 100644
--- a/include/dt-bindings/clock/exynos5420.h
+++ b/include/dt-bindings/clock/exynos5420.h
@@ -210,6 +210,8 @@
 #define CLK_MOUT_SW_ACLK300     649
 #define CLK_MOUT_USER_ACLK400_DISP1     650
 #define CLK_MOUT_SW_ACLK400     651
+#define CLK_MOUT_USER_ACLK300_GSCL	652
+#define CLK_MOUT_SW_ACLK300_GSCL	653
 
 /* divider clocks */
 #define CLK_DOUT_PIXEL		768
-- 
1.9.2
