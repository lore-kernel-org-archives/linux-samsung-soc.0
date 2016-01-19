From: Andi Shyti <andi.shyti@samsung.com>
Subject: [PATCH v2 3/3] clk: s2mps11: remove redundant code
Date: Tue, 19 Jan 2016 17:52:32 +0900
Message-ID: <1453193552-4761-4-git-send-email-andi.shyti@samsung.com>
References: <1453193552-4761-1-git-send-email-andi.shyti@samsung.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <1453193552-4761-1-git-send-email-andi.shyti@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Andi Shyti <andi@etezian.org>, Yadwinder Singh Brar <yadi.brar01@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch performs some code removal as it uses some variables
for temporary use. Three changes:

* In the probe function the s2mps11_clk pointer is used only to
iterate through the s2mps11_clks. The naming itself brings
confusion and the readability is not improved.

* the s2mps11_name() define resolves the name of the a given
device. As it is used only once, we can expand it where it's used
and remove the defininition.

* The **clk_table variable is declared as a static variable and
used to reference some allocated memory, it's then assigned to
the clk_data.clks. This cycle can be skipped and the declaration
avoided.

Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
 drivers/clk/clk-s2mps11.c | 44 +++++++++++++++++++-------------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index cae92fc..09344bb 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -28,9 +28,6 @@
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/mfd/samsung/core.h>
 
-#define s2mps11_name(a) (a->hw.init->name)
-
-static struct clk **clk_table;
 static struct clk_onecell_data clk_data;
 
 enum {
@@ -139,21 +136,19 @@ static struct device_node *s2mps11_clk_parse_dt(struct platform_device *pdev,
 static int s2mps11_clk_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
-	struct s2mps11_clk *s2mps11_clks, *s2mps11_clk;
+	struct s2mps11_clk *s2mps11_clks;
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
-	clk_table = devm_kcalloc(&pdev->dev, S2MPS11_CLKS_NUM,
+	clk_data.clks = devm_kcalloc(&pdev->dev, S2MPS11_CLKS_NUM,
 				sizeof(struct clk *), GFP_KERNEL);
-	if (!clk_table)
+	if (!clk_data.clks)
 		return -ENOMEM;
 
 	switch (hwid) {
@@ -179,33 +174,32 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
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
-		clk_table[i] = s2mps11_clks[i].clk;
+		clk_data.clks[i] = s2mps11_clks[i].clk;
 	}
 
-	clk_data.clks = clk_table;
 	clk_data.clk_num = S2MPS11_CLKS_NUM;
 	of_clk_add_provider(s2mps11_clks->clk_np, of_clk_src_onecell_get,
 			&clk_data);
-- 
2.7.0.rc3

