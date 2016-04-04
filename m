From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/2] mfd: max77693: Allow building as a module
Date: Mon, 04 Apr 2016 16:54:18 +0900
Message-ID: <1459756459-22061-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:32295 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932065AbcDDHys (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Apr 2016 03:54:48 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>

The consumer of max77693 regulators on Trats2 board (samsung-usb2-phy
driver) supports deferred probing so the max77693 main MFD driver can be
built now as a module. This gives more flexibility and removes manual
ordering of init calls.

Suggested-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/mfd/Kconfig    |  4 ++--
 drivers/mfd/max77693.c | 14 ++------------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index eea61e349e26..aa1e7c3f82ee 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -543,8 +543,8 @@ config MFD_MAX77686
 	  of the device.
 
 config MFD_MAX77693
-	bool "Maxim Semiconductor MAX77693 PMIC Support"
-	depends on I2C=y
+	tristate "Maxim Semiconductor MAX77693 PMIC Support"
+	depends on I2C
 	select MFD_CORE
 	select REGMAP_I2C
 	select REGMAP_IRQ
diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index b83b7a7da1ae..78e501feb96c 100644
--- a/drivers/mfd/max77693.c
+++ b/drivers/mfd/max77693.c
@@ -368,6 +368,7 @@ static const struct of_device_id max77693_dt_match[] = {
 	{ .compatible = "maxim,max77693" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, max77693_dt_match);
 #endif
 
 static struct i2c_driver max77693_i2c_driver = {
@@ -381,18 +382,7 @@ static struct i2c_driver max77693_i2c_driver = {
 	.id_table = max77693_i2c_id,
 };
 
-static int __init max77693_i2c_init(void)
-{
-	return i2c_add_driver(&max77693_i2c_driver);
-}
-/* init early so consumer devices can complete system boot */
-subsys_initcall(max77693_i2c_init);
-
-static void __exit max77693_i2c_exit(void)
-{
-	i2c_del_driver(&max77693_i2c_driver);
-}
-module_exit(max77693_i2c_exit);
+module_i2c_driver(max77693_i2c_driver);
 
 MODULE_DESCRIPTION("MAXIM 77693 multi-function core driver");
 MODULE_AUTHOR("SangYoung, Son <hello.son@samsung.com>");
-- 
2.5.0
