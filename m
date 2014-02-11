From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/7] mfd: 88pm860x: Fix I2C device resource leak on regmap init
 fail
Date: Tue, 11 Feb 2014 11:03:30 +0100
Message-ID: <1392113015-11180-2-git-send-email-k.kozlowski@samsung.com>
References: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1392113015-11180-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, stable@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

During probe the driver allocates dummy I2C device for companion chip
and then allocates a regmap for it. If regmap_init_i2c() fails then the
I2C driver (allocated with i2c_new_dummy()) is not freed and this
resource leaks.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: stable@vger.kernel.org
---
 drivers/mfd/88pm860x-core.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/88pm860x-core.c b/drivers/mfd/88pm860x-core.c
index e456be9a7c67..bcfc9e85b4a0 100644
--- a/drivers/mfd/88pm860x-core.c
+++ b/drivers/mfd/88pm860x-core.c
@@ -1190,6 +1190,7 @@ static int pm860x_probe(struct i2c_client *client,
 			ret = PTR_ERR(chip->regmap_companion);
 			dev_err(&chip->companion->dev,
 				"Failed to allocate register map: %d\n", ret);
+			i2c_unregister_device(chip->companion);
 			return ret;
 		}
 		i2c_set_clientdata(chip->companion, chip);
-- 
1.7.9.5
