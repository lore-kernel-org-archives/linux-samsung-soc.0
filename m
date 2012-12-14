From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH] gpio: samsung: remove exynos_gpio_cfg
Date: Fri, 14 Dec 2012 19:44:01 +0900
Message-ID: <1355481842-17952-1-git-send-email-jy0922.shim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:9217 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751439Ab2LNKpI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Dec 2012 05:45:08 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: grant.likely@secretlab.ca, linus.walleij@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com

The exynos_gpio_cfg can be substituted to samsung_gpio_cfgs[8].

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 drivers/gpio/gpio-samsung.c |   25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index 6f93d36..a462f2c 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -452,15 +452,6 @@ static struct samsung_gpio_cfg s3c24xx_gpiocfg_banka = {
 };
 #endif
 
-#if defined(CONFIG_ARCH_EXYNOS4) || defined(CONFIG_ARCH_EXYNOS5)
-static struct samsung_gpio_cfg exynos_gpio_cfg = {
-	.set_pull	= exynos_gpio_setpull,
-	.get_pull	= exynos_gpio_getpull,
-	.set_config	= samsung_gpio_setcfg_4bit,
-	.get_config	= samsung_gpio_getcfg_4bit,
-};
-#endif
-
 #if defined(CONFIG_CPU_S5P6440) || defined(CONFIG_CPU_S5P6450)
 static struct samsung_gpio_cfg s5p64x0_gpio_cfg_rbank = {
 	.cfg_eint	= 0x3,
@@ -2181,7 +2172,7 @@ static struct samsung_gpio_chip s5pv210_gpios_4bit[] = {
  * Followings are the gpio banks in EXYNOS SoCs
  *
  * The 'config' member when left to NULL, is initialized to the default
- * structure exynos_gpio_cfg in the init function below.
+ * structure samsung_gpio_cfgs[8] in the init function below.
  *
  * The 'base' member is also initialized in the init function below.
  * Note: The initialization of 'base' member of samsung_gpio_chip structure
@@ -2837,7 +2828,7 @@ static __init void exynos4_gpiolib_init(void)
 
 	for (i = 0; i < nr_chips; i++, chip++) {
 		if (!chip->config) {
-			chip->config = &exynos_gpio_cfg;
+			chip->config = &samsung_gpio_cfgs[8];
 			chip->group = group++;
 		}
 		exynos_gpiolib_attach_ofnode(chip,
@@ -2864,7 +2855,7 @@ static __init void exynos4_gpiolib_init(void)
 
 	for (i = 0; i < nr_chips; i++, chip++) {
 		if (!chip->config) {
-			chip->config = &exynos_gpio_cfg;
+			chip->config = &samsung_gpio_cfgs[8];
 			chip->group = group++;
 		}
 		exynos_gpiolib_attach_ofnode(chip,
@@ -2885,7 +2876,7 @@ static __init void exynos4_gpiolib_init(void)
 
 	for (i = 0; i < nr_chips; i++, chip++) {
 		if (!chip->config) {
-			chip->config = &exynos_gpio_cfg;
+			chip->config = &samsung_gpio_cfgs[8];
 			chip->group = group++;
 		}
 		exynos_gpiolib_attach_ofnode(chip,
@@ -2940,7 +2931,7 @@ static __init void exynos5_gpiolib_init(void)
 
 	for (i = 0; i < nr_chips; i++, chip++) {
 		if (!chip->config) {
-			chip->config = &exynos_gpio_cfg;
+			chip->config = &samsung_gpio_cfgs[8];
 			chip->group = group++;
 		}
 		exynos_gpiolib_attach_ofnode(chip,
@@ -2961,7 +2952,7 @@ static __init void exynos5_gpiolib_init(void)
 
 	for (i = 0; i < nr_chips; i++, chip++) {
 		if (!chip->config) {
-			chip->config = &exynos_gpio_cfg;
+			chip->config = &samsung_gpio_cfgs[8];
 			chip->group = group++;
 		}
 		exynos_gpiolib_attach_ofnode(chip,
@@ -2989,7 +2980,7 @@ static __init void exynos5_gpiolib_init(void)
 
 	for (i = 0; i < nr_chips; i++, chip++) {
 		if (!chip->config) {
-			chip->config = &exynos_gpio_cfg;
+			chip->config = &samsung_gpio_cfgs[8];
 			chip->group = group++;
 		}
 		exynos_gpiolib_attach_ofnode(chip,
@@ -3010,7 +3001,7 @@ static __init void exynos5_gpiolib_init(void)
 
 	for (i = 0; i < nr_chips; i++, chip++) {
 		if (!chip->config) {
-			chip->config = &exynos_gpio_cfg;
+			chip->config = &samsung_gpio_cfgs[8];
 			chip->group = group++;
 		}
 		exynos_gpiolib_attach_ofnode(chip,
-- 
1.7.9.5
