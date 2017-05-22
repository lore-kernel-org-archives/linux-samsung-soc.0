From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 1/3] pinctrl: samsung: clean up modular vs. non-modular distinctions
Date: Mon, 22 May 2017 16:56:46 -0400
Message-ID: <20170522205648.23545-2-paul.gortmaker@windriver.com>
References: <20170522205648.23545-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170522205648.23545-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Tomasz Figa <tomasz.figa@gmail.com>, Thomas Abraham <thomas.ab@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fixups here tend to be more all over the map vs. some of the other
repeated/systematic ones we've seen elsewhere.

We remove module.h from code that isn't doing anything modular at
all;  if they have __init sections, then replace it with init.h

A couple drivers have module_exit() code that is essentially orphaned,
and so we remove that.

There are no module_init replacements, so we have no concerns wrt.
initcall ordering changes as per some of the other cleanups.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
was (or is now) contained at the top of the file in the comments.

Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c     |  1 -
 drivers/pinctrl/samsung/pinctrl-exynos5440.c | 15 +++------------
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c    |  2 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c    |  2 +-
 drivers/pinctrl/samsung/pinctrl-samsung.c    | 13 +------------
 5 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 7b0e6cc35e04..70345462c7be 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -18,7 +18,6 @@
  * external gpio and wakeup interrupt support.
  */
 
-#include <linux/module.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/irqdomain.h>
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos5440.c b/drivers/pinctrl/samsung/pinctrl-exynos5440.c
index 3000df80709f..32a3a9fd65c4 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos5440.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos5440.c
@@ -1,6 +1,8 @@
 /*
  * pin-controller/pin-mux/pin-config/gpio-driver for Samsung's EXYNOS5440 SoC.
  *
+ * Author: Thomas Abraham <thomas.ab@samsung.com>
+ *
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
  *		http://www.samsung.com
  *
@@ -10,7 +12,7 @@
  * (at your option) any later version.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/slab.h>
@@ -991,7 +993,6 @@ static const struct of_device_id exynos5440_pinctrl_dt_match[] = {
 	{ .compatible = "samsung,exynos5440-pinctrl" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, exynos5440_pinctrl_dt_match);
 
 static struct platform_driver exynos5440_pinctrl_driver = {
 	.probe		= exynos5440_pinctrl_probe,
@@ -1007,13 +1008,3 @@ static int __init exynos5440_pinctrl_drv_register(void)
 	return platform_driver_register(&exynos5440_pinctrl_driver);
 }
 postcore_initcall(exynos5440_pinctrl_drv_register);
-
-static void __exit exynos5440_pinctrl_drv_unregister(void)
-{
-	platform_driver_unregister(&exynos5440_pinctrl_driver);
-}
-module_exit(exynos5440_pinctrl_drv_unregister);
-
-MODULE_AUTHOR("Thomas Abraham <thomas.ab@samsung.com>");
-MODULE_DESCRIPTION("Samsung EXYNOS5440 SoC pinctrl driver");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
index b82a003546ae..49774851e84a 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
@@ -13,7 +13,7 @@
  * external gpio and wakeup interrupt support.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/irqdomain.h>
diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
index f17890aa6e25..4a88d7446e87 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
@@ -15,7 +15,7 @@
  * external gpio and wakeup interrupt support.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/irqdomain.h>
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 96279905fcc9..51c46222f2d9 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -20,7 +20,7 @@
  * and wakeup interrupts can be hooked to.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/slab.h>
@@ -1221,7 +1221,6 @@ static const struct of_device_id samsung_pinctrl_dt_match[] = {
 #endif
 	{},
 };
-MODULE_DEVICE_TABLE(of, samsung_pinctrl_dt_match);
 
 static const struct dev_pm_ops samsung_pinctrl_pm_ops = {
 	SET_LATE_SYSTEM_SLEEP_PM_OPS(samsung_pinctrl_suspend,
@@ -1243,13 +1242,3 @@ static int __init samsung_pinctrl_drv_register(void)
 	return platform_driver_register(&samsung_pinctrl_driver);
 }
 postcore_initcall(samsung_pinctrl_drv_register);
-
-static void __exit samsung_pinctrl_drv_unregister(void)
-{
-	platform_driver_unregister(&samsung_pinctrl_driver);
-}
-module_exit(samsung_pinctrl_drv_unregister);
-
-MODULE_AUTHOR("Thomas Abraham <thomas.ab@samsung.com>");
-MODULE_DESCRIPTION("Samsung pinctrl driver");
-MODULE_LICENSE("GPL v2");
-- 
2.11.0

