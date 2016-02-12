From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 4/4] mfd: max77686: Export OF module alias information
Date: Fri, 12 Feb 2016 01:30:19 -0300
Message-ID: <1455251419-8919-5-git-send-email-javier@osg.samsung.com>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

When the device is registered via OF, the OF table is used to match the
driver instead of the I2C device ID table but the entries in the latter
are used as aliasses to load the module if the driver was not built-in.

This is because the I2C core always reports an I2C module alias instead
of an OF one but that could change so it is better to always export it.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 drivers/mfd/max77686.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
index 2f563d0f83cc..b1ed9ed0828c 100644
--- a/drivers/mfd/max77686.c
+++ b/drivers/mfd/max77686.c
@@ -204,6 +204,7 @@ static const struct of_device_id max77686_pmic_dt_match[] = {
 	},
 	{ },
 };
+MODULE_DEVICE_TABLE(of, max77686_pmic_dt_match);
 
 static int max77686_i2c_probe(struct i2c_client *i2c,
 			      const struct i2c_device_id *id)
-- 
2.5.0
