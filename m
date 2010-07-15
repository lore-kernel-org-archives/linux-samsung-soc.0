From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 09/10 v2] ARM: s5pv210: enable FIMC on Goni
Date: Thu, 15 Jul 2010 11:10:40 +0200
Message-ID: <1279185041-6004-10-git-send-email-s.nawrocki@samsung.com>
References: <1279185041-6004-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:26293 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932824Ab0GOJLA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Jul 2010 05:11:00 -0400
Received: from eu_spt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L5L0058NDI0PV60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Jul 2010 10:10:50 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L5L00443DHZWH@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 Jul 2010 10:10:48 +0100 (BST)
In-reply-to: <1279185041-6004-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: p.osciak@samsung.com, m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

From: Marek Szyprowski <m.szyprowski@samsung.com>

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig     |    1 +
 arch/arm/mach-s5pv210/mach-goni.c |   18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index fed64f5..e9e033e 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -85,6 +85,7 @@ config MACH_AQUILA
 config MACH_GONI
 	bool "GONI"
 	select CPU_S5PV210
+	select COMMON_AQUILA_GONI
 	select ARCH_SPARSEMEM_ENABLE
 	select S5PV210_SETUP_FB_24BPP
 	select S3C_DEV_FB
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 4792bf8..fde12df 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -40,6 +40,9 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/fb.h>
+#include <plat/fimc.h>
+
+#include "common-aquila-goni.h"
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define S5PV210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -498,6 +501,9 @@ static struct platform_device *goni_devices[] __initdata = {
 	&s3c_device_usbgadget,
 	&goni_i2c_gpio_pmic,
 	&goni_device_gpiokeys,
+	&s5p_device_fimc0,
+	&s5p_device_fimc1,
+	&s5p_device_fimc2,
 };
 
 static void __init goni_map_io(void)
@@ -520,7 +526,19 @@ static void __init goni_machine_init(void)
 	/* SPI */
 	spi_register_board_info(spi_board_info, ARRAY_SIZE(spi_board_info));
 
+	/* FIMC */
+	s5p_fimc0_set_platdata(NULL);
+	s5p_fimc1_set_platdata(NULL);
+	s5p_fimc2_set_platdata(NULL);
+
+	/* FIMC->FB fifo links */
+	s5pv210_setup_fimc0_fb_link();
+	s5pv210_setup_fimc1_fb_link();
+	s5pv210_setup_fimc2_fb_link();
+
 	platform_add_devices(goni_devices, ARRAY_SIZE(goni_devices));
+
+	s5pv210_common_fimc_clk_init();
 }
 
 MACHINE_START(GONI, "GONI")
-- 
1.7.0.4
