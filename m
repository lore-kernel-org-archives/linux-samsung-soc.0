From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 5/12] clk: samsung: exynos7: Corrects CMU_CCORE clocks names
Date: Thu, 10 Sep 2015 14:14:30 +0530
Message-ID: <1441874677-24148-6-git-send-email-alim.akhtar@samsung.com>
References: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:35195 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753335AbbIJI6D (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Sep 2015 04:58:03 -0400
In-reply-to: <1441874677-24148-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com, gautam.vivek@samsung.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org

This patch renames CMU_CCORE clocks names to match with user manual.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 4bc4760a..b2daf19 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -551,7 +551,7 @@ CLK_OF_DECLARE(exynos7_clk_top1, "samsung,exynos7-clock-top1",
 /*
  * List of parent clocks for Muxes in CMU_CCORE
  */
-PNAME(mout_aclk_ccore_133_p)	= { "fin_pll", "dout_aclk_ccore_133" };
+PNAME(mout_aclk_ccore_133_user_p)	= { "fin_pll", "aclk_ccore_133" };
 
 static unsigned long ccore_clk_regs[] __initdata = {
 	MUX_SEL_CCORE,
@@ -559,7 +559,7 @@ static unsigned long ccore_clk_regs[] __initdata = {
 };
 
 static struct samsung_mux_clock ccore_mux_clks[] __initdata = {
-	MUX(0, "mout_aclk_ccore_133_user", mout_aclk_ccore_133_p,
+	MUX(0, "mout_aclk_ccore_133_user", mout_aclk_ccore_133_user_p,
 		MUX_SEL_CCORE, 1, 1),
 };
 
-- 
1.7.10.4
