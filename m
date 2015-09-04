From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 08/11] clk: samsung: exynos7: Corrects CMU_FSYS0 clocks names
Date: Fri, 04 Sep 2015 17:07:13 +0530
Message-ID: <1441366637-28001-9-git-send-email-alim.akhtar@samsung.com>
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch rename CMU_FSYS0 clocks names to match with user manual.
And also adds missing gate clock for aclk_fsys0_200.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c       |   24 ++++++++++++++----------
 include/dt-bindings/clock/exynos7-clk.h |    3 ++-
 2 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 75db751..011685e 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -514,6 +514,9 @@ static struct samsung_gate_clock top1_gate_clks[] __initdata = {
 		ENABLE_SCLK_TOP1_FSYS11, 0, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_MMC0, "sclk_mmc0", "dout_sclk_mmc0",
 		ENABLE_SCLK_TOP1_FSYS11, 12, CLK_SET_RATE_PARENT, 0),
+
+	GATE(CLK_ACLK_FSYS0_200, "aclk_fsys0_200", "dout_aclk_fsys0_200",
+		ENABLE_ACLK_TOP13, 28, CLK_SET_RATE_PARENT, 0),
 };
 
 static struct samsung_fixed_factor_clock top1_fixed_factor_clks[] __initdata = {
@@ -851,13 +854,13 @@ CLK_OF_DECLARE(exynos7_clk_peris, "samsung,exynos7-clock-peris",
 /*
  * List of parent clocks for Muxes in CMU_FSYS0
  */
-PNAME(mout_aclk_fsys0_200_p)	= { "fin_pll", "dout_aclk_fsys0_200" };
-PNAME(mout_sclk_mmc2_p)		= { "fin_pll", "sclk_mmc2" };
+PNAME(mout_aclk_fsys0_200_user_p)	= { "fin_pll", "aclk_fsys0_200" };
+PNAME(mout_sclk_mmc2_user_p)		= { "fin_pll", "sclk_mmc2" };
 
-PNAME(mout_sclk_usbdrd300_p)	= { "fin_pll", "sclk_usbdrd300" };
-PNAME(mout_phyclk_usbdrd300_udrd30_phyclk_p)	= { "fin_pll",
+PNAME(mout_sclk_usbdrd300_user_p)	= { "fin_pll", "sclk_usbdrd300" };
+PNAME(mout_phyclk_usbdrd300_udrd30_phyclk_user_p)	= { "fin_pll",
 				"phyclk_usbdrd300_udrd30_phyclock" };
-PNAME(mout_phyclk_usbdrd300_udrd30_pipe_pclk_p)	= { "fin_pll",
+PNAME(mout_phyclk_usbdrd300_udrd30_pipe_pclk_user_p)	= { "fin_pll",
 				"phyclk_usbdrd300_udrd30_pipe_pclk" };
 
 /* fixed rate clocks used in the FSYS0 block */
@@ -880,18 +883,19 @@ static unsigned long fsys0_clk_regs[] __initdata = {
 };
 
 static struct samsung_mux_clock fsys0_mux_clks[] __initdata = {
-	MUX(0, "mout_aclk_fsys0_200_user", mout_aclk_fsys0_200_p,
+	MUX(0, "mout_aclk_fsys0_200_user", mout_aclk_fsys0_200_user_p,
 		MUX_SEL_FSYS00, 24, 1),
 
-	MUX(0, "mout_sclk_mmc2_user", mout_sclk_mmc2_p, MUX_SEL_FSYS01, 24, 1),
-	MUX(0, "mout_sclk_usbdrd300_user", mout_sclk_usbdrd300_p,
+	MUX(0, "mout_sclk_mmc2_user", mout_sclk_mmc2_user_p,
+		MUX_SEL_FSYS01, 24, 1),
+	MUX(0, "mout_sclk_usbdrd300_user", mout_sclk_usbdrd300_user_p,
 		MUX_SEL_FSYS01, 28, 1),
 
 	MUX(0, "mout_phyclk_usbdrd300_udrd30_pipe_pclk_user",
-		mout_phyclk_usbdrd300_udrd30_pipe_pclk_p,
+		mout_phyclk_usbdrd300_udrd30_pipe_pclk_user_p,
 		MUX_SEL_FSYS02, 24, 1),
 	MUX(0, "mout_phyclk_usbdrd300_udrd30_phyclk_user",
-		mout_phyclk_usbdrd300_udrd30_phyclk_p,
+		mout_phyclk_usbdrd300_udrd30_phyclk_user_p,
 		MUX_SEL_FSYS02, 28, 1),
 };
 
diff --git a/include/dt-bindings/clock/exynos7-clk.h b/include/dt-bindings/clock/exynos7-clk.h
index 2876654..667faed 100644
--- a/include/dt-bindings/clock/exynos7-clk.h
+++ b/include/dt-bindings/clock/exynos7-clk.h
@@ -62,7 +62,8 @@
 #define CLK_SCLK_MMC2			6
 #define CLK_SCLK_MMC1			7
 #define CLK_SCLK_MMC0			8
-#define TOP1_NR_CLK			9
+#define CLK_ACLK_FSYS0_200		9
+#define TOP1_NR_CLK			10
 
 /* CCORE */
 #define PCLK_RTC			1
-- 
1.7.10.4

