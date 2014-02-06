From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 2/9] clk: samsung: Provide common helpers for register
 save/restore
Date: Thu, 06 Feb 2014 19:16:49 +0100
Message-ID: <1391710616-14226-3-git-send-email-t.figa@samsung.com>
References: <1391710616-14226-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:12398 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752942AbaBFSRG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Feb 2014 13:17:06 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N0L008QE6SGT1A0@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 06 Feb 2014 18:17:04 +0000 (GMT)
In-reply-to: <1391710616-14226-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Rahul Sharma <r.sh.open@gmail.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Tomasz Figa <t.figa@samsung.com>

As suspend/resume handlers are being moved to SoC specific code, due to
differencies in suspend/resume handling of particular SoCs, to minimize
code duplication this patch provides common register save/restore
helpers that save/restore given list of registers of clock controller.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
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
1.8.5.2
