From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: SAMSUNG: Remove unused s5p_device_ehci
Date: Thu, 10 Oct 2013 11:02:03 +0900
Message-ID: <000001cec55c$b70f0100$252d0300$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49514 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751318Ab3JJCC3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Oct 2013 22:02:29 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MUF00C54KAQAG00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 Oct 2013 11:02:04 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>

Since commit ca91435 "ARM: EXYNOS: Remove unused board files",
s5p_device_ehci is not used anymore. Thus, s5p_device_ehci can
be removed. Also, unnecessary S5P_DEV_USB_EHCI option is removed.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/plat-samsung/Kconfig             |    5 -----
 arch/arm/plat-samsung/devs.c              |   34 -----------------------------
 arch/arm/plat-samsung/include/plat/devs.h |    1 -
 3 files changed, 40 deletions(-)

diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
index 7dfba93..99bfbb3 100644
--- a/arch/arm/plat-samsung/Kconfig
+++ b/arch/arm/plat-samsung/Kconfig
@@ -382,11 +382,6 @@ config S5P_DEV_TV
 	help
 	  Compile in platform device definition for TV interface
 
-config S5P_DEV_USB_EHCI
-	bool
-	help
-	  Compile in platform device definition for USB EHCI
-
 config S3C24XX_PWM
 	bool "PWM device support"
 	select PWM
diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 8ce0ac0..25f40c9 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -49,7 +49,6 @@
 #include <plat/devs.h>
 #include <plat/adc.h>
 #include <linux/platform_data/ata-samsung_cf.h>
-#include <linux/platform_data/usb-ehci-s5p.h>
 #include <plat/fb.h>
 #include <plat/fb-s3c2410.h>
 #include <plat/hdmi.h>
@@ -1359,39 +1358,6 @@ void __init s3c24xx_udc_set_platdata(struct s3c2410_udc_mach_info *pd)
 }
 #endif /* CONFIG_PLAT_S3C24XX */
 
-/* USB EHCI Host Controller */
-
-#ifdef CONFIG_S5P_DEV_USB_EHCI
-static struct resource s5p_ehci_resource[] = {
-	[0] = DEFINE_RES_MEM(S5P_PA_EHCI, SZ_256),
-	[1] = DEFINE_RES_IRQ(IRQ_USB_HOST),
-};
-
-struct platform_device s5p_device_ehci = {
-	.name		= "s5p-ehci",
-	.id		= -1,
-	.num_resources	= ARRAY_SIZE(s5p_ehci_resource),
-	.resource	= s5p_ehci_resource,
-	.dev		= {
-		.dma_mask		= &samsung_device_dma_mask,
-		.coherent_dma_mask	= DMA_BIT_MASK(32),
-	}
-};
-
-void __init s5p_ehci_set_platdata(struct s5p_ehci_platdata *pd)
-{
-	struct s5p_ehci_platdata *npd;
-
-	npd = s3c_set_platdata(pd, sizeof(struct s5p_ehci_platdata),
-			&s5p_device_ehci);
-
-	if (!npd->phy_init)
-		npd->phy_init = s5p_usb_phy_init;
-	if (!npd->phy_exit)
-		npd->phy_exit = s5p_usb_phy_exit;
-}
-#endif /* CONFIG_S5P_DEV_USB_EHCI */
-
 /* USB HSOTG */
 
 #ifdef CONFIG_S3C_DEV_USB_HSOTG
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 0dc4ac4..eece188 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -75,7 +75,6 @@ extern struct platform_device s3c_device_usb_hsotg;
 extern struct platform_device s3c_device_usb_hsudc;
 extern struct platform_device s3c_device_wdt;
 
-extern struct platform_device s5p_device_ehci;
 extern struct platform_device s5p_device_fimc0;
 extern struct platform_device s5p_device_fimc1;
 extern struct platform_device s5p_device_fimc2;
-- 
1.7.10.4
