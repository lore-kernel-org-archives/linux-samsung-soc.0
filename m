From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH] clk: samsung: Initialize clock table with error pointers
Date: Thu, 06 Feb 2014 19:33:11 +0100
Message-ID: <1391711591-19416-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:62335 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751403AbaBFSdX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 13:33:23 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0L00IS57JIXIA0@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Feb 2014 18:33:18 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kyungmin Park <kyungmin.park@samsung.com>, Mike Turquette <mturquette@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Before this patch, the driver was simply zeroing the clock table, which
is incorrect, because invalid clock numbers returned NULL instead of
error pointers. This patch fixes this by changing the driver to
initialize the array with PTR_ERR(-ENOENT).

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 91bec3e..f3a71d0 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -58,12 +58,17 @@ struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
 void __init samsung_clk_init(struct device_node *np, void __iomem *base,
 			     unsigned long nr_clks)
 {
+	int i;
+
 	reg_base = base;
 
-	clk_table = kzalloc(sizeof(struct clk *) * nr_clks, GFP_KERNEL);
+	clk_table = kmalloc(sizeof(struct clk *) * nr_clks, GFP_KERNEL);
 	if (!clk_table)
 		panic("could not allocate clock lookup table\n");
 
+	for (i = 0; i < nr_clks; ++i)
+		clk_table[i] = ERR_PTR(-ENOENT);
+
 	if (!np)
 		return;
 
-- 
1.8.5.2
