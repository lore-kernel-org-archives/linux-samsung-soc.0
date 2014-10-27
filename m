From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 1/4] regulator: max77686: Replace hard-coded opmode values
 with defines
Date: Mon, 27 Oct 2014 13:11:47 +0100
Message-ID: <1414411911-5539-2-git-send-email-k.kozlowski@samsung.com>
References: <1414411911-5539-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1414411911-5539-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Add defines for regulator operating modes which should be more readable,
especially if one does not have Maxim 77686 datasheet.

The patch does not introduce any functional change.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Suggested-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
---
 drivers/regulator/max77686.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max77686.c
index ef1af2debbd2..c625a8a7940d 100644
--- a/drivers/regulator/max77686.c
+++ b/drivers/regulator/max77686.c
@@ -45,6 +45,23 @@
 #define MAX77686_DVS_MINUV	600000
 #define MAX77686_DVS_UVSTEP	12500
 
+/*
+ * Values used for configuring LDOs and bucks.
+ * Forcing low power mode: LDO1, 3-5, 9, 13, 17-26
+ */
+#define MAX77686_LDO_LOWPOWER		0x1
+/*
+ * On/off controlled by PWRREQ:
+ *  - LDO2, 6-8, 10-12, 14-16
+ *  - buck[1234]
+ */
+#define MAX77686_OFF_PWRREQ		0x1
+/* Low power mode controlled by PWRREQ: All LDOs */
+#define MAX77686_LDO_LOWPOWER_PWRREQ	0x2
+/* Forcing low power mode: buck[234] */
+#define MAX77686_BUCK_LOWPOWER		0x2
+#define MAX77686_NORMAL			0x3
+
 #define MAX77686_OPMODE_SHIFT	6
 #define MAX77686_OPMODE_BUCK234_SHIFT	4
 #define MAX77686_OPMODE_MASK	0x3
@@ -76,9 +93,9 @@ static int max77686_buck_set_suspend_disable(struct regulator_dev *rdev)
 	int ret, id = rdev_get_id(rdev);
 
 	if (id == MAX77686_BUCK1)
-		val = 0x1;
+		val = MAX77686_OFF_PWRREQ;
 	else
-		val = 0x1 << MAX77686_OPMODE_BUCK234_SHIFT;
+		val = MAX77686_OFF_PWRREQ << MAX77686_OPMODE_BUCK234_SHIFT;
 
 	ret = regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
 				 rdev->desc->enable_mask, val);
@@ -103,10 +120,10 @@ static int max77686_set_suspend_mode(struct regulator_dev *rdev,
 
 	switch (mode) {
 	case REGULATOR_MODE_IDLE:			/* ON in LP Mode */
-		val = 0x2 << MAX77686_OPMODE_SHIFT;
+		val = MAX77686_LDO_LOWPOWER_PWRREQ << MAX77686_OPMODE_SHIFT;
 		break;
 	case REGULATOR_MODE_NORMAL:			/* ON in Normal Mode */
-		val = 0x3 << MAX77686_OPMODE_SHIFT;
+		val = MAX77686_NORMAL << MAX77686_OPMODE_SHIFT;
 		break;
 	default:
 		pr_warn("%s: regulator_suspend_mode : 0x%x not supported\n",
@@ -133,13 +150,13 @@ static int max77686_ldo_set_suspend_mode(struct regulator_dev *rdev,
 
 	switch (mode) {
 	case REGULATOR_MODE_STANDBY:			/* switch off */
-		val = 0x1 << MAX77686_OPMODE_SHIFT;
+		val = MAX77686_OFF_PWRREQ << MAX77686_OPMODE_SHIFT;
 		break;
 	case REGULATOR_MODE_IDLE:			/* ON in LP Mode */
-		val = 0x2 << MAX77686_OPMODE_SHIFT;
+		val = MAX77686_LDO_LOWPOWER_PWRREQ << MAX77686_OPMODE_SHIFT;
 		break;
 	case REGULATOR_MODE_NORMAL:			/* ON in Normal Mode */
-		val = 0x3 << MAX77686_OPMODE_SHIFT;
+		val = MAX77686_NORMAL << MAX77686_OPMODE_SHIFT;
 		break;
 	default:
 		pr_warn("%s: regulator_suspend_mode : 0x%x not supported\n",
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
