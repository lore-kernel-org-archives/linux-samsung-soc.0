From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/4] mfd: sec: Select different RTC regmaps for devices
Date: Fri, 28 Feb 2014 11:41:42 +0100
Message-ID: <1393584104-18912-3-git-send-email-k.kozlowski@samsung.com>
References: <1393584104-18912-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1393584104-18912-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch prepares for adding support for S2MPS14 RTC driver by
selecting different regmaps for S2MPS1X/S5M876X RTC devices.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/sec-core.c |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 074939c9bd42..e717c6dfb105 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -199,7 +199,7 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
 {
 	struct sec_platform_data *pdata = dev_get_platdata(&i2c->dev);
-	const struct regmap_config *regmap;
+	const struct regmap_config *regmap, *regmap_rtc;
 	struct sec_pmic_dev *sec_pmic;
 	int ret;
 
@@ -233,15 +233,25 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	switch (sec_pmic->device_type) {
 	case S2MPS11X:
 		regmap = &s2mps11_regmap_config;
+		/*
+		 * The rtc-s5m driver does not support S2MPS11 and there
+		 * is no mfd_cell for S2MPS11 RTC device.
+		 * However we must pass something to devm_regmap_init_i2c()
+		 * so use S5M-like regmap config even though it wouldn't work.
+		 */
+		regmap_rtc = &sec_rtc_regmap_config;
 		break;
 	case S5M8763X:
 		regmap = &s5m8763_regmap_config;
+		regmap_rtc = &sec_rtc_regmap_config;
 		break;
 	case S5M8767X:
 		regmap = &s5m8767_regmap_config;
+		regmap_rtc = &sec_rtc_regmap_config;
 		break;
 	default:
 		regmap = &sec_regmap_config;
+		regmap_rtc = &sec_rtc_regmap_config;
 		break;
 	}
 
@@ -260,8 +270,7 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	}
 	i2c_set_clientdata(sec_pmic->rtc, sec_pmic);
 
-	sec_pmic->regmap_rtc = devm_regmap_init_i2c(sec_pmic->rtc,
-			&sec_rtc_regmap_config);
+	sec_pmic->regmap_rtc = devm_regmap_init_i2c(sec_pmic->rtc, regmap_rtc);
 	if (IS_ERR(sec_pmic->regmap_rtc)) {
 		ret = PTR_ERR(sec_pmic->regmap_rtc);
 		dev_err(&i2c->dev, "Failed to allocate RTC register map: %d\n",
-- 
1.7.9.5
