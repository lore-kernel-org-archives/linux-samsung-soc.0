From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 1/8] regulator: max77686: Consistently index opmode array by
 rdev id
Date: Wed, 29 Oct 2014 16:06:39 +0100
Message-ID: <1414595206-1437-2-git-send-email-k.kozlowski@samsung.com>
References: <1414595206-1437-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47969 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933465AbaJ2PLD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Oct 2014 11:11:03 -0400
In-reply-to: <1414595206-1437-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Mixed indexes were used for array of opmodes in max77686_data structure:
id of regulator and index of regulator_desc array.

These indexes are exactly the same but the mixture may confuse. Use
consistently the id of regulator.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/regulator/max77686.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max77686.c
index 09b0d8c20a9d..27c5f4556044 100644
--- a/drivers/regulator/max77686.c
+++ b/drivers/regulator/max77686.c
@@ -82,6 +82,7 @@ enum max77686_ramp_rate {
 };
 
 struct max77686_data {
+	/* Array indexed by regulator id */
 	unsigned int opmode[MAX77686_REGULATORS];
 };
 
@@ -513,12 +514,13 @@ static int max77686_pmic_probe(struct platform_device *pdev)
 
 	for (i = 0; i < MAX77686_REGULATORS; i++) {
 		struct regulator_dev *rdev;
+		int id = regulators[i].id;
 
 		config.init_data = pdata->regulators[i].initdata;
 		config.of_node = pdata->regulators[i].of_node;
 
-		max77686->opmode[i] = regulators[i].enable_mask >>
-						max77686_get_opmode_shift(i);
+		max77686->opmode[id] = regulators[i].enable_mask >>
+						max77686_get_opmode_shift(id);
 		rdev = devm_regulator_register(&pdev->dev,
 						&regulators[i], &config);
 		if (IS_ERR(rdev)) {
-- 
1.9.1
