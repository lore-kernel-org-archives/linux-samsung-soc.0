From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/4] mfd: max77686: Use module_i2c_driver() instead of subsys initcall
Date: Fri, 12 Feb 2016 01:30:17 -0300
Message-ID: <1455251419-8919-3-git-send-email-javier@osg.samsung.com>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The driver's init and exit function don't do anything besides adding and
deleting the I2C driver so the module_i2c_driver() macro could be used.

Currently is not being used because the driver is initialized at subsys
initcall level, claiming that this is done to allow consumers devices to
use the resources provided by this driver. But dependencies should be in
the DT and consumers drivers should not rely in the registration order.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/mfd/max77686.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
index 1f30c97d6d4e..2f563d0f83cc 100644
--- a/drivers/mfd/max77686.c
+++ b/drivers/mfd/max77686.c
@@ -400,18 +400,7 @@ static struct i2c_driver max77686_i2c_driver = {
 	.id_table = max77686_i2c_id,
 };
 
-static int __init max77686_i2c_init(void)
-{
-	return i2c_add_driver(&max77686_i2c_driver);
-}
-/* init early so consumer devices can complete system boot */
-subsys_initcall(max77686_i2c_init);
-
-static void __exit max77686_i2c_exit(void)
-{
-	i2c_del_driver(&max77686_i2c_driver);
-}
-module_exit(max77686_i2c_exit);
+module_i2c_driver(max77686_i2c_driver);
 
 MODULE_DESCRIPTION("MAXIM 77686/802 multi-function core driver");
 MODULE_AUTHOR("Chiwoong Byun <woong.byun@samsung.com>");
-- 
2.5.0
