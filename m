From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [RESEND v2] mfd: s2mps11: Add manual shutdown method for Odroid XU3
Date: Mon, 14 Sep 2015 21:12:45 +0900
Message-ID: <1442232765-3211-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:32989 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751421AbbINMNd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Sep 2015 08:13:33 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

On Odroid XU3 board (with S2MPS11 PMIC) the PWRHOLD bit in CTRL1
register must be manually set to 0 before initiating power off sequence.

One of usual power down methods for Exynos based devices looks like:
1. PWRHOLD pin of PMIC is connected to PSHOLD of Exynos SoC.
2. Exynos holds up this pin during system operation.
3. ACOKB pin of PMIC is pulled up to VBATT and optionally to pin in
   other device.
4. When PWRHOLD/PSHOLD goes low, the PMIC will turn off the power if
   ACOKB goes high.

On Odroid XU3 family the difference is in (3) - the ACOKB is grounded.
This means that PMIC must manually set PWRHOLD field to low and then
wait for signal from Application Processor (the usual change in
PWRHOLD/PSHOLD pin will actually cut off the power).

The patch adds respective binding allowing Odroid XU3 device to be
powered off.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Reported-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Acked-by: Lee Jones <lee.jones@linaro.org>

---

The rest of patchset was applied by Kukjin Kim:
 - dt-bindings documentation:
   https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=v4.3-next/dt-samsung-new-3&id=ff1020841cf0ff868d61d44169e7cc32f73599b8
 - DTS change:
   https://git.kernel.org/cgit/linux/kernel/git/kgene/linux-samsung.git/commit/?h=v4.3-next/dt-samsung-new-3&id=5bcbe4ba55bb0ad75c8495ee295bab036735483e

Changes since v2:
1. Just rebase on current next.

Changes since v1:
1. Split bindings documentation to separate patch (suggested by Lee).
2. Fix additional empty line (suggested by Lee).
3. Add Anand's tested-by, Javier's reviewed-by and Lee's acked-by.

Patch is losely based on patch in Hardkernel repository and previous
work of Anand Moon.
---
 drivers/mfd/sec-core.c              | 30 ++++++++++++++++++++++++++++++
 include/linux/mfd/samsung/core.h    |  2 ++
 include/linux/mfd/samsung/s2mps11.h |  1 +
 3 files changed, 33 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index d206a3e8fe87..2d1137a7a0ee 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -278,6 +278,8 @@ static struct sec_platform_data *sec_pmic_i2c_parse_dt_pdata(
 	 * not parsed here.
 	 */
 
+	pd->manual_poweroff = of_property_read_bool(dev->of_node,
+						"samsung,s2mps11-acokb-ground");
 	return pd;
 }
 #else
@@ -440,6 +442,33 @@ static int sec_pmic_remove(struct i2c_client *i2c)
 	return 0;
 }
 
+static void sec_pmic_shutdown(struct i2c_client *i2c)
+{
+	struct sec_pmic_dev *sec_pmic = i2c_get_clientdata(i2c);
+	unsigned int reg, mask;
+
+	if (!sec_pmic->pdata->manual_poweroff)
+		return;
+
+	switch (sec_pmic->device_type) {
+	case S2MPS11X:
+		reg = S2MPS11_REG_CTRL1;
+		mask = S2MPS11_CTRL1_PWRHOLD_MASK;
+		break;
+	default:
+		/*
+		 * Currently only one board with S2MPS11 needs this, so just
+		 * ignore the rest.
+		 */
+		dev_warn(sec_pmic->dev,
+			"Unsupported device %lu for manual power off\n",
+			sec_pmic->device_type);
+		return;
+	}
+
+	regmap_update_bits(sec_pmic->regmap_pmic, reg, mask, 0);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int sec_pmic_suspend(struct device *dev)
 {
@@ -491,6 +520,7 @@ static struct i2c_driver sec_pmic_driver = {
 	},
 	.probe = sec_pmic_probe,
 	.remove = sec_pmic_remove,
+	.shutdown = sec_pmic_shutdown,
 	.id_table = sec_pmic_id,
 };
 
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index 75115384f3fc..aa78957e092f 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -132,6 +132,8 @@ struct sec_platform_data {
 	int				buck2_init;
 	int				buck3_init;
 	int				buck4_init;
+	/* Whether or not manually set PWRHOLD to low during shutdown. */
+	bool				manual_poweroff;
 };
 
 /**
diff --git a/include/linux/mfd/samsung/s2mps11.h b/include/linux/mfd/samsung/s2mps11.h
index 7981a9d77d3f..b288965e8101 100644
--- a/include/linux/mfd/samsung/s2mps11.h
+++ b/include/linux/mfd/samsung/s2mps11.h
@@ -179,6 +179,7 @@ enum s2mps11_regulators {
 #define S2MPS11_BUCK_N_VOLTAGES (S2MPS11_BUCK_VSEL_MASK + 1)
 #define S2MPS11_RAMP_DELAY	25000		/* uV/us */
 
+#define S2MPS11_CTRL1_PWRHOLD_MASK	BIT(4)
 
 #define S2MPS11_BUCK2_RAMP_SHIFT	6
 #define S2MPS11_BUCK34_RAMP_SHIFT	4
-- 
2.1.4
