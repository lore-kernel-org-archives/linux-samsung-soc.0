From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Add s3c-hsotg device support for GONI board
Date: Thu, 15 Mar 2012 10:03:15 +0100
Message-ID: <1331802195-10133-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:42529 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760747Ab2COJDW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Mar 2012 05:03:22 -0400
Received: from euspt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M0X008F055CB6@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Mar 2012 09:03:12 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0X00KCB55H8H@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Mar 2012 09:03:17 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

This patch adds hsotg device to the GONI board.

Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig     |    1 +
 arch/arm/mach-s5pv210/mach-goni.c |    6 ++++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 29594fc..88e983b 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -85,6 +85,7 @@ config MACH_AQUILA
 	select S5P_DEV_ONENAND
 	select S5PV210_SETUP_FB_24BPP
 	select S5PV210_SETUP_SDHCI
+	select S5PV210_SETUP_USB_PHY
 	help
 	  Machine support for the Samsung Aquila target based on S5PC110 SoC
 
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 2cf5ed7..f5f4926 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -49,6 +49,7 @@
 #include <plat/mfc.h>
 #include <plat/regs-fb-v4.h>
 #include <plat/camport.h>
+#include <plat/udc-hs.h>
 
 #include <media/v4l2-mediabus.h>
 #include <media/s5p_fimc.h>
@@ -277,6 +278,9 @@ static void __init goni_tsp_init(void)
 	i2c2_devs[0].irq = gpio_to_irq(gpio);
 }
 
+/* USB OTG */
+static struct s3c_hsotg_plat goni_hsotg_pdata;
+
 static void goni_camera_init(void)
 {
 	s5pv210_fimc_setup_gpio(S5P_CAMPORT_A);
@@ -939,6 +943,8 @@ static void __init goni_machine_init(void)
 	s3c_set_platdata(&goni_fimc_md_platdata, sizeof(goni_fimc_md_platdata),
 			 &s5p_device_fimc_md);
 
+	s3c_hsotg_set_platdata(&goni_hsotg_pdata);
+
 	goni_camera_init();
 
 	/* SPI */
-- 
1.7.2.3
