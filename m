From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 2/4] clk: samsung: exynos7: Update CMU TOP1 block
Date: Mon, 24 Aug 2015 16:35:54 +0530
Message-ID: <1440414356-1805-3-git-send-email-alim.akhtar@samsung.com>
References: <1440414356-1805-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42203 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751834AbbHXLPN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 07:15:13 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTL0119P39BI980@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Aug 2015 20:15:11 +0900 (KST)
In-reply-to: <1440414356-1805-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com

This updates CMU TOP1 block clock as per latest UM.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c |   24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index cbf1bd2..d6c4548 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -368,12 +368,15 @@ CLK_OF_DECLARE(exynos7_clk_top0, "samsung,exynos7-clock-top0",
 #define MUX_SEL_TOP13			0x020C
 #define MUX_SEL_TOP1_FSYS0		0x0224
 #define MUX_SEL_TOP1_FSYS1		0x0228
+#define MUX_SEL_TOP1_FSYS11		0x022C
 #define DIV_TOP13			0x060C
 #define DIV_TOP1_FSYS0			0x0624
 #define DIV_TOP1_FSYS1			0x0628
+#define DIV_TOP1_FSYS11			0x062C
 #define ENABLE_ACLK_TOP13		0x080C
 #define ENABLE_SCLK_TOP1_FSYS0		0x0A24
 #define ENABLE_SCLK_TOP1_FSYS1		0x0A28
+#define ENABLE_SCLK_TOP1_FSYS11		0x0A2C
 
 /* List of parent clocks for Muxes in CMU_TOP1 */
 PNAME(mout_top1_bus0_pll_p)	= { "fin_pll", "dout_sclk_bus0_pll" };
@@ -400,12 +403,15 @@ static unsigned long top1_clk_regs[] __initdata = {
 	MUX_SEL_TOP13,
 	MUX_SEL_TOP1_FSYS0,
 	MUX_SEL_TOP1_FSYS1,
+	MUX_SEL_TOP1_FSYS11,
 	DIV_TOP13,
 	DIV_TOP1_FSYS0,
 	DIV_TOP1_FSYS1,
+	DIV_TOP1_FSYS11,
 	ENABLE_ACLK_TOP13,
 	ENABLE_SCLK_TOP1_FSYS0,
 	ENABLE_SCLK_TOP1_FSYS1,
+	ENABLE_SCLK_TOP1_FSYS11,
 };
 
 static struct samsung_mux_clock top1_mux_clks[] __initdata = {
@@ -428,12 +434,12 @@ static struct samsung_mux_clock top1_mux_clks[] __initdata = {
 	MUX(0, "mout_aclk_fsys1_200", mout_top1_group1, MUX_SEL_TOP13, 24, 2),
 	MUX(0, "mout_aclk_fsys0_200", mout_top1_group1, MUX_SEL_TOP13, 28, 2),
 
-	MUX(0, "mout_sclk_mmc2", mout_top1_group1, MUX_SEL_TOP1_FSYS0, 24, 2),
+	MUX(0, "mout_sclk_mmc2", mout_top1_group1, MUX_SEL_TOP1_FSYS0, 16, 2),
 	MUX(0, "mout_sclk_usbdrd300", mout_top1_group1,
 		MUX_SEL_TOP1_FSYS0, 28, 2),
 
-	MUX(0, "mout_sclk_mmc1", mout_top1_group1, MUX_SEL_TOP1_FSYS1, 24, 2),
-	MUX(0, "mout_sclk_mmc0", mout_top1_group1, MUX_SEL_TOP1_FSYS1, 28, 2),
+	MUX(0, "mout_sclk_mmc1", mout_top1_group1, MUX_SEL_TOP1_FSYS11, 0, 2),
+	MUX(0, "mout_sclk_mmc0", mout_top1_group1, MUX_SEL_TOP1_FSYS11, 12, 2),
 };
 
 static struct samsung_div_clock top1_div_clks[] __initdata = {
@@ -443,26 +449,26 @@ static struct samsung_div_clock top1_div_clks[] __initdata = {
 		DIV_TOP13, 28, 4),
 
 	DIV(DOUT_SCLK_MMC2, "dout_sclk_mmc2", "mout_sclk_mmc2",
-		DIV_TOP1_FSYS0, 24, 4),
+		DIV_TOP1_FSYS0, 16, 10),
 	DIV(0, "dout_sclk_usbdrd300", "mout_sclk_usbdrd300",
 		DIV_TOP1_FSYS0, 28, 4),
 
 	DIV(DOUT_SCLK_MMC1, "dout_sclk_mmc1", "mout_sclk_mmc1",
-		DIV_TOP1_FSYS1, 24, 4),
+		DIV_TOP1_FSYS11, 0, 10),
 	DIV(DOUT_SCLK_MMC0, "dout_sclk_mmc0", "mout_sclk_mmc0",
-		DIV_TOP1_FSYS1, 28, 4),
+		DIV_TOP1_FSYS11, 12, 10),
 };
 
 static struct samsung_gate_clock top1_gate_clks[] __initdata = {
 	GATE(CLK_SCLK_MMC2, "sclk_mmc2", "dout_sclk_mmc2",
-		ENABLE_SCLK_TOP1_FSYS0, 24, CLK_SET_RATE_PARENT, 0),
+		ENABLE_SCLK_TOP1_FSYS0, 16, CLK_SET_RATE_PARENT, 0),
 	GATE(0, "sclk_usbdrd300", "dout_sclk_usbdrd300",
 		ENABLE_SCLK_TOP1_FSYS0, 28, 0, 0),
 
 	GATE(CLK_SCLK_MMC1, "sclk_mmc1", "dout_sclk_mmc1",
-		ENABLE_SCLK_TOP1_FSYS1, 24, CLK_SET_RATE_PARENT, 0),
+		ENABLE_SCLK_TOP1_FSYS11, 0, CLK_SET_RATE_PARENT, 0),
 	GATE(CLK_SCLK_MMC0, "sclk_mmc0", "dout_sclk_mmc0",
-		ENABLE_SCLK_TOP1_FSYS1, 28, CLK_SET_RATE_PARENT, 0),
+		ENABLE_SCLK_TOP1_FSYS11, 12, CLK_SET_RATE_PARENT, 0),
 };
 
 static struct samsung_fixed_factor_clock top1_fixed_factor_clks[] __initdata = {
-- 
1.7.10.4
