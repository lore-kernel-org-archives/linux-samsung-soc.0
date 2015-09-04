From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 07/11] clk: samsung: exynos7: Corrects CMU_PERIS clocks names
Date: Fri, 04 Sep 2015 17:07:12 +0530
Message-ID: <1441366637-28001-8-git-send-email-alim.akhtar@samsung.com>
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch rename CMU_PERIS clocks names to match with user manual.
And also adds missing gate clock for aclk_peris_66.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c       |    7 +++++--
 include/dt-bindings/clock/exynos7-clk.h |    3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 696489a..75db751 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -150,6 +150,9 @@ static struct samsung_gate_clock topc_gate_clks[] __initdata = {
 	GATE(ACLK_MSCL_532, "aclk_mscl_532", "dout_aclk_mscl_532",
 		ENABLE_ACLK_TOPC1, 20, 0, 0),
 
+	GATE(ACLK_PERIS_66, "aclk_peris_66", "dout_aclk_peris_66",
+		ENABLE_ACLK_TOPC1, 24, 0, 0),
+
 	GATE(SCLK_AUD_PLL, "sclk_aud_pll", "dout_sclk_aud_pll",
 		ENABLE_SCLK_TOPC1, 20, 0, 0),
 	GATE(SCLK_MFC_PLL_B, "sclk_mfc_pll_b", "dout_sclk_mfc_pll",
@@ -788,7 +791,7 @@ CLK_OF_DECLARE(exynos7_clk_peric1, "samsung,exynos7-clock-peric1",
 #define ENABLE_SCLK_PERIS_SECURE_CHIPID	0x0A10
 
 /* List of parent clocks for Muxes in CMU_PERIS */
-PNAME(mout_aclk_peris_66_p) = { "fin_pll", "dout_aclk_peris_66" };
+PNAME(mout_aclk_peris_66_user_p) = { "fin_pll", "aclk_peris_66" };
 
 static unsigned long peris_clk_regs[] __initdata = {
 	MUX_SEL_PERIS,
@@ -800,7 +803,7 @@ static unsigned long peris_clk_regs[] __initdata = {
 
 static struct samsung_mux_clock peris_mux_clks[] __initdata = {
 	MUX(0, "mout_aclk_peris_66_user",
-		mout_aclk_peris_66_p, MUX_SEL_PERIS, 0, 1),
+		mout_aclk_peris_66_user_p, MUX_SEL_PERIS, 0, 1),
 };
 
 static struct samsung_gate_clock peris_gate_clks[] __initdata = {
diff --git a/include/dt-bindings/clock/exynos7-clk.h b/include/dt-bindings/clock/exynos7-clk.h
index 5a157f7..2876654 100644
--- a/include/dt-bindings/clock/exynos7-clk.h
+++ b/include/dt-bindings/clock/exynos7-clk.h
@@ -31,7 +31,8 @@
 #define SCLK_CC_PLL_B			18
 #define SCLK_CC_PLL_A			19
 #define ACLK_CCORE_133			20
-#define TOPC_NR_CLK			21
+#define ACLK_PERIS_66			21
+#define TOPC_NR_CLK			22
 
 /* TOP0 */
 #define DOUT_ACLK_PERIC1		1
-- 
1.7.10.4

