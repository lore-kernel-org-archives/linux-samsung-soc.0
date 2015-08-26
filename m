From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 1/4] clk: samsung: exynos7: Fix CMU TOPC block clock
Date: Wed, 26 Aug 2015 09:00:41 +0530
Message-ID: <1440559844-12572-2-git-send-email-alim.akhtar@samsung.com>
References: <1440559844-12572-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48048 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750737AbbHZDjZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 23:39:25 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTO01TZT7HNDL70@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Aug 2015 12:39:23 +0900 (KST)
In-reply-to: <1440559844-12572-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com

Corrects the bit width of DIV_TOPC3 register.
These are worngly set to 3 which should be 4 bit wide as per UM.
This also adjusts the MUX clock order.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 03d36e8..eddfd1d 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -104,9 +104,9 @@ static struct samsung_mux_clock topc_mux_clks[] __initdata = {
 	MUX(0, "mout_sclk_mfc_pll_cmuc", mout_sclk_mfc_pll_cmuc_p,
 		MUX_SEL_TOPC0, 28, 1),
 
+	MUX(0, "mout_aud_pll_ctrl", mout_aud_pll_ctrl_p, MUX_SEL_TOPC1, 0, 1),
 	MUX(0, "mout_sclk_bus0_pll_out", mout_sclk_bus0_pll_out_p,
 		MUX_SEL_TOPC1, 16, 1),
-	MUX(0, "mout_aud_pll_ctrl", mout_aud_pll_ctrl_p, MUX_SEL_TOPC1, 0, 1),
 
 	MUX(0, "mout_aclk_ccore_133", mout_topc_group2,	MUX_SEL_TOPC2, 4, 2),
 
@@ -124,15 +124,15 @@ static struct samsung_div_clock topc_div_clks[] __initdata = {
 		DIV_TOPC1, 24, 4),
 
 	DIV(DOUT_SCLK_BUS0_PLL, "dout_sclk_bus0_pll", "mout_sclk_bus0_pll_out",
-		DIV_TOPC3, 0, 3),
+		DIV_TOPC3, 0, 4),
 	DIV(DOUT_SCLK_BUS1_PLL, "dout_sclk_bus1_pll", "mout_bus1_pll_ctrl",
-		DIV_TOPC3, 8, 3),
+		DIV_TOPC3, 8, 4),
 	DIV(DOUT_SCLK_CC_PLL, "dout_sclk_cc_pll", "mout_cc_pll_ctrl",
-		DIV_TOPC3, 12, 3),
+		DIV_TOPC3, 12, 4),
 	DIV(DOUT_SCLK_MFC_PLL, "dout_sclk_mfc_pll", "mout_mfc_pll_ctrl",
-		DIV_TOPC3, 16, 3),
+		DIV_TOPC3, 16, 4),
 	DIV(DOUT_SCLK_AUD_PLL, "dout_sclk_aud_pll", "mout_aud_pll_ctrl",
-		DIV_TOPC3, 28, 3),
+		DIV_TOPC3, 28, 4),
 };
 
 static struct samsung_pll_rate_table pll1460x_24mhz_tbl[] __initdata = {
-- 
1.7.10.4
