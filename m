From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/2] regulator: s2mps11: Use module_platform_driver() instead subsys initcall
Date: Wed,  6 Apr 2016 09:49:46 -0400
Message-ID: <1459950587-8807-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:34126 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751897AbcDFNuS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Apr 2016 09:50:18 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>

The driver's init and exit function don't do anything besides registering
and unregistering the platform driver, so the module_platform_driver()
macro could just be used instead of having separate functions.

Currently the macro is not being used because the driver is initialized at
subsys init call level but this isn't necessary since consumer devices are
defined in the DT as dependencies so there's no need for init calls order.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---
This patch was tested on an Exynos5422 Odroid XU4 board.

 drivers/regulator/s2mps11.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 6dfa3502e1f1..64a262f10845 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -1237,17 +1237,7 @@ static struct platform_driver s2mps11_pmic_driver = {
 	.id_table = s2mps11_pmic_id,
 };
 
-static int __init s2mps11_pmic_init(void)
-{
-	return platform_driver_register(&s2mps11_pmic_driver);
-}
-subsys_initcall(s2mps11_pmic_init);
-
-static void __exit s2mps11_pmic_exit(void)
-{
-	platform_driver_unregister(&s2mps11_pmic_driver);
-}
-module_exit(s2mps11_pmic_exit);
+module_platform_driver(s2mps11_pmic_driver);
 
 /* Module information */
 MODULE_AUTHOR("Sangbeom Kim <sbkim73@samsung.com>");
-- 
2.5.0
