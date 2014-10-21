From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 2/4] regulator: max77686: Implement suspend disable for some
 LDOs
Date: Tue, 21 Oct 2014 15:19:53 +0200
Message-ID: <1413897595-28752-3-git-send-email-k.kozlowski@samsung.com>
References: <1413897595-28752-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1413897595-28752-1-git-send-email-k.kozlowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Some LDOs of Maxim 77686 PMIC support disabling during system suspend
(LDO{2,6,7,8,10,11,12,14,15,16}). This was already implemented as part
of set_suspend_mode function. In that case the mode was one of:
 - disable,
 - normal mode,
 - low power mode.
However there are no bindings for setting the mode during suspend.

Add suspend disable for LDO regulators supporting this to the existing
max77686_buck_set_suspend_disable() function. This helps reducing
energy consumption during system sleep.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 drivers/regulator/max77686.c | 43 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/regulator/max77686.c b/drivers/regulator/max77686.c
index 3d0922051488..81f4b69adc82 100644
--- a/drivers/regulator/max77686.c
+++ b/drivers/regulator/max77686.c
@@ -87,18 +87,31 @@ struct max77686_data {
 	unsigned int opmode[MAX77686_REGULATORS];
 };
 
-/* Some BUCKS supports Normal[ON/OFF] mode during suspend */
-static int max77686_buck_set_suspend_disable(struct regulator_dev *rdev)
+/* Some BUCKs and LDOs supports Normal[ON/OFF] mode during suspend */
+static int max77686_set_suspend_disable(struct regulator_dev *rdev)
 {
 	unsigned int val;
 	struct max77686_data *max77686 = rdev_get_drvdata(rdev);
 	int ret, id = rdev_get_id(rdev);
 
-	if (id == MAX77686_BUCK1)
+	switch (id) {
+	case MAX77686_BUCK1:
 		val = MAX77686_BUCK_OFF_PWRREQ;
-	else
-		val = MAX77686_BUCK_OFF_PWRREQ
-			<< MAX77686_OPMODE_BUCK234_SHIFT;
+		break;
+	case MAX77686_BUCK2 ...	MAX77686_BUCK4:
+		val = MAX77686_BUCK_OFF_PWRREQ << MAX77686_OPMODE_BUCK234_SHIFT;
+		break;
+	case MAX77686_LDO2:
+	case MAX77686_LDO6 ... MAX77686_LDO8:
+	case MAX77686_LDO10 ... MAX77686_LDO12:
+	case MAX77686_LDO14 ... MAX77686_LDO16:
+		val = MAX77686_LDO_OFF_PWRREQ << MAX77686_OPMODE_SHIFT;
+		break;
+	default:
+		pr_warn("%s: regulator_suspend_disable not supported\n",
+			rdev->desc->name);
+		return -EINVAL;
+	}
 
 	ret = regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
 				 rdev->desc->enable_mask, val);
@@ -180,6 +193,16 @@ static int max77686_enable(struct regulator_dev *rdev)
 {
 	struct max77686_data *max77686 = rdev_get_drvdata(rdev);
 
+	/*
+	 * One enable function is used for LDO and bucks. Assuming
+	 * the same values are used for enable registers.
+	 */
+	BUILD_BUG_ON(MAX77686_LDO_OFF_PWRREQ != MAX77686_BUCK_OFF_PWRREQ);
+	BUILD_BUG_ON(MAX77686_LDO_NORMAL != MAX77686_BUCK_NORMAL);
+
+	if (max77686->opmode[rdev_get_id(rdev)] == MAX77686_LDO_OFF_PWRREQ)
+		max77686->opmode[rdev_get_id(rdev)] = MAX77686_LDO_NORMAL;
+
 	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
 				  rdev->desc->enable_mask,
 				  max77686->opmode[rdev_get_id(rdev)]);
@@ -232,6 +255,8 @@ static struct regulator_ops max77686_ldo_ops = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
 	.set_suspend_mode	= max77686_ldo_set_suspend_mode,
+	.set_suspend_disable	= max77686_set_suspend_disable,
+	.set_suspend_enable	= max77686_enable,
 };
 
 static struct regulator_ops max77686_buck1_ops = {
@@ -243,7 +268,8 @@ static struct regulator_ops max77686_buck1_ops = {
 	.get_voltage_sel	= regulator_get_voltage_sel_regmap,
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
-	.set_suspend_disable	= max77686_buck_set_suspend_disable,
+	.set_suspend_disable	= max77686_set_suspend_disable,
+	.set_suspend_enable	= max77686_enable,
 };
 
 static struct regulator_ops max77686_buck_dvs_ops = {
@@ -256,7 +282,8 @@ static struct regulator_ops max77686_buck_dvs_ops = {
 	.set_voltage_sel	= regulator_set_voltage_sel_regmap,
 	.set_voltage_time_sel	= regulator_set_voltage_time_sel,
 	.set_ramp_delay		= max77686_set_ramp_delay,
-	.set_suspend_disable	= max77686_buck_set_suspend_disable,
+	.set_suspend_disable	= max77686_set_suspend_disable,
+	.set_suspend_enable	= max77686_enable,
 };
 
 #define regulator_desc_ldo(num)		{				\
-- 
1.9.1
