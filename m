From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v3 2/4] clk: s2mps11: allocate only one structure for clock init
Date: Wed, 20 Jan 2016 19:14:22 +0900
Message-ID: <1453284864-8082-3-git-send-email-andi.shyti@samsung.com>
References: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45090 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934928AbcATKOr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2016 05:14:47 -0500
In-reply-to: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>

The driver allocates three structures, s2mpsxx_clk_init, for
three different clock types (s2mps11, s2mps13 and s2mps14). They
are quite similar but they differ only by the name. Only one of
these structures is used, while the others lie unused in the
memory.

The clock's name, though, is not such a meaningful information
and by assigning the same name to the initial data we can avoid
over allocation. The common name chosen will be s2mps11,
coherently with the device driver name, instead of the clock
device.

Therefore, remove the structures associated to s2mps13 and
s2mps14 and use only the one referred to s2mps11 for all kind of
clocks.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/clk/clk-s2mps11.c | 51 +++++++----------------------------------------
 1 file changed, 7 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index e7b97f4..3ff2162 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -99,6 +99,7 @@ static struct clk_ops s2mps11_clk_ops = {
 	.recalc_rate	= s2mps11_clk_recalc_rate,
 };
 
+/* This s2mps11_clks_init tructure is common to s2mps11, s2mps13 and s2mps14 */
 static struct clk_init_data s2mps11_clks_init[S2MPS11_CLKS_NUM] = {
 	[S2MPS11_CLK_AP] = {
 		.name = "s2mps11_ap",
@@ -117,37 +118,6 @@ static struct clk_init_data s2mps11_clks_init[S2MPS11_CLKS_NUM] = {
 	},
 };
 
-static struct clk_init_data s2mps13_clks_init[S2MPS11_CLKS_NUM] = {
-	[S2MPS11_CLK_AP] = {
-		.name = "s2mps13_ap",
-		.ops = &s2mps11_clk_ops,
-		.flags = CLK_IS_ROOT,
-	},
-	[S2MPS11_CLK_CP] = {
-		.name = "s2mps13_cp",
-		.ops = &s2mps11_clk_ops,
-		.flags = CLK_IS_ROOT,
-	},
-	[S2MPS11_CLK_BT] = {
-		.name = "s2mps13_bt",
-		.ops = &s2mps11_clk_ops,
-		.flags = CLK_IS_ROOT,
-	},
-};
-
-static struct clk_init_data s2mps14_clks_init[S2MPS11_CLKS_NUM] = {
-	[S2MPS11_CLK_AP] = {
-		.name = "s2mps14_ap",
-		.ops = &s2mps11_clk_ops,
-		.flags = CLK_IS_ROOT,
-	},
-	[S2MPS11_CLK_BT] = {
-		.name = "s2mps14_bt",
-		.ops = &s2mps11_clk_ops,
-		.flags = CLK_IS_ROOT,
-	},
-};
-
 static struct device_node *s2mps11_clk_parse_dt(struct platform_device *pdev,
 		struct clk_init_data *clks_init)
 {
@@ -164,12 +134,9 @@ static struct device_node *s2mps11_clk_parse_dt(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	for (i = 0; i < S2MPS11_CLKS_NUM; i++) {
-		if (!clks_init[i].name)
-			continue; /* Skip clocks not present in some devices */
+	for (i = 0; i < S2MPS11_CLKS_NUM; i++)
 		of_property_read_string_index(clk_np, "clock-output-names", i,
 				&clks_init[i].name);
-	}
 
 	return clk_np;
 }
@@ -179,8 +146,8 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
 	struct s2mps11_clk *s2mps11_clks, *s2mps11_clk;
 	unsigned int s2mps11_reg;
-	struct clk_init_data *clks_init;
 	int i, ret = 0;
+	enum sec_device_type hwid = platform_get_device_id(pdev)->driver_data;
 
 	s2mps11_clks = devm_kcalloc(&pdev->dev, S2MPS11_CLKS_NUM,
 				sizeof(*s2mps11_clk), GFP_KERNEL);
@@ -194,22 +161,18 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	if (!clk_table)
 		return -ENOMEM;
 
-	switch(platform_get_device_id(pdev)->driver_data) {
+	switch (hwid) {
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
-		clks_init = s2mps11_clks_init;
 		break;
 	case S2MPS13X:
 		s2mps11_reg = S2MPS13_REG_RTCCTRL;
-		clks_init = s2mps13_clks_init;
 		break;
 	case S2MPS14X:
 		s2mps11_reg = S2MPS14_REG_RTCCTRL;
-		clks_init = s2mps14_clks_init;
 		break;
 	case S5M8767X:
 		s2mps11_reg = S5M8767_REG_CTRL1;
-		clks_init = s2mps11_clks_init;
 		break;
 	default:
 		dev_err(&pdev->dev, "Invalid device type\n");
@@ -217,15 +180,15 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	}
 
 	/* Store clocks of_node in first element of s2mps11_clks array */
-	s2mps11_clks->clk_np = s2mps11_clk_parse_dt(pdev, clks_init);
+	s2mps11_clks->clk_np = s2mps11_clk_parse_dt(pdev, s2mps11_clks_init);
 	if (IS_ERR(s2mps11_clks->clk_np))
 		return PTR_ERR(s2mps11_clks->clk_np);
 
 	for (i = 0; i < S2MPS11_CLKS_NUM; i++, s2mps11_clk++) {
-		if (!clks_init[i].name)
+		if (i == S2MPS11_CLK_CP && hwid == S2MPS14X)
 			continue; /* Skip clocks not present in some devices */
 		s2mps11_clk->iodev = iodev;
-		s2mps11_clk->hw.init = &clks_init[i];
+		s2mps11_clk->hw.init = &s2mps11_clks_init[i];
 		s2mps11_clk->mask = 1 << i;
 		s2mps11_clk->reg = s2mps11_reg;
 
-- 
2.7.0.rc3
