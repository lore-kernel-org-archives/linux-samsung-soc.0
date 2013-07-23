From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH v3 2/8] clk: samsung: pll: Add support for PLL6552 and PLL6553
Date: Wed, 24 Jul 2013 01:52:19 +0200
Message-ID: <11551938.yDBcNngaZN@flatron>
References: <1374536965-3545-1-git-send-email-tomasz.figa@gmail.com> <1374536965-3545-3-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f41.google.com ([209.85.214.41]:58477 "EHLO
	mail-bk0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934168Ab3GWXwY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Jul 2013 19:52:24 -0400
In-Reply-To: <1374536965-3545-3-git-send-email-tomasz.figa@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@kernel.org>, Mike Turquette <mturquette@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, stern@rowland.harvard.edu, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Thomas Abraham <thomas.abraham@linaro.org>

This patch adds support for PLL6552 and PLL6553 PLLs present on Samsung
S3C64xx SoCs.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
Acked-by: Mike Turquette <mturquette@linaro.org>
---
 drivers/clk/samsung/clk-pll.c | 77 +++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/samsung/clk-pll.h |  2 ++
 2 files changed, 79 insertions(+)

Changes since v2:
 - Reworked to use new PLL registration method introduced by Yadwinder
   Singh Brar's patch series:
   ( http://thread.gmane.org/gmane.linux.kernel.samsung-soc/20041 )

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index f80efb6..7572d1d 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -438,6 +438,77 @@ struct clk * __init samsung_clk_register_pll46xx(const char *name,
 }
 
 /*
+ * PLL6552 Clock Type
+ */
+
+#define PLL6552_MDIV_MASK	0x3ff
+#define PLL6552_PDIV_MASK	0x3f
+#define PLL6552_SDIV_MASK	0x7
+#define PLL6552_MDIV_SHIFT	16
+#define PLL6552_PDIV_SHIFT	8
+#define PLL6552_SDIV_SHIFT	0
+
+static unsigned long samsung_pll6552_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 mdiv, pdiv, sdiv, pll_con;
+	u64 fvco = parent_rate;
+
+	pll_con = __raw_readl(pll->con_reg);
+	mdiv = (pll_con >> PLL6552_MDIV_SHIFT) & PLL6552_MDIV_MASK;
+	pdiv = (pll_con >> PLL6552_PDIV_SHIFT) & PLL6552_PDIV_MASK;
+	sdiv = (pll_con >> PLL6552_SDIV_SHIFT) & PLL6552_SDIV_MASK;
+
+	fvco *= mdiv;
+	do_div(fvco, (pdiv << sdiv));
+
+	return (unsigned long)fvco;
+}
+
+static const struct clk_ops samsung_pll6552_clk_ops = {
+	.recalc_rate = samsung_pll6552_recalc_rate,
+};
+
+/*
+ * PLL6553 Clock Type
+ */
+
+#define PLL6553_MDIV_MASK	0xff
+#define PLL6553_PDIV_MASK	0x3f
+#define PLL6553_SDIV_MASK	0x7
+#define PLL6553_KDIV_MASK	0xffff
+#define PLL6553_MDIV_SHIFT	16
+#define PLL6553_PDIV_SHIFT	8
+#define PLL6553_SDIV_SHIFT	0
+#define PLL6553_KDIV_SHIFT	0
+
+static unsigned long samsung_pll6553_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct samsung_clk_pll *pll = to_clk_pll(hw);
+	u32 mdiv, pdiv, sdiv, kdiv, pll_con0, pll_con1;
+	u64 fvco = parent_rate;
+
+	pll_con0 = __raw_readl(pll->con_reg);
+	pll_con1 = __raw_readl(pll->con_reg + 0x4);
+	mdiv = (pll_con0 >> PLL6553_MDIV_SHIFT) & PLL6553_MDIV_MASK;
+	pdiv = (pll_con0 >> PLL6553_PDIV_SHIFT) & PLL6553_PDIV_MASK;
+	sdiv = (pll_con0 >> PLL6553_SDIV_SHIFT) & PLL6553_SDIV_MASK;
+	kdiv = (pll_con1 >> PLL6553_KDIV_SHIFT) & PLL6553_KDIV_MASK;
+
+	fvco *= (mdiv << 16) + kdiv;
+	do_div(fvco, (pdiv << sdiv));
+	fvco >>= 16;
+
+	return (unsigned long)fvco;
+}
+
+static const struct clk_ops samsung_pll6553_clk_ops = {
+	.recalc_rate = samsung_pll6553_recalc_rate,
+};
+
+/*
  * PLL2550x Clock Type
  */
 
@@ -572,6 +643,12 @@ static void __init _samsung_clk_register_pll(struct samsung_pll_clock *pll_clk,
 		else
 			init.ops = &samsung_pll36xx_clk_ops;
 		break;
+	case pll_6552:
+		init.ops = &samsung_pll6552_clk_ops;
+		break;
+	case pll_6553:
+		init.ops = &samsung_pll6553_clk_ops;
+		break;
 	default:
 		pr_warn("%s: Unknown pll type for pll clk %s\n",
 			__func__, pll_clk->name);
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 95ae23d..cd11037 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -17,6 +17,8 @@ enum samsung_pll_type {
 	pll_36xx,
 	pll_2550,
 	pll_2650,
+	pll_6552,
+	pll_6553,
 };
 
 #define PLL_35XX_RATE(_rate, _m, _p, _s)			\
-- 
1.8.3.2
