From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH][resend] ARM: EXYNOS: Remove leftovers of the Samsung
 specific power domain control
Date: Thu, 21 Jun 2012 11:30:20 +0200
Message-ID: <201206211130.20174.b.zolnierkie@samsung.com>
References: <201205230936.46759.b.zolnierkie@samsung.com>
 <038001cd4f43$909269d0$b1b73d70$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:21577 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759153Ab2FUJbJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jun 2012 05:31:09 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M5Y00IWJNRI9W40@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jun 2012 18:31:07 +0900 (KST)
Received: from bzolnier-desktop.localnet ([106.116.147.136])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M5Y00DDWNRT5810@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jun 2012 18:31:07 +0900 (KST)
In-reply-to: <038001cd4f43$909269d0$b1b73d70$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Rob Herring' <rob.herring@calxeda.com>, 'Grant Likely' <grant.likely@secretlab.ca>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org

On Thursday 21 June 2012 02:19:46 Kukjin Kim wrote:
> Bartlomiej Zolnierkiewicz wrote:
> > 
> > From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Subject: [PATCH] ARM: EXYNOS: Remove leftovers of the Samsung specific
> > power domain control
> > 
> > Nowadays we use generic power domain support instead of Samsung
> > specific power domain control driver.
> > 
> > Cc: Thomas Abraham <thomas.abraham@linaro.org>
> > Cc: Rob Herring <rob.herring@calxeda.com>
> > Cc: Grant Likely <grant.likely@secretlab.ca>
> > Cc: Rafael J. Wysocki <rjw@sisk.pl>
> > Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---

[...]

