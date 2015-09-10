From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 06/12] clk: samsung: exynos7: Corrects CMU_PERIC0 clocks
 names
Date: Thu, 10 Sep 2015 14:14:31 +0530
Message-ID: <1441874677-24148-7-git-send-email-alim.akhtar@samsung.com>
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch renames CMU_PERIC0 clocks names to match with user manual.
And also adds missing gate clock for aclk_peric0_66.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c       |   12 ++++++++----
 include/dt-bindings/clock/exynos7-clk.h |    3 ++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index b2daf19..b819fdd 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -226,6 +226,7 @@ CLK_OF_DECLARE(exynos7_clk_topc, "samsung,exynos7-clock-topc",
 #define DIV_TOP0_PERIC1			0x0634
 #define DIV_TOP0_PERIC2			0x0638
 #define DIV_TOP0_PERIC3			0x063C
+#define ENABLE_ACLK_TOP03		0x080C
 #define ENABLE_SCLK_TOP0_PERIC0		0x0A30
 #define ENABLE_SCLK_TOP0_PERIC1		0x0A34
 #define ENABLE_SCLK_TOP0_PERIC2		0x0A38
@@ -340,6 +341,9 @@ static struct samsung_div_clock top0_div_clks[] __initdata = {
 };
 
 static struct samsung_gate_clock top0_gate_clks[] __initdata = {
+	GATE(CLK_ACLK_PERIC0_66, "aclk_peric0_66", "dout_aclk_peric0_66",
+		ENABLE_ACLK_TOP03, 20, CLK_SET_RATE_PARENT, 0),
+
 	GATE(CLK_SCLK_SPDIF, "sclk_spdif", "dout_sclk_spdif",
 		ENABLE_SCLK_TOP0_PERIC0, 4, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_PCM1, "sclk_pcm1", "dout_sclk_pcm1",
@@ -592,8 +596,8 @@ CLK_OF_DECLARE(exynos7_clk_ccore, "samsung,exynos7-clock-ccore",
 #define ENABLE_SCLK_PERIC0		0x0A00
 
 /* List of parent clocks for Muxes in CMU_PERIC0 */
-PNAME(mout_aclk_peric0_66_p)	= { "fin_pll", "dout_aclk_peric0_66" };
-PNAME(mout_sclk_uart0_p)	= { "fin_pll", "sclk_uart0" };
+PNAME(mout_aclk_peric0_66_user_p)	= { "fin_pll", "aclk_peric0_66" };
+PNAME(mout_sclk_uart0_user_p)	= { "fin_pll", "sclk_uart0" };
 
 static unsigned long peric0_clk_regs[] __initdata = {
 	MUX_SEL_PERIC0,
@@ -602,9 +606,9 @@ static unsigned long peric0_clk_regs[] __initdata = {
 };
 
 static struct samsung_mux_clock peric0_mux_clks[] __initdata = {
-	MUX(0, "mout_aclk_peric0_66_user", mout_aclk_peric0_66_p,
+	MUX(0, "mout_aclk_peric0_66_user", mout_aclk_peric0_66_user_p,
 		MUX_SEL_PERIC0, 0, 1),
-	MUX(0, "mout_sclk_uart0_user", mout_sclk_uart0_p,
+	MUX(0, "mout_sclk_uart0_user", mout_sclk_uart0_user_p,
 		MUX_SEL_PERIC0, 16, 1),
 };
 
diff --git a/include/dt-bindings/clock/exynos7-clk.h b/include/dt-bindings/clock/exynos7-clk.h
index d26fe0f..256188a 100644
--- a/include/dt-bindings/clock/exynos7-clk.h
+++ b/include/dt-bindings/clock/exynos7-clk.h
@@ -49,7 +49,8 @@
 #define CLK_SCLK_SPDIF			12
 #define CLK_SCLK_PCM1			13
 #define CLK_SCLK_I2S1			14
-#define TOP0_NR_CLK			15
+#define CLK_ACLK_PERIC0_66		15
+#define TOP0_NR_CLK			16
 
 /* TOP1 */
 #define DOUT_ACLK_FSYS1_200		1
-- 
1.7.10.4

