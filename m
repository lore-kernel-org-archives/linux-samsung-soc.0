From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [RESEND PATCH] mfd: max77686: Use module_i2c_driver() instead of subsys initcall
Date: Mon,  4 Apr 2016 18:46:02 -0400
Message-ID: <1459809962-8883-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:33273 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751827AbcDDWqQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2016 18:46:16 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Andi Shyti <andi.shyti@samsung.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Lee Jones <lee.jones@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, Javier Martinez Canillas <javier@osg.samsung.com>

The driver's init and exit function don't do anything besides adding and
deleting the I2C driver so the module_i2c_driver() macro could be used.

Currently is not being used because the driver is initialized at subsys
initcall level, claiming that this is done to allow consumers devices to
use the resources provided by this driver. But dependencies are in DT so
manual ordering of init calls is not necessary any more.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes in the resend:
- Change commit message to make clear that dependencies are in DT instead
  giving the impression that it was wishful thinking (Krzysztof Kozlowski).

Hello,

This patch was first sent as a part of a bigger series to allow the
max77686 MFD driver to be built as a module [0]. The other patches
were already picked but $SUBJECT wasn't, probably because there was
a dependency with a patch on the exynos thermal driver [1].

But the exynos thermal patches also landed in mainline so I think it
should be safe to merged $SUBJECT now.

[0]: https://lkml.org/lkml/2016/2/11/857
[1]: https://lkml.org/lkml/2016/2/18/592

Best regards,
Javier

 drivers/mfd/max77686.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
index c1aff46e89d9..66cc9bebb7ba 100644
--- a/drivers/mfd/max77686.c
+++ b/drivers/mfd/max77686.c
@@ -321,18 +321,7 @@ static struct i2c_driver max77686_i2c_driver = {
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
