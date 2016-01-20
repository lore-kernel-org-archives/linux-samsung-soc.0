From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v3 3/4] clk: s2mps11: remove redundant static variables
 declaration
Date: Wed, 20 Jan 2016 19:14:23 +0900
Message-ID: <1453284864-8082-4-git-send-email-andi.shyti@samsung.com>
References: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60015 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934081AbcATKOh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2016 05:14:37 -0500
In-reply-to: <1453284864-8082-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>, Jaehoon Chung <jh80.chung@samsung.com>

The clk_table and clk_data are declared static. The clk_table
contains the three clock data stractures belonging to the s2mps11
driver. In the probe function it gets stored into clk_data.

Remove clk_table and refer directly to clk_data.

clk_data, itself, is also declared static. Declare locally it
and allocate it inside the probe function, as it is not used
anywhere else.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
 drivers/clk/clk-s2mps11.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 3ff2162..fac0e20 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -30,9 +30,6 @@
 
 #define s2mps11_name(a) (a->hw.init->name)
 
-static struct clk **clk_table;
-static struct clk_onecell_data clk_data;
-
 enum {
 	S2MPS11_CLK_AP = 0,
 	S2MPS11_CLK_CP,
@@ -145,6 +142,7 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
 	struct s2mps11_clk *s2mps11_clks, *s2mps11_clk;
+	struct clk_onecell_data *clk_data;
 	unsigned int s2mps11_reg;
 	int i, ret = 0;
 	enum sec_device_type hwid = platform_get_device_id(pdev)->driver_data;
@@ -156,9 +154,13 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 
 	s2mps11_clk = s2mps11_clks;
 
-	clk_table = devm_kcalloc(&pdev->dev, S2MPS11_CLKS_NUM,
+	clk_data = devm_kzalloc(&pdev->dev, sizeof(*clk_data), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->clks = devm_kcalloc(&pdev->dev, S2MPS11_CLKS_NUM,
 				sizeof(struct clk *), GFP_KERNEL);
-	if (!clk_table)
+	if (!clk_data->clks)
 		return -ENOMEM;
 
 	switch (hwid) {
@@ -207,13 +209,12 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 			ret = -ENOMEM;
 			goto err_reg;
 		}
-		clk_table[i] = s2mps11_clks[i].clk;
+		clk_data->clks[i] = s2mps11_clks[i].clk;
 	}
 
-	clk_data.clks = clk_table;
-	clk_data.clk_num = S2MPS11_CLKS_NUM;
+	clk_data->clk_num = S2MPS11_CLKS_NUM;
 	of_clk_add_provider(s2mps11_clks->clk_np, of_clk_src_onecell_get,
-			&clk_data);
+			clk_data);
 
 	platform_set_drvdata(pdev, s2mps11_clks);
 
-- 
2.7.0.rc3
