From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 09/11] clk: samsung: exynos7: Corrects CMU_FSYS1 clocks names
Date: Fri, 04 Sep 2015 17:07:14 +0530
Message-ID: <1441366637-28001-10-git-send-email-alim.akhtar@samsung.com>
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48671 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757017AbbIDLwl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 07:52:41 -0400
In-reply-to: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org

This patch rename CMU_FSYS1 clocks names to match with user manual.
And also adds missing gate clock for aclk_fsys1_200.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c       |   16 ++++++++++------
 include/dt-bindings/clock/exynos7-clk.h |    3 ++-
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 011685e..f47a2d4 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -517,6 +517,8 @@ static struct samsung_gate_clock top1_gate_clks[] __initdata = {
 
 	GATE(CLK_ACLK_FSYS0_200, "aclk_fsys0_200", "dout_aclk_fsys0_200",
 		ENABLE_ACLK_TOP13, 28, CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_ACLK_FSYS1_200, "aclk_fsys1_200", "dout_aclk_fsys1_200",
+		ENABLE_ACLK_TOP13, 24, CLK_SET_RATE_PARENT, 0),
 };
 
 static struct samsung_fixed_factor_clock top1_fixed_factor_clks[] __initdata = {
@@ -959,9 +961,9 @@ CLK_OF_DECLARE(exynos7_clk_fsys0, "samsung,exynos7-clock-fsys0",
 /*
  * List of parent clocks for Muxes in CMU_FSYS1
  */
-PNAME(mout_aclk_fsys1_200_p)	= { "fin_pll",  "dout_aclk_fsys1_200" };
-PNAME(mout_sclk_mmc0_p)		= { "fin_pll", "sclk_mmc0" };
-PNAME(mout_sclk_mmc1_p)		= { "fin_pll", "sclk_mmc1" };
+PNAME(mout_aclk_fsys1_200_user_p)	= { "fin_pll", "aclk_fsys1_200" };
+PNAME(mout_sclk_mmc0_user_p)		= { "fin_pll", "sclk_mmc0" };
+PNAME(mout_sclk_mmc1_user_p)		= { "fin_pll", "sclk_mmc1" };
 
 static unsigned long fsys1_clk_regs[] __initdata = {
 	MUX_SEL_FSYS10,
@@ -970,11 +972,13 @@ static unsigned long fsys1_clk_regs[] __initdata = {
 };
 
 static struct samsung_mux_clock fsys1_mux_clks[] __initdata = {
-	MUX(0, "mout_aclk_fsys1_200_user", mout_aclk_fsys1_200_p,
+	MUX(0, "mout_aclk_fsys1_200_user", mout_aclk_fsys1_200_user_p,
 		MUX_SEL_FSYS10, 28, 1),
 
-	MUX(0, "mout_sclk_mmc1_user", mout_sclk_mmc1_p, MUX_SEL_FSYS11, 24, 1),
-	MUX(0, "mout_sclk_mmc0_user", mout_sclk_mmc0_p, MUX_SEL_FSYS11, 28, 1),
+	MUX(0, "mout_sclk_mmc1_user", mout_sclk_mmc1_user_p,
+		MUX_SEL_FSYS11, 24, 1),
+	MUX(0, "mout_sclk_mmc0_user", mout_sclk_mmc0_user_p,
+		MUX_SEL_FSYS11, 28, 1),
 };
 
 static struct samsung_gate_clock fsys1_gate_clks[] __initdata = {
diff --git a/include/dt-bindings/clock/exynos7-clk.h b/include/dt-bindings/clock/exynos7-clk.h
index 667faed..acdf2e5 100644
--- a/include/dt-bindings/clock/exynos7-clk.h
+++ b/include/dt-bindings/clock/exynos7-clk.h
@@ -63,7 +63,8 @@
 #define CLK_SCLK_MMC1			7
 #define CLK_SCLK_MMC0			8
 #define CLK_ACLK_FSYS0_200		9
-#define TOP1_NR_CLK			10
+#define CLK_ACLK_FSYS1_200		10
+#define TOP1_NR_CLK			11
 
 /* CCORE */
 #define PCLK_RTC			1
-- 
1.7.10.4
