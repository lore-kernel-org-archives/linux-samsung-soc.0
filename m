From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 09/21] clk: samsung: exynos4: Export mout_core clock of
 Exynos4210
Date: Wed, 27 Mar 2013 12:02:46 +0100
Message-ID: <1364382178-25248-10-git-send-email-t.figa@samsung.com>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43902 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751950Ab3C0LGU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 07:06:20 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKB0097XG6G96X0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Mar 2013 20:06:16 +0900 (KST)
In-reply-to: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, a.hajda@samsung.com, l.majewski@samsung.com

This patch enables clock lookup registration for mout_core clock used in
Exynos4210 cpufreq driver.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 5592a78..8c4cffb 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -311,7 +311,7 @@ struct samsung_mux_clock exynos4210_mux_clks[] __initdata = {
 	MUX(none, "mout_fimd1", group1_p4210, SRC_LCD1, 0, 4),
 	MUX(none, "mout_mipi1", group1_p4210, SRC_LCD1, 12, 4),
 	MUX_A(sclk_mpll, "sclk_mpll", mout_mpll_p, SRC_CPU, 8, 1, "sclk_mpll"),
-	MUX(none, "mout_core", mout_core_p4210, SRC_CPU, 16, 1),
+	MUX_A(mout_core, "mout_core", mout_core_p4210, SRC_CPU, 16, 1, "mout_core"),
 	MUX_A(sclk_vpll, "sclk_vpll", sclk_vpll_p4210,
 			SRC_TOP0, 8, 1, "sclk_vpll"),
 	MUX(none, "mout_fimc0", group1_p4210, SRC_CAM, 0, 4),
-- 
1.8.1.5
