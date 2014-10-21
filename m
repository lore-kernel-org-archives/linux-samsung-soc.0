From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 1/4] regulator: max77686: Replace hard-coded opmode values
 with defines
Date: Tue, 21 Oct 2014 13:23:14 +0200
Message-ID: <1413890597-31037-2-git-send-email-k.kozlowski@samsung.com>
References: <1413890597-31037-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:10437 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755290AbaJULYA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Oct 2014 07:24:00 -0400
In-reply-to: <1413890597-31037-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Add defines for regulator operating modes which should be more readable,
especially if one does not have Maxim 77686 datasheet.

The patch does not introduce any functional change.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Suggested-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/regulator/max77686.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max77686.c
index ef1af2debbd2..cffe0c69d57d 100644
--- a/drivers/regulator/max77686.c
+++ b/drivers/regulator/max77686.c
@@ -45,6 +45,16 @@
 #define MAX77686_DVS_MINUV	600000
 #define MAX77686_DVS_UVSTEP	12500
 
+/* On/off controlled by PWRREQ */
+#define MAX77686_OPMODE_OFF_PWRREQ	0x1
+/*
+ * For some regulators this means:
+ *  - forcing low power mode.
+ *  - low power mode controlled by PWRREQ.
+ */
+#define MAX77686_OPMODE_LOWPOWER	0x2
+#define MAX77686_OPMODE_NORMAL		0x3
+
 #define MAX77686_OPMODE_SHIFT	6
 #define MAX77686_OPMODE_BUCK234_SHIFT	4
 #define MAX77686_OPMODE_MASK	0x3
@@ -76,9 +86,10 @@ static int max77686_buck_set_suspend_disable(struct regulator_dev *rdev)
 	int ret, id = rdev_get_id(rdev);
 
 	if (id == MAX77686_BUCK1)
-		val = 0x1;
+		val = MAX77686_OPMODE_OFF_PWRREQ;
 	else
-		val = 0x1 << MAX77686_OPMODE_BUCK234_SHIFT;
+		val = MAX77686_OPMODE_OFF_PWRREQ
+			<< MAX77686_OPMODE_BUCK234_SHIFT;
 
 	ret = regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
 				 rdev->desc->enable_mask, val);
@@ -103,10 +114,10 @@ static int max77686_set_suspend_mode(struct regulator_dev *rdev,
 
 	switch (mode) {
 	case REGULATOR_MODE_IDLE:			/* ON in LP Mode */
-		val = 0x2 << MAX77686_OPMODE_SHIFT;
+		val = MAX77686_OPMODE_LOWPOWER << MAX77686_OPMODE_SHIFT;
 		break;
 	case REGULATOR_MODE_NORMAL:			/* ON in Normal Mode */
-		val = 0x3 << MAX77686_OPMODE_SHIFT;
+		val = MAX77686_OPMODE_NORMAL << MAX77686_OPMODE_SHIFT;
 		break;
 	default:
 		pr_warn("%s: regulator_suspend_mode : 0x%x not supported\n",
@@ -133,13 +144,13 @@ static int max77686_ldo_set_suspend_mode(struct regulator_dev *rdev,
 
 	switch (mode) {
 	case REGULATOR_MODE_STANDBY:			/* switch off */
-		val = 0x1 << MAX77686_OPMODE_SHIFT;
+		val = MAX77686_OPMODE_OFF_PWRREQ << MAX77686_OPMODE_SHIFT;
 		break;
 	case REGULATOR_MODE_IDLE:			/* ON in LP Mode */
-		val = 0x2 << MAX77686_OPMODE_SHIFT;
+		val = MAX77686_OPMODE_LOWPOWER << MAX77686_OPMODE_SHIFT;
 		break;
 	case REGULATOR_MODE_NORMAL:			/* ON in Normal Mode */
-		val = 0x3 << MAX77686_OPMODE_SHIFT;
+		val = MAX77686_OPMODE_NORMAL << MAX77686_OPMODE_SHIFT;
 		break;
 	default:
 		pr_warn("%s: regulator_suspend_mode : 0x%x not supported\n",
-- 
1.9.1
