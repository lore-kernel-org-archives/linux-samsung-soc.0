From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 4/4] clk: samsung: exynos7: correct nr_clk_ids for fsys1
Date: Mon, 24 Aug 2015 16:35:56 +0530
Message-ID: <1440414356-1805-5-git-send-email-alim.akhtar@samsung.com>
References: <1440414356-1805-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:53522 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752904AbbHXLPt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 07:15:49 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NTL01ROF3A3CM00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Aug 2015 20:15:39 +0900 (KST)
In-reply-to: <1440414356-1805-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, tomasz.figa@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, mturquette@baylibre.com, amit.daniel@samsung.com

nr_clk_ids for FSYS1 block is wrongly set as TOP1 block,
this patch correct the same.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 2799568..0d7bb7c 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -938,7 +938,7 @@ static struct samsung_cmu_info fsys1_cmu_info __initdata = {
 	.nr_mux_clks		= ARRAY_SIZE(fsys1_mux_clks),
 	.gate_clks		= fsys1_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(fsys1_gate_clks),
-	.nr_clk_ids		= TOP1_NR_CLK,
+	.nr_clk_ids		= FSYS1_NR_CLK,
 	.clk_regs		= fsys1_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(fsys1_clk_regs),
 };
-- 
1.7.10.4
