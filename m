From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 6/6] arm: exynos: removing exynos-drm device registration
 from non-dt platforms
Date: Mon, 22 Oct 2012 17:01:07 +0530
Message-ID: <1350905467-23832-7-git-send-email-rahul.sharma@samsung.com>
References: <1350905467-23832-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:45059 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751091Ab2JVLYH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Oct 2012 07:24:07 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MCA0058ML05B8S0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Oct 2012 20:24:06 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MCA00260KJ6TJ50@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Oct 2012 20:24:06 +0900 (KST)
In-reply-to: <1350905467-23832-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: tomasz.figa@gmail.com, kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, thomas.ab@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

As exynos-drm is a software device, its registration is moved to the
exynos drm driver. This will provide generic solution for device registration
for dt and non-dt platforms. Corresponding patches are posted to dri-devel
list.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/mach-exynos/Makefile              |    1 -
 arch/arm/mach-exynos/dev-drm.c             |   29 ----------------------------
 arch/arm/mach-exynos/mach-nuri.c           |    3 --
 arch/arm/mach-exynos/mach-origen.c         |    3 --
 arch/arm/mach-exynos/mach-smdk4x12.c       |    3 --
 arch/arm/mach-exynos/mach-smdkv310.c       |    3 --
 arch/arm/mach-exynos/mach-universal_c210.c |    3 --
 arch/arm/plat-samsung/include/plat/devs.h  |    2 -
 8 files changed, 0 insertions(+), 47 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/dev-drm.c

diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
index 9b58024..1797dee 100644
--- a/arch/arm/mach-exynos/Makefile
+++ b/arch/arm/mach-exynos/Makefile
@@ -53,7 +53,6 @@ obj-$(CONFIG_EXYNOS4_DEV_AHCI)		+= dev-ahci.o
 obj-$(CONFIG_EXYNOS4_DEV_DWMCI)		+= dev-dwmci.o
 obj-$(CONFIG_EXYNOS_DEV_DMA)		+= dma.o
 obj-$(CONFIG_EXYNOS4_DEV_USB_OHCI)	+= dev-ohci.o
-obj-$(CONFIG_EXYNOS_DEV_DRM)		+= dev-drm.o
 obj-$(CONFIG_EXYNOS_DEV_SYSMMU)		+= dev-sysmmu.o
 
 obj-$(CONFIG_ARCH_EXYNOS)		+= setup-i2c0.o
diff --git a/arch/arm/mach-exynos/dev-drm.c b/arch/arm/mach-exynos/dev-drm.c
deleted file mode 100644
index 17c9c6e..0000000
--- a/arch/arm/mach-exynos/dev-drm.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/*
- * linux/arch/arm/mach-exynos/dev-drm.c
- *
- * Copyright (c) 2012 Samsung Electronics Co., Ltd.
- *		http://www.samsung.com
- *
- * EXYNOS - core DRM device
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
-
-#include <linux/kernel.h>
-#include <linux/dma-mapping.h>
-#include <linux/platform_device.h>
-
-#include <plat/devs.h>
-
-static u64 exynos_drm_dma_mask = DMA_BIT_MASK(32);
-
-struct platform_device exynos_device_drm = {
-	.name	= "exynos-drm",
-	.dev	= {
-		.dma_mask		= &exynos_drm_dma_mask,
-		.coherent_dma_mask	= DMA_BIT_MASK(32),
-	}
-};
diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index ea785fc..9267caf 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -1330,9 +1330,6 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&cam_vdda_fixed_rdev,
 	&cam_8m_12v_fixed_rdev,
 	&exynos4_bus_devfreq,
-#ifdef CONFIG_DRM_EXYNOS
-	&exynos_device_drm,
-#endif
 };
 
 static void __init nuri_map_io(void)
diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index b45600f..be8fac7 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -709,9 +709,6 @@ static struct platform_device *origen_devices[] __initdata = {
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
 	&s5p_device_mixer,
-#ifdef CONFIG_DRM_EXYNOS
-	&exynos_device_drm,
-#endif
 	&exynos4_device_ohci,
 	&origen_device_gpiokeys,
 	&origen_lcd_hv070wsa,
diff --git a/arch/arm/mach-exynos/mach-smdk4x12.c b/arch/arm/mach-exynos/mach-smdk4x12.c
index 81bf59c..f02ee11 100644
--- a/arch/arm/mach-exynos/mach-smdk4x12.c
+++ b/arch/arm/mach-exynos/mach-smdk4x12.c
@@ -317,9 +317,6 @@ static struct platform_device *smdk4x12_devices[] __initdata = {
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
-#ifdef CONFIG_DRM_EXYNOS
-	&exynos_device_drm,
-#endif
 	&samsung_device_keypad,
 };
 
diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index 12a1db2..bffb1b2 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -300,9 +300,6 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&s5p_device_fimc_md,
 	&s5p_device_g2d,
 	&s5p_device_jpeg,
-#ifdef CONFIG_DRM_EXYNOS
-	&exynos_device_drm,
-#endif
 	&exynos4_device_ac97,
 	&exynos4_device_i2s0,
 	&exynos4_device_ohci,
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index 4d1f40d..f7b1337 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -1084,9 +1084,6 @@ static struct platform_device *universal_devices[] __initdata = {
 	&s5p_device_onenand,
 	&s5p_device_fimd0,
 	&s5p_device_jpeg,
-#ifdef CONFIG_DRM_EXYNOS
-	&exynos_device_drm,
-#endif
 	&s3c_device_usb_hsotg,
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 5da4b4f..133e3e4 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -133,8 +133,6 @@ extern struct platform_device exynos4_device_pcm1;
 extern struct platform_device exynos4_device_pcm2;
 extern struct platform_device exynos4_device_spdif;
 
-extern struct platform_device exynos_device_drm;
-
 extern struct platform_device samsung_asoc_dma;
 extern struct platform_device samsung_asoc_idma;
 extern struct platform_device samsung_device_keypad;
-- 
1.7.0.4
