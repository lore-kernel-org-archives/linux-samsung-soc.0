From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] clk: samsung: exynos7: Don't gate CMU_{CCORE,
 FSYS0} blocks clock
Date: Thu, 14 Apr 2016 10:12:52 +0530
Message-ID: <1460608972-13878-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36929 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750982AbcDNEmr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Apr 2016 00:42:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, s.nawrocki@samsung.com
Cc: thomas.ab@samsung.com, k.kozlowski@samsung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com, tomasz.figa@gmail.com

This patch adds CLK_IS_CRITICAL flag to ACLK_CCORE_133 and ACLK_FSYS0_200
clocks. These clocks are critical for accessing CMU_CCORE and CMU_FSYS0
blocks registers. Let these clocks to be enabled all the time.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index ad68d46..03a82da 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -146,7 +146,7 @@ static struct samsung_pll_rate_table pll1460x_24mhz_tbl[] __initdata = {
 
 static struct samsung_gate_clock topc_gate_clks[] __initdata = {
 	GATE(ACLK_CCORE_133, "aclk_ccore_133", "dout_aclk_ccore_133",
-		ENABLE_ACLK_TOPC0, 4, 0, 0),
+		ENABLE_ACLK_TOPC0, 4, CLK_IS_CRITICAL, 0),
 
 	GATE(ACLK_MSCL_532, "aclk_mscl_532", "dout_aclk_mscl_532",
 		ENABLE_ACLK_TOPC1, 20, 0, 0),
@@ -539,7 +539,8 @@ static struct samsung_gate_clock top1_gate_clks[] __initdata = {
 		ENABLE_SCLK_TOP1_FSYS11, 12, CLK_SET_RATE_PARENT, 0),
 
 	GATE(CLK_ACLK_FSYS0_200, "aclk_fsys0_200", "dout_aclk_fsys0_200",
-		ENABLE_ACLK_TOP13, 28, CLK_SET_RATE_PARENT, 0),
+		ENABLE_ACLK_TOP13, 28, CLK_SET_RATE_PARENT |
+		CLK_IS_CRITICAL, 0),
 	GATE(CLK_ACLK_FSYS1_200, "aclk_fsys1_200", "dout_aclk_fsys1_200",
 		ENABLE_ACLK_TOP13, 24, CLK_SET_RATE_PARENT, 0),
 
-- 
1.7.10.4