> Looks OK, but you need to re-submit this with right format :(
> 
> Applying: ARM: EXYNOS: Remove leftovers of the Samsung specific power domain
> control
> fatal: patch fragment without header at line 20: @@ -48,7 +48,6 @@

Sorry for this.  Here is a refreshed version against your for-next tree.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung Poland R&D Center


From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Remove leftovers of the Samsung specific power domain control

Nowadays we use generic power domain support instead of Samsung
specific power domain control driver.

Cc: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Rob Herring <rob.herring@calxeda.com>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Rafael J. Wysocki <rjw@sisk.pl>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---

 arch/arm/mach-exynos/mach-nuri.c           |    1 
 arch/arm/mach-exynos/mach-origen.c         |    1 
 arch/arm/mach-exynos/mach-smdkv310.c       |    1 
 arch/arm/mach-exynos/mach-universal_c210.c |    1 
 arch/arm/plat-samsung/Kconfig              |    8 --
 arch/arm/plat-samsung/Makefile             |    4 -
 arch/arm/plat-samsung/include/plat/devs.h  |    1 
 arch/arm/plat-samsung/include/plat/pd.h    |   30 ---------
 arch/arm/plat-samsung/pd.c                 |   95 -----------------------------
 9 files changed, 142 deletions(-)

Index: b/arch/arm/mach-exynos/mach-nuri.c
===================================================================
--- a/arch/arm/mach-exynos/mach-nuri.c	2012-06-21 11:25:00.955011269 +0200
+++ b/arch/arm/mach-exynos/mach-nuri.c	2012-06-21 11:26:06.163010030 +0200
@@ -50,7 +50,6 @@
 #include <plat/gpio-cfg.h>
 #include <plat/iic.h>
 #include <plat/mfc.h>
-#include <plat/pd.h>
 #include <plat/fimc-core.h>
 #include <plat/camport.h>
 #include <plat/mipi_csis.h>
Index: b/arch/arm/mach-exynos/mach-origen.c
===================================================================
--- a/arch/arm/mach-exynos/mach-origen.c	2012-06-21 11:25:00.955011269 +0200
+++ b/arch/arm/mach-exynos/mach-origen.c	2012-06-21 11:26:06.163010030 +0200
@@ -39,7 +39,6 @@
 #include <plat/clock.h>
 #include <plat/gpio-cfg.h>
 #include <plat/backlight.h>
-#include <plat/pd.h>
 #include <plat/fb.h>
 #include <plat/mfc.h>
 
Index: b/arch/arm/mach-exynos/mach-smdkv310.c
===================================================================
--- a/arch/arm/mach-exynos/mach-smdkv310.c	2012-06-21 11:25:00.955011269 +0200
+++ b/arch/arm/mach-exynos/mach-smdkv310.c	2012-06-21 11:26:06.163010030 +0200
@@ -35,7 +35,6 @@
 #include <plat/keypad.h>
 #include <plat/sdhci.h>
 #include <plat/iic.h>
-#include <plat/pd.h>
 #include <plat/gpio-cfg.h>
 #include <plat/backlight.h>
 #include <plat/mfc.h>
Index: b/arch/arm/mach-exynos/mach-universal_c210.c
===================================================================
--- a/arch/arm/mach-exynos/mach-universal_c210.c	2012-06-21 11:25:00.955011269 +0200
+++ b/arch/arm/mach-exynos/mach-universal_c210.c	2012-06-21 11:26:06.163010030 +0200
@@ -39,7 +39,6 @@
 #include <plat/fb.h>
 #include <plat/mfc.h>
 #include <plat/sdhci.h>
-#include <plat/pd.h>
 #include <plat/regs-fb-v4.h>
 #include <plat/fimc-core.h>
 #include <plat/s5p-time.h>
Index: b/arch/arm/plat-samsung/Kconfig
===================================================================
--- a/arch/arm/plat-samsung/Kconfig	2012-06-21 11:25:01.187011265 +0200
+++ b/arch/arm/plat-samsung/Kconfig	2012-06-21 11:26:06.163010030 +0200
@@ -491,14 +491,6 @@ config S5P_SLEEP
 	  Internal config node to apply common S5P sleep management code.
 	  Can be selected by S5P and newer SoCs with similar sleep procedure.
 
-comment "Power Domain"
-
-config SAMSUNG_PD
-	bool "Samsung Power Domain"
-	depends on PM_RUNTIME
-	help
-	  Say Y here if you want to control Power Domain by Runtime PM.
-
 config DEBUG_S3C_UART
 	depends on PLAT_SAMSUNG
 	int
Index: b/arch/arm/plat-samsung/Makefile
===================================================================
--- a/arch/arm/plat-samsung/Makefile	2012-06-14 10:55:33.620775556 +0200
+++ b/arch/arm/plat-samsung/Makefile	2012-06-21 11:26:06.163010030 +0200
@@ -60,10 +60,6 @@ obj-$(CONFIG_SAMSUNG_WAKEMASK)	+= wakeup
 obj-$(CONFIG_S5P_PM)		+= s5p-pm.o s5p-irq-pm.o
 obj-$(CONFIG_S5P_SLEEP)		+= s5p-sleep.o
 
-# PD support
-
-obj-$(CONFIG_SAMSUNG_PD)	+= pd.o
-
 # PWM support
 
 obj-$(CONFIG_HAVE_PWM)		+= pwm.o
Index: b/arch/arm/plat-samsung/include/plat/devs.h
===================================================================
--- a/arch/arm/plat-samsung/include/plat/devs.h	2012-06-14 10:55:33.624775556 +0200
+++ b/arch/arm/plat-samsung/include/plat/devs.h	2012-06-21 11:26:06.163010030 +0200
@@ -131,7 +131,6 @@ extern struct platform_device exynos4_de
 extern struct platform_device exynos4_device_pcm0;
 extern struct platform_device exynos4_device_pcm1;
 extern struct platform_device exynos4_device_pcm2;
-extern struct platform_device exynos4_device_pd[];
 extern struct platform_device exynos4_device_spdif;
 
 extern struct platform_device exynos_device_drm;
Index: b/arch/arm/plat-samsung/include/plat/pd.h
===================================================================
--- a/arch/arm/plat-samsung/include/plat/pd.h	2012-06-08 09:01:31.405681656 +0200
+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
@@ -1,30 +0,0 @@
-/* linux/arch/arm/plat-samsung/include/plat/pd.h
- *
- * Copyright (c) 2010-2011 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#ifndef __ASM_PLAT_SAMSUNG_PD_H
-#define __ASM_PLAT_SAMSUNG_PD_H __FILE__
-
-struct samsung_pd_info {
-	int (*enable)(struct device *dev);
-	int (*disable)(struct device *dev);
-	void __iomem *base;
-};
-
-enum exynos4_pd_block {
-	PD_MFC,
-	PD_G3D,
-	PD_LCD0,
-	PD_LCD1,
-	PD_TV,
-	PD_CAM,
-	PD_GPS
-};
-
-#endif /* __ASM_PLAT_SAMSUNG_PD_H */
Index: b/arch/arm/plat-samsung/pd.c
===================================================================
--- a/arch/arm/plat-samsung/pd.c	2012-06-08 09:01:31.429681656 +0200
+++ /dev/null	1970-01-01 00:00:00.000000000 +0000
@@ -1,95 +0,0 @@
-/* linux/arch/arm/plat-samsung/pd.c
- *
- * Copyright (c) 2010 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com
- *
- * Samsung Power domain support
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
-*/
-
-#include <linux/init.h>
-#include <linux/export.h>
-#include <linux/platform_device.h>
-#include <linux/err.h>
-#include <linux/pm_runtime.h>
-
-#include <plat/pd.h>
-
-static int samsung_pd_probe(struct platform_device *pdev)
-{
-	struct samsung_pd_info *pdata = pdev->dev.platform_data;
-	struct device *dev = &pdev->dev;
-
-	if (!pdata) {
-		dev_err(dev, "no device data specified\n");
-		return -ENOENT;
-	}
-
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-
-	dev_info(dev, "power domain registered\n");
-	return 0;
-}
-
-static int __devexit samsung_pd_remove(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-
-	pm_runtime_disable(dev);
-	return 0;
-}
-
-static int samsung_pd_runtime_suspend(struct device *dev)
-{
-	struct samsung_pd_info *pdata = dev->platform_data;
-	int ret = 0;
-
-	if (pdata->disable)
-		ret = pdata->disable(dev);
-
-	dev_dbg(dev, "suspended\n");
-	return ret;
-}
-
-static int samsung_pd_runtime_resume(struct device *dev)
-{
-	struct samsung_pd_info *pdata = dev->platform_data;
-	int ret = 0;
-
-	if (pdata->enable)
-		ret = pdata->enable(dev);
-
-	dev_dbg(dev, "resumed\n");
-	return ret;
-}
-
-static const struct dev_pm_ops samsung_pd_pm_ops = {
-	.runtime_suspend	= samsung_pd_runtime_suspend,
-	.runtime_resume		= samsung_pd_runtime_resume,
-};
-
-static struct platform_driver samsung_pd_driver = {
-	.driver		= {
-		.name		= "samsung-pd",
-		.owner		= THIS_MODULE,
-		.pm		= &samsung_pd_pm_ops,
-	},
-	.probe		= samsung_pd_probe,
-	.remove		= __devexit_p(samsung_pd_remove),
-};
-
-static int __init samsung_pd_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&samsung_pd_driver);
-	if (ret)
-		printk(KERN_ERR "%s: failed to add PD driver\n", __func__);
-
-	return ret;
-}
-arch_initcall(samsung_pd_init);
