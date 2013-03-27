From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 13/21] clk: samsung: exynos4: Add missing mout_sata on
 Exynos4210
Date: Wed, 27 Mar 2013 12:02:50 +0100
Message-ID: <1364382178-25248-14-git-send-email-t.figa@samsung.com>
References: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:59825 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751950Ab3C0LHL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Mar 2013 07:07:11 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKB001FHG7YGZT0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Mar 2013 20:07:10 +0900 (KST)
In-reply-to: <1364382178-25248-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, m.szyprowski@samsung.com, t.figa@samsung.com, s.nawrocki@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, a.hajda@samsung.com, l.majewski@samsung.com

This patch adds missing mout_sata that is a parent of div_sata clock.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 0586421..959402f 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -359,6 +359,7 @@ struct samsung_mux_clock exynos4210_mux_clks[] __initdata = {
 	MUX(none, "mout_mmc2", group1_p4210, SRC_FSYS, 8, 4),
 	MUX(none, "mout_mmc3", group1_p4210, SRC_FSYS, 12, 4),
 	MUX(none, "mout_mmc4", group1_p4210, SRC_FSYS, 16, 4),
+	MUX(none, "mout_sata", sclk_ampll_p4210, SRC_FSYS, 24, 1),
 	MUX(none, "mout_uart0", group1_p4210, SRC_PERIL0, 0, 4),
 	MUX(none, "mout_uart1", group1_p4210, SRC_PERIL0, 4, 4),
 	MUX(none, "mout_uart2", group1_p4210, SRC_PERIL0, 8, 4),
-- 
1.8.1.5
