From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH] clk: exynos4: remove duplicate div_core2 divider clock
 instantiation
Date: Wed, 30 Jul 2014 13:25:32 +0530
Message-ID: <1406706932-10527-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:61964 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750949AbaG3H6q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jul 2014 03:58:46 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9I007AZM5WCO40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jul 2014 16:58:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: t.figa@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

The 'div_core2' clock and the 'arm_clk' divider clocks are instances of
the same divider clock. So remove the 'arm_clk' clock instance.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
This patch is based on for-next branch of Samsung clock tree.

 drivers/clk/samsung/clk-exynos4.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index ac163d7..8617f49 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -719,7 +719,7 @@ static struct samsung_div_clock exynos4_div_clks[] __initdata = {
 	DIV(0, "div_periph", "div_core2", DIV_CPU0, 12, 3),
 	DIV(0, "div_atb", "mout_core", DIV_CPU0, 16, 3),
 	DIV(0, "div_pclk_dbg", "div_atb", DIV_CPU0, 20, 3),
-	DIV(0, "div_core2", "div_core", DIV_CPU0, 28, 3),
+	DIV(CLK_ARM_CLK, "div_core2", "div_core", DIV_CPU0, 28, 3),
 	DIV(0, "div_copy", "mout_hpm", DIV_CPU1, 0, 3),
 	DIV(0, "div_hpm", "div_copy", DIV_CPU1, 4, 3),
 	DIV(0, "div_clkout_cpu", "mout_clkout_cpu", CLKOUT_CMU_CPU, 8, 6),
@@ -769,7 +769,6 @@ static struct samsung_div_clock exynos4_div_clks[] __initdata = {
 	DIV(0, "div_spi_pre2", "div_spi2", DIV_PERIL2, 8, 8),
 	DIV(0, "div_audio1", "mout_audio1", DIV_PERIL4, 0, 4),
 	DIV(0, "div_audio2", "mout_audio2", DIV_PERIL4, 16, 4),
-	DIV(CLK_ARM_CLK, "arm_clk", "div_core2", DIV_CPU0, 28, 3),
 	DIV(CLK_SCLK_APLL, "sclk_apll", "mout_apll", DIV_CPU0, 24, 3),
 	DIV_F(0, "div_mipi_pre0", "div_mipi0", DIV_LCD0, 20, 4,
 			CLK_SET_RATE_PARENT, 0),
@@ -1486,7 +1485,7 @@ static void __init exynos4_clk_init(struct device_node *np,
 		exynos4_soc == EXYNOS4210 ? "Exynos4210" : "Exynos4x12",
 		_get_rate("sclk_apll"),	_get_rate("sclk_mpll"),
 		_get_rate("sclk_epll"), _get_rate("sclk_vpll"),
-		_get_rate("arm_clk"));
+		_get_rate("div_core2"));
 }
 
 
-- 
1.7.9.5
