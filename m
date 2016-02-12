From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/4] mfd: max77686: Add max77802 to I2C device ID table
Date: Fri, 12 Feb 2016 01:30:16 -0300
Message-ID: <1455251419-8919-2-git-send-email-javier@osg.samsung.com>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The max77686 MFD driver supports both the Maxim 77686 and Maxim 77802
PMICs but only the OF device table contains entries for both devices.

The max77802 entry is missing in the I2C device ID table which isn't
a problem currently since the driver only supports DT but it will be
needed if the driver is changed to be built as a module since the I2C
core always reports a I2C modalias uevent so auto-load will not work.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/mfd/max77686.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
index d959ebbb2194..1f30c97d6d4e 100644
--- a/drivers/mfd/max77686.c
+++ b/drivers/mfd/max77686.c
@@ -345,6 +345,7 @@ static int max77686_i2c_remove(struct i2c_client *i2c)
 
 static const struct i2c_device_id max77686_i2c_id[] = {
 	{ "max77686", TYPE_MAX77686 },
+	{ "max77802", TYPE_MAX77802 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max77686_i2c_id);
-- 
2.5.0
