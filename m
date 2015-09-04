From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 05/11] clk: samsung: exynos7: Corrects CMU_PERIC0 clocks names
Date: Fri, 04 Sep 2015 17:07:10 +0530
Message-ID: <1441366637-28001-6-git-send-email-alim.akhtar@samsung.com>
References: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:47938 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752963AbbIDLuI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Sep 2015 07:50:08 -0400
In-reply-to: <1441366637-28001-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org

This patch rename CMU_PERIC0 clocks names to match with user manual.
And also adds missing gate clock for aclk_peric0_66.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c       |   12 ++++++++----
 include/dt-bindings/clock/exynos7-clk.h |    3 ++-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 0eb0f57..782943b 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -223,6 +223,7 @@ CLK_OF_DECLARE(exynos7_clk_topc, "samsung,exynos7-clock-topc",
 #define DIV_TOP0_PERIC1			0x0634
 #define DIV_TOP0_PERIC2			0x0638
 #define DIV_TOP0_PERIC3			0x063C
+#define ENABLE_ACLK_TOP03		0x080C
 #define ENABLE_SCLK_TOP0_PERIC0		0x0A30
 #define ENABLE_SCLK_TOP0_PERIC1		0x0A34
 #define ENABLE_SCLK_TOP0_PERIC2		0x0A38
@@ -337,6 +338,9 @@ static struct samsung_div_clock top0_div_clks[] __initdata = {
 };
 
 static struct samsung_gate_clock top0_gate_clks[] __initdata = {
+	GATE(CLK_ACLK_PERIC0_66, "aclk_peric0_66", "dout_aclk_peric0_66",
+		ENABLE_ACLK_TOP03, 20, CLK_SET_RATE_PARENT, 0),
+
 	GATE(CLK_SCLK_SPDIF, "sclk_spdif", "dout_sclk_spdif",
 		ENABLE_SCLK_TOP0_PERIC0, 4, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_PCM1, "sclk_pcm1", "dout_sclk_pcm1",
@@ -589,8 +593,8 @@ CLK_OF_DECLARE(exynos7_clk_ccore, "samsung,exynos7-clock-ccore",
 #define ENABLE_SCLK_PERIC0		0x0A00
 
 /* List of parent clocks for Muxes in CMU_PERIC0 */
-PNAME(mout_aclk_peric0_66_p)	= { "fin_pll", "dout_aclk_peric0_66" };
-PNAME(mout_sclk_uart0_p)	= { "fin_pll", "sclk_uart0" };
+PNAME(mout_aclk_peric0_66_user_p)	= { "fin_pll", "aclk_peric0_66" };
+PNAME(mout_sclk_uart0_user_p)	= { "fin_pll", "sclk_uart0" };
 
 static unsigned long peric0_clk_regs[] __initdata = {
 	MUX_SEL_PERIC0,
@@ -599,9 +603,9 @@ static unsigned long peric0_clk_regs[] __initdata = {
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
index 2e01235..ba60a20 100644
--- a/include/dt-bindings/clock/exynos7-clk.h
+++ b/include/dt-bindings/clock/exynos7-clk.h
@@ -48,7 +48,8 @@
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
