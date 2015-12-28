From: Geliang Tang <geliangtang@163.com>
Subject: [PATCH 1/3] mfd: use to_i2c_client
Date: Mon, 28 Dec 2015 23:00:14 +0800
Message-ID: <0837727b57d573988a47f3ecb22918e9771e8dbe.1451314502.git.geliangtang@163.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from m50-133.163.com ([123.125.50.133]:49258 "EHLO m50-133.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750803AbbL1PSB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Dec 2015 10:18:01 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>
Cc: Geliang Tang <geliangtang@163.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Use to_i2c_client() instead of open-coding it.

Signed-off-by: Geliang Tang <geliangtang@163.com>
---
 drivers/mfd/88pm80x.c       | 4 ++--
 drivers/mfd/88pm860x-core.c | 4 ++--
 drivers/mfd/max14577.c      | 4 ++--
 drivers/mfd/max77686.c      | 4 ++--
 drivers/mfd/max77693.c      | 4 ++--
 drivers/mfd/max77843.c      | 4 ++--
 drivers/mfd/max8925-i2c.c   | 4 ++--
 drivers/mfd/max8997.c       | 8 ++++----
 drivers/mfd/max8998.c       | 8 ++++----
 drivers/mfd/sec-core.c      | 4 ++--
 10 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/mfd/88pm80x.c b/drivers/mfd/88pm80x.c
index 63445ea..3f24ecb 100644
--- a/drivers/mfd/88pm80x.c
+++ b/drivers/mfd/88pm80x.c
@@ -135,7 +135,7 @@ EXPORT_SYMBOL_GPL(pm80x_deinit);
 #ifdef CONFIG_PM_SLEEP
 static int pm80x_suspend(struct device *dev)
 {
-	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *client = to_i2c_client(dev);
 	struct pm80x_chip *chip = i2c_get_clientdata(client);
 
 	if (chip && chip->wu_flag)
@@ -147,7 +147,7 @@ static int pm80x_suspend(struct device *dev)
 
 static int pm80x_resume(struct device *dev)
 {
-	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *client = to_i2c_client(dev);
 	struct pm80x_chip *chip = i2c_get_clientdata(client);
 
 	if (chip && chip->wu_flag)
diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index 3269a99..e497cee 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -1218,7 +1218,7 @@ static int pm860x_remove(struct i2c_client *client)
 #ifdef CONFIG_PM_SLEEP
 static int pm860x_suspend(struct device *dev)
 {
-	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *client = to_i2c_client(dev);
 	struct pm860x_chip *chip = i2c_get_clientdata(client);
 
 	if (device_may_wakeup(dev) && chip->wakeup_flag)
@@ -1228,7 +1228,7 @@ static int pm860x_suspend(struct device *dev)
 
 static int pm860x_resume(struct device *dev)
 {
-	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *client = to_i2c_client(dev);
 	struct pm860x_chip *chip = i2c_get_clientdata(client);
 
 	if (device_may_wakeup(dev) && chip->wakeup_flag)
diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
index 56e216d..2280b3f 100644
--- a/drivers/mfd/max14577.c
+++ b/drivers/mfd/max14577.c
@@ -495,7 +495,7 @@ MODULE_DEVICE_TABLE(i2c, max14577_i2c_id);
 #ifdef CONFIG_PM_SLEEP
 static int max14577_suspend(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max14577 *max14577 = i2c_get_clientdata(i2c);
 
 	if (device_may_wakeup(dev))
@@ -516,7 +516,7 @@ static int max14577_suspend(struct device *dev)
 
 static int max14577_resume(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max14577 *max14577 = i2c_get_clientdata(i2c);
 
 	if (device_may_wakeup(dev))
diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
index d19be64..d959ebb 100644
--- a/drivers/mfd/max77686.c
+++ b/drivers/mfd/max77686.c
@@ -352,7 +352,7 @@ MODULE_DEVICE_TABLE(i2c, max77686_i2c_id);
 #ifdef CONFIG_PM_SLEEP
 static int max77686_suspend(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max77686_dev *max77686 = i2c_get_clientdata(i2c);
 
 	if (device_may_wakeup(dev))
@@ -374,7 +374,7 @@ static int max77686_suspend(struct device *dev)
 
 static int max77686_resume(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max77686_dev *max77686 = i2c_get_clientdata(i2c);
 
 	if (device_may_wakeup(dev))
diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index 007f729..b83b7a7 100644
--- a/drivers/mfd/max77693.c
+++ b/drivers/mfd/max77693.c
@@ -334,7 +334,7 @@ MODULE_DEVICE_TABLE(i2c, max77693_i2c_id);
 
 static int max77693_suspend(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max77693_dev *max77693 = i2c_get_clientdata(i2c);
 
 	if (device_may_wakeup(dev)) {
@@ -347,7 +347,7 @@ static int max77693_suspend(struct device *dev)
 
 static int max77693_resume(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max77693_dev *max77693 = i2c_get_clientdata(i2c);
 
 	if (device_may_wakeup(dev)) {
diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
index 586098f..7cfc95b 100644
--- a/drivers/mfd/max77843.c
+++ b/drivers/mfd/max77843.c
@@ -197,7 +197,7 @@ MODULE_DEVICE_TABLE(i2c, max77843_id);
 
 static int __maybe_unused max77843_suspend(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max77693_dev *max77843 = i2c_get_clientdata(i2c);
 
 	disable_irq(max77843->irq);
@@ -209,7 +209,7 @@ static int __maybe_unused max77843_suspend(struct device *dev)
 
 static int __maybe_unused max77843_resume(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max77693_dev *max77843 = i2c_get_clientdata(i2c);
 
 	if (device_may_wakeup(dev))
diff --git a/drivers/mfd/max8925-i2c.c b/drivers/mfd/max8925-i2c.c
index b0fe810..70443b1 100644
--- a/drivers/mfd/max8925-i2c.c
+++ b/drivers/mfd/max8925-i2c.c
@@ -215,7 +215,7 @@ static int max8925_remove(struct i2c_client *client)
 #ifdef CONFIG_PM_SLEEP
 static int max8925_suspend(struct device *dev)
 {
-	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *client = to_i2c_client(dev);
 	struct max8925_chip *chip = i2c_get_clientdata(client);
 
 	if (device_may_wakeup(dev) && chip->wakeup_flag)
@@ -225,7 +225,7 @@ static int max8925_suspend(struct device *dev)
 
 static int max8925_resume(struct device *dev)
 {
-	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *client = to_i2c_client(dev);
 	struct max8925_chip *chip = i2c_get_clientdata(client);
 
 	if (device_may_wakeup(dev) && chip->wakeup_flag)
diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 156ed6f..f316348 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -437,7 +437,7 @@ static u8 max8997_dumpaddr_haptic[] = {
 
 static int max8997_freeze(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max8997_dev *max8997 = i2c_get_clientdata(i2c);
 	int i;
 
@@ -459,7 +459,7 @@ static int max8997_freeze(struct device *dev)
 
 static int max8997_restore(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max8997_dev *max8997 = i2c_get_clientdata(i2c);
 	int i;
 
@@ -481,7 +481,7 @@ static int max8997_restore(struct device *dev)
 
 static int max8997_suspend(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max8997_dev *max8997 = i2c_get_clientdata(i2c);
 
 	if (device_may_wakeup(dev))
@@ -491,7 +491,7 @@ static int max8997_suspend(struct device *dev)
 
 static int max8997_resume(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max8997_dev *max8997 = i2c_get_clientdata(i2c);
 
 	if (device_may_wakeup(dev))
diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index a7afe3b..ab28b29 100644
--- a/drivers/mfd/max8998.c
+++ b/drivers/mfd/max8998.c
@@ -274,7 +274,7 @@ MODULE_DEVICE_TABLE(i2c, max8998_i2c_id);
 
 static int max8998_suspend(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max8998_dev *max8998 = i2c_get_clientdata(i2c);
 
 	if (device_may_wakeup(dev))
@@ -284,7 +284,7 @@ static int max8998_suspend(struct device *dev)
 
 static int max8998_resume(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct max8998_dev *max8998 = i2c_get_clientdata(i2c);
 
 	if (device_may_wakeup(dev))
@@ -344,7 +344,7 @@ static struct max8998_reg_dump max8998_dump[] = {
 /* Save registers before hibernation */
 static int max8998_freeze(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(max8998_dump); i++)
@@ -357,7 +357,7 @@ static int max8998_freeze(struct device *dev)
 /* Restore registers after hibernation */
 static int max8998_restore(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(max8998_dump); i++)
diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index c9802ba..400e1d7 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -536,7 +536,7 @@ static void sec_pmic_shutdown(struct i2c_client *i2c)
 #ifdef CONFIG_PM_SLEEP
 static int sec_pmic_suspend(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct sec_pmic_dev *sec_pmic = i2c_get_clientdata(i2c);
 
 	if (device_may_wakeup(dev))
@@ -557,7 +557,7 @@ static int sec_pmic_suspend(struct device *dev)
 
 static int sec_pmic_resume(struct device *dev)
 {
-	struct i2c_client *i2c = container_of(dev, struct i2c_client, dev);
+	struct i2c_client *i2c = to_i2c_client(dev);
 	struct sec_pmic_dev *sec_pmic = i2c_get_clientdata(i2c);
 
 	if (device_may_wakeup(dev))
-- 
2.5.0
