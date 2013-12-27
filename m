From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 3/3] ARM: SAMSUNG: Remove Exynos specific code from pm-gpio.c
Date: Fri, 27 Dec 2013 11:59:55 +0530
Message-ID: <1388125795-30418-4-git-send-email-tushar.behera@linaro.org>
References: <1388125795-30418-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:59512 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752662Ab3L0Gdd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Dec 2013 01:33:33 -0500
Received: by mail-pa0-f43.google.com with SMTP id bj1so9004898pad.30
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Dec 2013 22:33:32 -0800 (PST)
In-Reply-To: <1388125795-30418-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

This file is only compiled when SAMSUNG_ATAGS is enabled, hence not
for Exynos platform.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/plat-samsung/pm-gpio.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/plat-samsung/pm-gpio.c b/arch/arm/plat-samsung/pm-gpio.c
index c4efa1c..81b0a20 100644
--- a/arch/arm/plat-samsung/pm-gpio.c
+++ b/arch/arm/plat-samsung/pm-gpio.c
@@ -198,8 +198,7 @@ struct samsung_gpio_pm samsung_gpio_pm_2bit = {
 	.resume = samsung_gpio_pm_2bit_resume,
 };
 
-#if defined(CONFIG_ARCH_S3C64XX) || defined(CONFIG_PLAT_S5P) \
-	|| defined(CONFIG_ARCH_EXYNOS)
+#if defined(CONFIG_ARCH_S3C64XX) || defined(CONFIG_PLAT_S5P)
 static void samsung_gpio_pm_4bit_save(struct samsung_gpio_chip *chip)
 {
 	chip->pm_save[1] = __raw_readl(chip->base + OFFS_CON);
@@ -309,7 +308,7 @@ struct samsung_gpio_pm samsung_gpio_pm_4bit = {
 	.save	= samsung_gpio_pm_4bit_save,
 	.resume = samsung_gpio_pm_4bit_resume,
 };
-#endif /* CONFIG_ARCH_S3C64XX || CONFIG_PLAT_S5P || CONFIG_ARCH_EXYNOS */
+#endif /* CONFIG_ARCH_S3C64XX || CONFIG_PLAT_S5P */
 
 /**
  * samsung_pm_save_gpio() - save gpio chip data for suspend
-- 
1.7.9.5
