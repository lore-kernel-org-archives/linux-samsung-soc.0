From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/7] mfd: 88pm860x: Fix possible NULL pointer dereference on
 i2c_new_dummy error
Date: Tue, 11 Feb 2014 11:03:29 +0100
Message-ID: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

During probe the driver allocates dummy I2C device for companion chip
with i2c_new_dummy() but it does not check the return value of this call.

In case of error (i2c_new_device(): memory allocation failure or I2C
address cannot be used) this function returns NULL which is later used
by regmap_init_i2c().

If i2c_new_dummy() fails for companion device, fail also the probe for
main MFD driver.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: stable@vger.kernel.org
---
 drivers/mfd/88pm860x-core.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index c9b1f6422941..e456be9a7c67 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -1179,6 +1179,11 @@ static int pm860x_probe(struct i2c_client *client,
 		chip->companion_addr = pdata->companion_addr;
 		chip->companion = i2c_new_dummy(chip->client->adapter,
 						chip->companion_addr);
+		if (!chip->companion) {
+			dev_err(&client->dev,
+				"Failed to allocate I2C companion device\n");
+			return -ENODEV;
+		}
 		chip->regmap_companion = regmap_init_i2c(chip->companion,
 							&pm860x_regmap_config);
 		if (IS_ERR(chip->regmap_companion)) {
-- 
1.7.9.5
