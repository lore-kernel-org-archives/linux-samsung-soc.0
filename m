From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] mfd: max8997: Enale irq-wakeup unconditionally
Date: Wed, 05 Sep 2018 13:54:07 +0200
Message-ID: <20180905115407.10595-1-m.szyprowski@samsung.com>
References: <CGME20180905115422eucas1p2150fd04724ec667bd8798023a73f1127@eucas1p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

IRQ wake up support for MAX8997 driver was initially configured by
respective property in pdata. However, after the driver conversion to
device-tree, setting it was left as 'todo'. Nowadays most of other PMIC MFD
drivers initialized from device-tree assume that they can be an irq wakeup
source, so enable it also for MAX8997. This fixes support for wakeup from
MAX8997 RTC alarm.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
changelog:
v2:
- removed pdata->wakeup entry as suggested by Krzysztof Kozlowski
---
 drivers/mfd/max8997.c       | 8 +-------
 include/linux/mfd/max8997.h | 1 -
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 3f554c447521..d1495d76bf2c 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -153,12 +153,6 @@ static struct max8997_platform_data *max8997_i2c_parse_dt_pdata(
 
 	pd->ono = irq_of_parse_and_map(dev->of_node, 1);
 
-	/*
-	 * ToDo: the 'wakeup' member in the platform data is more of a linux
-	 * specfic information. Hence, there is no binding for that yet and
-	 * not parsed here.
-	 */
-
 	return pd;
 }
 
@@ -246,7 +240,7 @@ static int max8997_i2c_probe(struct i2c_client *i2c,
 	 */
 
 	/* MAX8997 has a power button input. */
-	device_init_wakeup(max8997->dev, pdata->wakeup);
+	device_init_wakeup(max8997->dev, true);
 
 	return ret;
 
diff --git a/include/linux/mfd/max8997.h b/include/linux/mfd/max8997.h
index cf815577bd68..3ae1fe743bc3 100644
--- a/include/linux/mfd/max8997.h
+++ b/include/linux/mfd/max8997.h
@@ -178,7 +178,6 @@ struct max8997_led_platform_data {
 struct max8997_platform_data {
 	/* IRQ */
 	int ono;
-	int wakeup;
 
 	/* ---- PMIC ---- */
 	struct max8997_regulator_data *regulators;
-- 
2.17.1
