From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 07/12] clk: samsung: exynos7: Corrects CMU_PERIC1 clocks
 names
Date: Thu, 10 Sep 2015 14:14:32 +0530
Message-ID: <1441874677-24148-8-git-send-email-alim.akhtar@samsung.com>
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48877 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751294AbbIJI70 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Sep 2015 04:59:26 -0400
In-reply-to: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org

This patch renames CMU_PERIC1 clocks names to match with user manual.
And also adds missing gate clock for aclk_peric1_66.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c       |   38 ++++++++++++++++---------------
 include/dt-bindings/clock/exynos7-clk.h |    3 ++-
 2 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index b819fdd..7796712 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -343,6 +343,8 @@ static struct samsung_div_clock top0_div_clks[] __initdata = {
 static struct samsung_gate_clock top0_gate_clks[] __initdata = {
 	GATE(CLK_ACLK_PERIC0_66, "aclk_peric0_66", "dout_aclk_peric0_66",
 		ENABLE_ACLK_TOP03, 20, CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_ACLK_PERIC1_66, "aclk_peric1_66", "dout_aclk_peric1_66",
+		ENABLE_ACLK_TOP03, 12, CLK_SET_RATE_PARENT, 0),
 
 	GATE(CLK_SCLK_SPDIF, "sclk_spdif", "dout_sclk_spdif",
 		ENABLE_SCLK_TOP0_PERIC0, 4, CLK_SET_RATE_PARENT, 0),
@@ -665,15 +667,15 @@ CLK_OF_DECLARE(exynos7_clk_peric0, "samsung,exynos7-clock-peric0",
 	exynos7_clk_peric0_init);
 
 /* List of parent clocks for Muxes in CMU_PERIC1 */
-PNAME(mout_aclk_peric1_66_p)	= { "fin_pll", "dout_aclk_peric1_66" };
-PNAME(mout_sclk_uart1_p)	= { "fin_pll", "sclk_uart1" };
-PNAME(mout_sclk_uart2_p)	= { "fin_pll", "sclk_uart2" };
-PNAME(mout_sclk_uart3_p)	= { "fin_pll", "sclk_uart3" };
-PNAME(mout_sclk_spi0_p)		= { "fin_pll", "sclk_spi0" };
-PNAME(mout_sclk_spi1_p)		= { "fin_pll", "sclk_spi1" };
-PNAME(mout_sclk_spi2_p)		= { "fin_pll", "sclk_spi2" };
-PNAME(mout_sclk_spi3_p)		= { "fin_pll", "sclk_spi3" };
-PNAME(mout_sclk_spi4_p)		= { "fin_pll", "sclk_spi4" };
+PNAME(mout_aclk_peric1_66_user_p)	= { "fin_pll", "aclk_peric1_66" };
+PNAME(mout_sclk_uart1_user_p)	= { "fin_pll", "sclk_uart1" };
+PNAME(mout_sclk_uart2_user_p)	= { "fin_pll", "sclk_uart2" };
+PNAME(mout_sclk_uart3_user_p)	= { "fin_pll", "sclk_uart3" };
+PNAME(mout_sclk_spi0_user_p)		= { "fin_pll", "sclk_spi0" };
+PNAME(mout_sclk_spi1_user_p)		= { "fin_pll", "sclk_spi1" };
+PNAME(mout_sclk_spi2_user_p)		= { "fin_pll", "sclk_spi2" };
+PNAME(mout_sclk_spi3_user_p)		= { "fin_pll", "sclk_spi3" };
+PNAME(mout_sclk_spi4_user_p)		= { "fin_pll", "sclk_spi4" };
 
 static unsigned long peric1_clk_regs[] __initdata = {
 	MUX_SEL_PERIC10,
@@ -684,24 +686,24 @@ static unsigned long peric1_clk_regs[] __initdata = {
 };
 
 static struct samsung_mux_clock peric1_mux_clks[] __initdata = {
-	MUX(0, "mout_aclk_peric1_66_user", mout_aclk_peric1_66_p,
+	MUX(0, "mout_aclk_peric1_66_user", mout_aclk_peric1_66_user_p,
 		MUX_SEL_PERIC10, 0, 1),
 
-	MUX_F(0, "mout_sclk_spi0_user", mout_sclk_spi0_p,
+	MUX_F(0, "mout_sclk_spi0_user", mout_sclk_spi0_user_p,
 		MUX_SEL_PERIC11, 0, 1, CLK_SET_RATE_PARENT, 0),
-	MUX_F(0, "mout_sclk_spi1_user", mout_sclk_spi1_p,
+	MUX_F(0, "mout_sclk_spi1_user", mout_sclk_spi1_user_p,
 		MUX_SEL_PERIC11, 4, 1, CLK_SET_RATE_PARENT, 0),
-	MUX_F(0, "mout_sclk_spi2_user", mout_sclk_spi2_p,
+	MUX_F(0, "mout_sclk_spi2_user", mout_sclk_spi2_user_p,
 		MUX_SEL_PERIC11, 8, 1, CLK_SET_RATE_PARENT, 0),
-	MUX_F(0, "mout_sclk_spi3_user", mout_sclk_spi3_p,
+	MUX_F(0, "mout_sclk_spi3_user", mout_sclk_spi3_user_p,
 		MUX_SEL_PERIC11, 12, 1, CLK_SET_RATE_PARENT, 0),
-	MUX_F(0, "mout_sclk_spi4_user", mout_sclk_spi4_p,
+	MUX_F(0, "mout_sclk_spi4_user", mout_sclk_spi4_user_p,
 		MUX_SEL_PERIC11, 16, 1, CLK_SET_RATE_PARENT, 0),
-	MUX(0, "mout_sclk_uart1_user", mout_sclk_uart1_p,
+	MUX(0, "mout_sclk_uart1_user", mout_sclk_uart1_user_p,
 		MUX_SEL_PERIC11, 20, 1),
-	MUX(0, "mout_sclk_uart2_user", mout_sclk_uart2_p,
+	MUX(0, "mout_sclk_uart2_user", mout_sclk_uart2_user_p,
 		MUX_SEL_PERIC11, 24, 1),
-	MUX(0, "mout_sclk_uart3_user", mout_sclk_uart3_p,
+	MUX(0, "mout_sclk_uart3_user", mout_sclk_uart3_user_p,
 		MUX_SEL_PERIC11, 28, 1),
 };
 
diff --git a/include/dt-bindings/clock/exynos7-clk.h b/include/dt-bindings/clock/exynos7-clk.h
index 256188a..2876654 100644
--- a/include/dt-bindings/clock/exynos7-clk.h
+++ b/include/dt-bindings/clock/exynos7-clk.h
@@ -50,7 +50,8 @@
 #define CLK_SCLK_PCM1			13
 #define CLK_SCLK_I2S1			14
 #define CLK_ACLK_PERIC0_66		15
-#define TOP0_NR_CLK			16
+#define CLK_ACLK_PERIC1_66		16
+#define TOP0_NR_CLK			17
 
 /* TOP1 */
 #define DOUT_ACLK_FSYS1_200		1
-- 
1.7.10.4
