From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 02/12] clk: samsung: exynos7: Adds missing clocks gates of
 CMU_TOPC
Date: Thu, 10 Sep 2015 14:14:27 +0530
Message-ID: <1441874677-24148-3-git-send-email-alim.akhtar@samsung.com>
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:49960 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751804AbbIJI4E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Sep 2015 04:56:04 -0400
In-reply-to: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org

This adds some of the missing GATE clocks of CMU_TOPC block.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c       |   27 +++++++++++++++++++++++++++
 include/dt-bindings/clock/exynos7-clk.h |   13 ++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index df061ce..e11449b 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -34,7 +34,9 @@
 #define DIV_TOPC0		0x0600
 #define DIV_TOPC1		0x0604
 #define DIV_TOPC3		0x060C
+#define ENABLE_ACLK_TOPC0	0x0800
 #define ENABLE_ACLK_TOPC1	0x0804
+#define ENABLE_SCLK_TOPC1	0x0A04
 
 static struct samsung_fixed_factor_clock topc_fixed_factor_clks[] __initdata = {
 	FFACTOR(0, "ffac_topc_bus0_pll_div2", "mout_topc_bus0_pll", 1, 2, 0),
@@ -145,8 +147,33 @@ static struct samsung_pll_rate_table pll1460x_24mhz_tbl[] __initdata = {
 };
 
 static struct samsung_gate_clock topc_gate_clks[] __initdata = {
+	GATE(ACLK_CCORE_133, "aclk_ccore_133", "dout_aclk_ccore_133",
+		ENABLE_ACLK_TOPC0, 4, 0, 0),
+
 	GATE(ACLK_MSCL_532, "aclk_mscl_532", "dout_aclk_mscl_532",
 		ENABLE_ACLK_TOPC1, 20, 0, 0),
+
+	GATE(ACLK_PERIS_66, "aclk_peris_66", "dout_aclk_peris_66",
+		ENABLE_ACLK_TOPC1, 24, 0, 0),
+
+	GATE(SCLK_AUD_PLL, "sclk_aud_pll", "dout_sclk_aud_pll",
+		ENABLE_SCLK_TOPC1, 20, 0, 0),
+	GATE(SCLK_MFC_PLL_B, "sclk_mfc_pll_b", "dout_sclk_mfc_pll",
+		ENABLE_SCLK_TOPC1, 17, 0, 0),
+	GATE(SCLK_MFC_PLL_A, "sclk_mfc_pll_a", "dout_sclk_mfc_pll",
+		ENABLE_SCLK_TOPC1, 16, 0, 0),
+	GATE(SCLK_BUS1_PLL_B, "sclk_bus1_pll_b", "dout_sclk_bus1_pll",
+		ENABLE_SCLK_TOPC1, 13, 0, 0),
+	GATE(SCLK_BUS1_PLL_A, "sclk_bus1_pll_a", "dout_sclk_bus1_pll",
+		ENABLE_SCLK_TOPC1, 12, 0, 0),
+	GATE(SCLK_BUS0_PLL_B, "sclk_bus0_pll_b", "dout_sclk_bus0_pll",
+		ENABLE_SCLK_TOPC1, 5, 0, 0),
+	GATE(SCLK_BUS0_PLL_A, "sclk_bus0_pll_a", "dout_sclk_bus0_pll",
+		ENABLE_SCLK_TOPC1, 4, 0, 0),
+	GATE(SCLK_CC_PLL_B, "sclk_cc_pll_b", "dout_sclk_cc_pll",
+		ENABLE_SCLK_TOPC1, 1, 0, 0),
+	GATE(SCLK_CC_PLL_A, "sclk_cc_pll_a", "dout_sclk_cc_pll",
+		ENABLE_SCLK_TOPC1, 0, 0, 0),
 };
 
 static struct samsung_pll_clock topc_pll_clks[] __initdata = {
diff --git a/include/dt-bindings/clock/exynos7-clk.h b/include/dt-bindings/clock/exynos7-clk.h
index e33c75a..d26fe0f 100644
--- a/include/dt-bindings/clock/exynos7-clk.h
+++ b/include/dt-bindings/clock/exynos7-clk.h
@@ -21,7 +21,18 @@
 #define ACLK_MSCL_532			8
 #define DOUT_SCLK_AUD_PLL		9
 #define FOUT_AUD_PLL			10
-#define TOPC_NR_CLK			11
+#define SCLK_AUD_PLL			11
+#define SCLK_MFC_PLL_B			12
+#define SCLK_MFC_PLL_A			13
+#define SCLK_BUS1_PLL_B			14
+#define SCLK_BUS1_PLL_A			15
+#define SCLK_BUS0_PLL_B			16
+#define SCLK_BUS0_PLL_A			17
+#define SCLK_CC_PLL_B			18
+#define SCLK_CC_PLL_A			19
+#define ACLK_CCORE_133			20
+#define ACLK_PERIS_66			21
+#define TOPC_NR_CLK			22
 
 /* TOP0 */
 #define DOUT_ACLK_PERIC1		1
-- 
1.7.10.4
