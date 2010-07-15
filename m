From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 08/10 v2] ARM: S5PV210: enable FIMC on Aquila
Date: Thu, 15 Jul 2010 11:10:39 +0200
Message-ID: <1279185041-6004-9-git-send-email-s.nawrocki@samsung.com>
References: <1279185041-6004-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:26293 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932834Ab0GOJLF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jul 2010 05:11:05 -0400
Received: from eu_spt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L5L0058NDI0PV60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Jul 2010 10:10:50 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L5L009LJDHZYX@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Jul 2010 10:10:49 +0100 (BST)
In-reply-to: <1279185041-6004-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

From: Marek Szyprowski <m.szyprowski@samsung.com>

Add support for FIMC on Samsung Aquila board. Enable support for local
path mode between fimc and frame buffer.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig       |    7 +++++++
 arch/arm/mach-s5pv210/mach-aquila.c |   20 ++++++++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 5206562..fed64f5 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -63,10 +63,17 @@ menu "S5PC110 Machines"
 config MACH_AQUILA
 	bool "Aquila"
 	select CPU_S5PV210
+	select COMMON_AQUILA_GONI
 	select ARCH_SPARSEMEM_ENABLE
 	select S5PV210_SETUP_FB_24BPP
 	select S5PV210_SETUP_SDHCI
 	select S3C_DEV_FB
+	select S5P_DEV_FIMC0
+	select S5PV210_SETUP_FIMC0
+	select S5P_DEV_FIMC1
+	select S5PV210_SETUP_FIMC1
+	select S5P_DEV_FIMC2
+	select S5PV210_SETUP_FIMC2
 	select S5PC110_DEV_ONENAND
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC1
diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 6b60358..927bf47 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/serial_core.h>
 #include <linux/fb.h>
+#include <linux/clk.h>
 #include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/i2c-gpio.h>
@@ -41,9 +42,13 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/fb.h>
+#include <plat/fimc.h>
+#include <plat/fifo.h>
 #include <plat/gpio-cfg.h>
 #include <plat/sdhci.h>
 
+#include "common-aquila-goni.h"
+
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define S5PV210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
 				 S3C2410_UCON_RXILEVEL |	\
@@ -577,6 +582,9 @@ static struct platform_device *aquila_devices[] __initdata = {
 	&universal_spi_gpio,
 	&s5pc110_device_onenand,
 	&s3c_device_usbgadget,
+	&s5p_device_fimc0,
+	&s5p_device_fimc1,
+	&s5p_device_fimc2,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
 	&s3c_device_hsmmc2,
@@ -599,13 +607,25 @@ static void __init aquila_machine_init(void)
 	/* SPI */
 	spi_register_board_info(spi_board_info, ARRAY_SIZE(spi_board_info));
 
+	/* FIMC */
+	s5p_fimc0_set_platdata(NULL);
+	s5p_fimc1_set_platdata(NULL);
+	s5p_fimc2_set_platdata(NULL);
+
 	/* SDHCI */
 	aquila_setup_sdhci();
 
 	/* FB */
 	s3c_fb_set_platdata(&aquila_lcd_pdata);
 
+	/* FIMC->FB fifo links */
+	s5pv210_setup_fimc0_fb_link();
+	s5pv210_setup_fimc1_fb_link();
+	s5pv210_setup_fimc2_fb_link();
+
 	platform_add_devices(aquila_devices, ARRAY_SIZE(aquila_devices));
+
+	s5pv210_common_fimc_clk_init();
 }
 
 MACHINE_START(AQUILA, "Aquila")
-- 
1.7.0.4
