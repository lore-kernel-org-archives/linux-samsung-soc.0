From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v3 4/4] clk: s2mps11: remove redundant code
Date: Wed, 20 Jan 2016 19:14:24 +0900
Message-ID: <1453284864-8082-5-git-send-email-andi.shyti@samsung.com>
References: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34644 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934350AbcATKOh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2016 05:14:37 -0500
In-reply-to: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>

The definition of s2mps11_name is meant to resolve the name of a
given clock. Remove it because the clocks have the same name we
can get it directly from the s2mps11_clks_init structure.

While in the probe function the s2mps11_clks is used only to
iterate through the s2mps11_clks. The naming itself brings
confusion and the readability does not improve much.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
 drivers/clk/clk-s2mps11.c | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index fac0e20..371150a 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -28,8 +28,6 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/mfd/samsung/core.h>
 
-#define s2mps11_name(a) (a->hw.init->name)
-
 enum {
 	S2MPS11_CLK_AP = 0,
 	S2MPS11_CLK_CP,
@@ -141,19 +139,17 @@ static struct device_node *s2mps11_clk_parse_dt(struct platform_device *pdev,
 static int s2mps11_clk_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
-	struct s2mps11_clk *s2mps11_clks, *s2mps11_clk;
+	struct s2mps11_clk *s2mps11_clks;
 	struct clk_onecell_data *clk_data;
 	unsigned int s2mps11_reg;
 	int i, ret = 0;
 	enum sec_device_type hwid = platform_get_device_id(pdev)->driver_data;
 
 	s2mps11_clks = devm_kcalloc(&pdev->dev, S2MPS11_CLKS_NUM,
-				sizeof(*s2mps11_clk), GFP_KERNEL);
+				sizeof(*s2mps11_clks), GFP_KERNEL);
 	if (!s2mps11_clks)
 		return -ENOMEM;
 
-	s2mps11_clk = s2mps11_clks;
-
 	clk_data = devm_kzalloc(&pdev->dev, sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
@@ -186,26 +182,26 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(s2mps11_clks->clk_np))
 		return PTR_ERR(s2mps11_clks->clk_np);
 
-	for (i = 0; i < S2MPS11_CLKS_NUM; i++, s2mps11_clk++) {
+	for (i = 0; i < S2MPS11_CLKS_NUM; i++) {
 		if (i == S2MPS11_CLK_CP && hwid == S2MPS14X)
 			continue; /* Skip clocks not present in some devices */
-		s2mps11_clk->iodev = iodev;
-		s2mps11_clk->hw.init = &s2mps11_clks_init[i];
-		s2mps11_clk->mask = 1 << i;
-		s2mps11_clk->reg = s2mps11_reg;
-
-		s2mps11_clk->clk = devm_clk_register(&pdev->dev,
-							&s2mps11_clk->hw);
-		if (IS_ERR(s2mps11_clk->clk)) {
+		s2mps11_clks[i].iodev = iodev;
+		s2mps11_clks[i].hw.init = &s2mps11_clks_init[i];
+		s2mps11_clks[i].mask = 1 << i;
+		s2mps11_clks[i].reg = s2mps11_reg;
+
+		s2mps11_clks[i].clk = devm_clk_register(&pdev->dev,
+							&s2mps11_clks[i].hw);
+		if (IS_ERR(s2mps11_clks[i].clk)) {
 			dev_err(&pdev->dev, "Fail to register : %s\n",
-						s2mps11_name(s2mps11_clk));
-			ret = PTR_ERR(s2mps11_clk->clk);
+						s2mps11_clks_init[i].name);
+			ret = PTR_ERR(s2mps11_clks[i].clk);
 			goto err_reg;
 		}
 
-		s2mps11_clk->lookup = clkdev_create(s2mps11_clk->clk,
-					s2mps11_name(s2mps11_clk), NULL);
-		if (!s2mps11_clk->lookup) {
+		s2mps11_clks[i].lookup = clkdev_create(s2mps11_clks[i].clk,
+					s2mps11_clks_init[i].name, NULL);
+		if (!s2mps11_clks[i].lookup) {
 			ret = -ENOMEM;
 			goto err_reg;
 		}
-- 
2.7.0.rc3
