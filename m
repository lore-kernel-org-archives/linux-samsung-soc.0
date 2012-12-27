From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] gpio: samsung: silent build warning for EXYNOS5 SoCs
Date: Thu, 27 Dec 2012 10:12:30 -0800
Message-ID: <1356631950-1556-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36641 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751204Ab2L0SMp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Dec 2012 13:12:45 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFP002QDBX8SEL0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Dec 2012 03:12:44 +0900 (KST)
Received: from localhost.localdomain ([105.128.18.183])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFP00H6TBX45S70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Dec 2012 03:12:44 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

This patch fixes following warning:

drivers/gpio/gpio-samsung.c:450:32: warning: 'exynos_gpio_cfg' defined but not used [-Wunused-variable]
drivers/gpio/gpio-samsung.c:2450:33: warning: 'exynos5_gpios_1' defined but not used [-Wunused-variable]
drivers/gpio/gpio-samsung.c:2618:33: warning: 'exynos5_gpios_2' defined but not used [-Wunused-variable]
drivers/gpio/gpio-samsung.c:2679:33: warning: 'exynos5_gpios_3' defined but not used [-Wunused-variable]
drivers/gpio/gpio-samsung.c:2715:33: warning: 'exynos5_gpios_4' defined but not used [-Wunused-variable]

Because current gpio-samsung is valid only on EXYNOS5250.

Cc: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/gpio/gpio-samsung.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
index f890ea5..cce8edc 100644
--- a/drivers/gpio/gpio-samsung.c
+++ b/drivers/gpio/gpio-samsung.c
@@ -446,7 +446,7 @@ static struct samsung_gpio_cfg s3c24xx_gpiocfg_banka = {
 };
 #endif
 
-#if defined(CONFIG_ARCH_EXYNOS4) || defined(CONFIG_ARCH_EXYNOS5)
+#if defined(CONFIG_ARCH_EXYNOS4) || defined(CONFIG_SOC_EXYNOS5250)
 static struct samsung_gpio_cfg exynos_gpio_cfg = {
 	.set_pull	= exynos_gpio_setpull,
 	.get_pull	= exynos_gpio_getpull,
@@ -2446,7 +2446,7 @@ static struct samsung_gpio_chip exynos4_gpios_3[] = {
 };
 #endif
 
-#ifdef CONFIG_ARCH_EXYNOS5
+#ifdef CONFIG_SOC_EXYNOS5250
 static struct samsung_gpio_chip exynos5_gpios_1[] = {
 	{
 		.chip	= {
@@ -2614,7 +2614,7 @@ static struct samsung_gpio_chip exynos5_gpios_1[] = {
 };
 #endif
 
-#ifdef CONFIG_ARCH_EXYNOS5
+#ifdef CONFIG_SOC_EXYNOS5250
 static struct samsung_gpio_chip exynos5_gpios_2[] = {
 	{
 		.chip	= {
@@ -2675,7 +2675,7 @@ static struct samsung_gpio_chip exynos5_gpios_2[] = {
 };
 #endif
 
-#ifdef CONFIG_ARCH_EXYNOS5
+#ifdef CONFIG_SOC_EXYNOS5250
 static struct samsung_gpio_chip exynos5_gpios_3[] = {
 	{
 		.chip	= {
@@ -2711,7 +2711,7 @@ static struct samsung_gpio_chip exynos5_gpios_3[] = {
 };
 #endif
 
-#ifdef CONFIG_ARCH_EXYNOS5
+#ifdef CONFIG_SOC_EXYNOS5250
 static struct samsung_gpio_chip exynos5_gpios_4[] = {
 	{
 		.chip	= {
-- 
1.7.10.4
