From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH][resend] ARM: EXYNOS: Remove leftovers of the Samsung specific
 power domain control
Date: Wed, 23 May 2012 09:36:46 +0200
Message-ID: <201205230936.46759.b.zolnierkie@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:17366 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755014Ab2EWHhh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 May 2012 03:37:37 -0400
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M4G0003NT6D2S@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 May 2012 08:37:25 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M4G00K0FT6LMD@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 23 May 2012 08:37:35 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org

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

Index: linux-sprc/arch/arm/mach-exynos/mach-nuri.c
===================================================================
--- linux-sprc.orig/arch/arm/mach-exynos/mach-nuri.c	2012-03-06 15:59:13.432481942 +0100
+++ linux-sprc/arch/arm/mach-exynos/mach-nuri.c	2012-03-06 15:59:22.528481940 +0100
@@ -48,7 +48,6 @@
 #include <plat/gpio-cfg.h>
 #include <plat/iic.h>
 #include <plat/mfc.h>
-#include <plat/pd.h>
 #include <plat/fimc-core.h>
 #include <plat/camport.h>
 #include <plat/mipi_csis.h>
Index: linux-sprc/arch/arm/mach-exynos/mach-origen.c
===================================================================
--- linux-sprc.orig/arch/arm/mach-exynos/mach-origen.c	2012-03-06 15:59:13.432481942 +0100
+++ linux-sprc/arch/arm/mach-exynos/mach-origen.c	2012-03-06 15:59:22.528481940 +0100
@@ -38,7 +38,6 @@
 #include <plat/clock.h>
 #include <plat/gpio-cfg.h>
 #include <plat/backlight.h>
-#include <plat/pd.h>
 #include <plat/fb.h>
 #include <plat/mfc.h>
 
Index: linux-sprc/arch/arm/mach-exynos/mach-smdkv310.c
===================================================================
--- linux-sprc.orig/arch/arm/mach-exynos/mach-smdkv310.c	2012-03-06 15:59:13.432481942 +0100
+++ linux-sprc/arch/arm/mach-exynos/mach-smdkv310.c	2012-03-06 15:59:22.532481931 +0100
@@ -34,7 +34,6 @@
 #include <plat/keypad.h>
 #include <plat/sdhci.h>
 #include <plat/iic.h>
-#include <plat/pd.h>
 #include <plat/gpio-cfg.h>
 #include <plat/backlight.h>
 #include <plat/mfc.h>
Index: linux-sprc/arch/arm/mach-exynos/mach-universal_c210.c
===================================================================
--- linux-sprc.orig/arch/arm/mach-exynos/mach-universal_c210.c	2012-03-06 15:59:13.432481942 +0100
+++ linux-sprc/arch/arm/mach-exynos/mach-universal_c210.c	2012-03-06 15:59:22.532481931 +0100
@@ -35,7 +35,6 @@
 #include <plat/fb.h>
 #include <plat/mfc.h>
 #include <plat/sdhci.h>
-#include <plat/pd.h>
 #include <plat/regs-fb-v4.h>
 #include <plat/fimc-core.h>
 #include <plat/camport.h>
Index: linux-sprc/arch/arm/plat-samsung/Kconfig
===================================================================
--- linux-sprc.orig/arch/arm/plat-samsung/Kconfig	2012-03-06 15:57:57.092481952 +0100
+++ linux-sprc/arch/arm/plat-samsung/Kconfig	2012-03-06 15:59:22.532481931 +0100
@@ -350,14 +350,6 @@
 	  and above. This code allows a set of interrupt to wakeup-mask
 	  mappings. See <plat/wakeup-mask.h>
 
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
Index: linux-sprc/arch/arm/plat-samsung/Makefile
===================================================================
--- linux-sprc.orig/arch/arm/plat-samsung/Makefile	2012-03-06 15:57:57.092481952 +0100
+++ linux-sprc/arch/arm/plat-samsung/Makefile	2012-03-06 15:59:22.532481931 +0100
@@ -47,10 +47,6 @@
 
 obj-$(CONFIG_SAMSUNG_WAKEMASK)	+= wakeup-mask.o
 
-# PD support
-
-obj-$(CONFIG_SAMSUNG_PD)	+= pd.o
-
 # PWM support
 
 obj-$(CONFIG_HAVE_PWM)		+= pwm.o
Index: linux-sprc/arch/arm/plat-samsung/include/plat/devs.h
===================================================================
--- linux-sprc.orig/arch/arm/plat-samsung/include/plat/devs.h	2012-03-06 15:59:13.444481941 +0100
+++ linux-sprc/arch/arm/plat-samsung/include/plat/devs.h	2012-03-06 15:59:22.532481931 +0100
@@ -128,7 +128,6 @@
 extern struct platform_device exynos4_device_pcm0;
 extern struct platform_device exynos4_device_pcm1;
 extern struct platform_device exynos4_device_pcm2;
-extern struct platform_device exynos4_device_pd[];
 extern struct platform_device exynos4_device_spdif;
 extern struct platform_device exynos4_device_sysmmu;
 
Index: linux-sprc/arch/arm/plat-samsung/include/plat/pd.h
===================================================================
--- linux-sprc.orig/arch/arm/plat-samsung/include/plat/pd.h	2012-03-06 15:59:13.444481941 +0100
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
Index: linux-sprc/arch/arm/plat-samsung/pd.c
===================================================================
--- linux-sprc.orig/arch/arm/plat-samsung/pd.c	2012-03-06 15:57:57.000000000 +0100
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
