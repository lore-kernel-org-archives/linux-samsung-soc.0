From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2] mfd: sec-core: Cleanup formatting to a consistent style
Date: Mon, 11 Feb 2019 14:20:23 +0100
Message-ID: <1549891223-14269-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Cleanup the formatting to have consistent style across the file (only
white-space issues).  No expected difference in code.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Leave one-liners as is.
---
 drivers/mfd/sec-core.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 00321011de0a..521319086c81 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -114,7 +114,8 @@ static const struct mfd_cell s2mpu02_devs[] = {
 
 #ifdef CONFIG_OF
 static const struct of_device_id sec_dt_match[] = {
-	{	.compatible = "samsung,s5m8767-pmic",
+	{
+		.compatible = "samsung,s5m8767-pmic",
 		.data = (void *)S5M8767X,
 	}, {
 		.compatible = "samsung,s2mps11-pmic",
@@ -309,8 +310,8 @@ static void sec_pmic_configure(struct sec_pmic_dev *sec_pmic)
  * the sub-modules need not instantiate another instance while parsing their
  * platform data.
  */
-static struct sec_platform_data *sec_pmic_i2c_parse_dt_pdata(
-					struct device *dev)
+static struct sec_platform_data *
+sec_pmic_i2c_parse_dt_pdata(struct device *dev)
 {
 	struct sec_platform_data *pd;
 
@@ -331,8 +332,8 @@ static struct sec_platform_data *sec_pmic_i2c_parse_dt_pdata(
 	return pd;
 }
 #else
-static struct sec_platform_data *sec_pmic_i2c_parse_dt_pdata(
-					struct device *dev)
+static struct sec_platform_data *
+sec_pmic_i2c_parse_dt_pdata(struct device *dev)
 {
 	return NULL;
 }
-- 
2.7.4
