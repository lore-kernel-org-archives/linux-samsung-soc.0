From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH] clk: samsung: exynos7: Fix fsys NR_CLK
Date: Fri, 19 Dec 2014 18:57:05 +0530
Message-ID: <1418995625-13650-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:9724 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752077AbaLSNee (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Dec 2014 08:34:34 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NGU008NJ0DKGK10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Dec 2014 22:34:32 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, mturquette@linaro.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com

Fix typo in fsys0 and fsys1 NR_CLK assignment

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 drivers/clk/samsung/clk-exynos7.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7.c b/drivers/clk/samsung/clk-exynos7.c
index 3128593..3a56875 100644
--- a/drivers/clk/samsung/clk-exynos7.c
+++ b/drivers/clk/samsung/clk-exynos7.c
@@ -742,7 +742,7 @@ static struct samsung_cmu_info fsys0_cmu_info __initdata = {
 	.nr_mux_clks		= ARRAY_SIZE(fsys0_mux_clks),
 	.gate_clks		= fsys0_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(fsys0_gate_clks),
-	.nr_clk_ids		= TOP1_NR_CLK,
+	.nr_clk_ids		= FSYS0_NR_CLK,
 	.clk_regs		= fsys0_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(fsys0_clk_regs),
 };
@@ -793,7 +793,7 @@ static struct samsung_cmu_info fsys1_cmu_info __initdata = {
 	.nr_mux_clks		= ARRAY_SIZE(fsys1_mux_clks),
 	.gate_clks		= fsys1_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(fsys1_gate_clks),
-	.nr_clk_ids		= TOP1_NR_CLK,
+	.nr_clk_ids		= FSYS1_NR_CLK,
 	.clk_regs		= fsys1_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(fsys1_clk_regs),
 };
-- 
1.7.4.4
