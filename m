From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 3/7] mfd: max77686: Fix possible NULL pointer dereference on
 i2c_new_dummy error
Date: Tue, 11 Feb 2014 11:03:31 +0100
Message-ID: <1392113015-11180-3-git-send-email-k.kozlowski@samsung.com>
References: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <stable-owner@vger.kernel.org>
In-reply-to: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
Sender: stable-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

During probe the driver allocates dummy I2C device for RTC with
i2c_new_dummy() but it does not check the return value of this call.

In case of error (i2c_new_device(): memory allocation failure or I2C
address cannot be used) this function returns NULL which is later used
by i2c_unregister_device().

If i2c_new_dummy() fails for RTC device, fail also the probe for main
MFD driver.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: stable@vger.kernel.org
---
 drivers/mfd/max77686.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
index f53d5823a3f7..e5fce765accb 100644
--- a/drivers/mfd/max77686.c
+++ b/drivers/mfd/max77686.c
@@ -121,6 +121,10 @@ static int max77686_i2c_probe(struct i2c_client *i2c,
 		dev_info(max77686->dev, "device found\n");
 
 	max77686->rtc = i2c_new_dummy(i2c->adapter, I2C_ADDR_RTC);
+	if (!max77686->rtc) {
+		dev_err(max77686->dev, "Failed to allocate I2C device for RTC\n");
+		return -ENODEV;
+	}
 	i2c_set_clientdata(max77686->rtc, max77686);
 
 	max77686_irq_init(max77686);
-- 
1.7.9.5
