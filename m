From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 2/9] clk: samsung: Provide common helpers for register
 save/restore
Date: Wed, 16 Oct 2013 13:08:11 +0200
Message-ID: <1381921698-5060-3-git-send-email-t.figa@samsung.com>
References: <1381921698-5060-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30793 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760564Ab3JPLI1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Oct 2013 07:08:27 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MUR00GEODLNYT70@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 Oct 2013 12:08:24 +0100 (BST)
In-reply-to: <1381921698-5060-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Kyungmin Park <kyungmin.park@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Tomasz Figa <t.figa@samsung.com>

As suspend/resume handlers are being moved to SoC specific code, due to
differencies in suspend/resume handling of particular SoCs, to minimize
code duplication this patch provides common register save/restore
helpers that save/restore given list of registers of clock controller.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/clk/samsung/clk.c | 32 ++++++++++++++++++++++++++++++++
 drivers/clk/samsung/clk.h | 10 ++++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index f503f32..c0a716b 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -22,6 +22,38 @@ static struct clk_onecell_data clk_data;
 #endif
 
 #ifdef CONFIG_PM_SLEEP
+void samsung_clk_save(void __iomem *base,
+				    struct samsung_clk_reg_dump *rd,
+				    unsigned int num_regs)
+{
+	for (; num_regs > 0; --num_regs, ++rd)
+		rd->value = readl(base + rd->offset);
+}
+
+void samsung_clk_restore(void __iomem *base,
+				      const struct samsung_clk_reg_dump *rd,
+				      unsigned int num_regs)
+{
+	for (; num_regs > 0; --num_regs, ++rd)
+		writel(rd->value, base + rd->offset);
+}
+
+struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(unsigned long *rdump,
+							unsigned long nr_rdump)
+{
+	struct samsung_clk_reg_dump *rd;
+	unsigned int i;
+
+	rd = kcalloc(nr_rdump, sizeof(*rd), GFP_KERNEL);
+	if (!rd)
+		return NULL;
+
+	for (i = 0; i < nr_rdump; ++i)
+		rd[i].offset = rdump[i];
+
+	return rd;
+}
+
 static struct samsung_clk_reg_dump *reg_dump;
 static unsigned long nr_reg_dump;
 
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 31b4174..ec8d46b 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -340,4 +340,14 @@ extern void __init samsung_clk_register_pll(struct samsung_pll_clock *pll_list,
 
 extern unsigned long _get_rate(const char *clk_name);
 
+extern void samsung_clk_save(void __iomem *base,
+			     struct samsung_clk_reg_dump *rd,
+			     unsigned int num_regs);
+extern void samsung_clk_restore(void __iomem *base,
+				const struct samsung_clk_reg_dump *rd,
+				unsigned int num_regs);
+extern struct samsung_clk_reg_dump *samsung_clk_alloc_reg_dump(
+							unsigned long *rdump,
+							unsigned long nr_rdump);
+
 #endif /* __SAMSUNG_CLK_H */
-- 
1.8.3.2
