From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/3] regulator: s2mps11: Don't store registered regulators in
 state container
Date: Fri, 28 Feb 2014 11:01:48 +0100
Message-ID: <1393581710-17754-2-git-send-email-k.kozlowski@samsung.com>
References: <1393581710-17754-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:64678 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751198AbaB1KCF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Feb 2014 05:02:05 -0500
In-reply-to: <1393581710-17754-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Regulators registered by devm_regulator_register() do not have to be
stored in state container because they are never dereferenced later.
The array of regulator_dev can be safely removed from state container.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/regulator/s2mps11.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index cd0b9e35a56d..3647d590b962 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -28,8 +28,6 @@
 #define S2MPS11_REGULATOR_CNT ARRAY_SIZE(regulators)
 
 struct s2mps11_info {
-	struct regulator_dev *rdev[S2MPS11_REGULATOR_MAX];
-
 	int ramp_delay2;
 	int ramp_delay34;
 	int ramp_delay5;
@@ -439,6 +437,8 @@ common_reg:
 	config.regmap = iodev->regmap_pmic;
 	config.driver_data = s2mps11;
 	for (i = 0; i < S2MPS11_REGULATOR_MAX; i++) {
+		struct regulator_dev *regulator;
+
 		if (!reg_np) {
 			config.init_data = pdata->regulators[i].initdata;
 			config.of_node = pdata->regulators[i].reg_node;
@@ -447,10 +447,10 @@ common_reg:
 			config.of_node = rdata[i].of_node;
 		}
 
-		s2mps11->rdev[i] = devm_regulator_register(&pdev->dev,
+		regulator = devm_regulator_register(&pdev->dev,
 						&regulators[i], &config);
-		if (IS_ERR(s2mps11->rdev[i])) {
-			ret = PTR_ERR(s2mps11->rdev[i]);
+		if (IS_ERR(regulator)) {
+			ret = PTR_ERR(regulator);
 			dev_err(&pdev->dev, "regulator init failed for %d\n",
 				i);
 			return ret;
-- 
1.7.9.5
