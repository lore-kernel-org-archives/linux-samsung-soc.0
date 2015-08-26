From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 3/4] clk: samsung: exynos7: Correct nr_clk_ids for fsys0
Date: Wed, 26 Aug 2015 09:00:43 +0530
Message-ID: <1440559844-12572-4-git-send-email-alim.akhtar@samsung.com>
References: <1440559844-12572-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36436 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751872AbbHZDjc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 25 Aug 2015 23:39:32 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTO023KP7HVV750@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 26 Aug 2015 12:39:31 +0900 (KST)
In-reply-to: <1440559844-12572-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com

This patch corrects the nr_clk_ids for fsys0 block
which is wrongly set to TOP1 clk numbers.
This also adjusts the gate clock order.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 3975465..9245a25 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -848,13 +848,13 @@ static struct samsung_mux_clock fsys0_mux_clks[] __initdata = {
 };
 
 static struct samsung_gate_clock fsys0_gate_clks[] __initdata = {
-	GATE(ACLK_AXIUS_USBDRD30X_FSYS0X, "aclk_axius_usbdrd30x_fsys0x",
-		"mout_aclk_fsys0_200_user",
-		ENABLE_ACLK_FSYS00, 19, 0, 0),
 	GATE(ACLK_PDMA1, "aclk_pdma1", "mout_aclk_fsys0_200_user",
 			ENABLE_ACLK_FSYS00, 3, 0, 0),
 	GATE(ACLK_PDMA0, "aclk_pdma0", "mout_aclk_fsys0_200_user",
 			ENABLE_ACLK_FSYS00, 4, 0, 0),
+	GATE(ACLK_AXIUS_USBDRD30X_FSYS0X, "aclk_axius_usbdrd30x_fsys0x",
+		"mout_aclk_fsys0_200_user",
+		ENABLE_ACLK_FSYS00, 19, 0, 0),
 
 	GATE(ACLK_USBDRD300, "aclk_usbdrd300", "mout_aclk_fsys0_200_user",
 		ENABLE_ACLK_FSYS01, 29, 0, 0),
@@ -886,7 +886,7 @@ static struct samsung_cmu_info fsys0_cmu_info __initdata = {
 	.nr_mux_clks		= ARRAY_SIZE(fsys0_mux_clks),
 	.gate_clks		= fsys0_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(fsys0_gate_clks),
-	.nr_clk_ids		= TOP1_NR_CLK,
+	.nr_clk_ids		= FSYS0_NR_CLK,
 	.clk_regs		= fsys0_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(fsys0_clk_regs),
 };
-- 
1.7.10.4
