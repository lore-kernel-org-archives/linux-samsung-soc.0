From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/3] ARM: S5PV210: GONI: add support for framebuffer
Date: Wed, 14 Jul 2010 10:16:54 +0200
Message-ID: <1279095416-24871-2-git-send-email-m.szyprowski@samsung.com>
References: <1279095416-24871-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:20414 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752665Ab0GNIRE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jul 2010 04:17:04 -0400
Received: from eu_spt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L5J003BPGCCQH@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Jul 2010 09:17:00 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L5J002WMGCBLK@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 14 Jul 2010 09:17:00 +0100 (BST)
In-reply-to: <1279095416-24871-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

This patch adds required platform definitions to enable s3c-fb
driver on GONI board. One framebuffer window in 480x800x16bpp mode is
defined.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig     |    2 ++
 arch/arm/mach-s5pv210/mach-goni.c |   34 ++++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 5e88941..8ab4bb0 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -59,6 +59,8 @@ config MACH_GONI
 	bool "GONI"
 	select CPU_S5PV210
 	select ARCH_SPARSEMEM_ENABLE
+	select S5PV210_SETUP_FB_24BPP
+	select S3C_DEV_FB
 	select S5PC110_DEV_ONENAND
 	help
 	  Machine support for Samsung GONI board
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 88c38e3..bec488e 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/serial_core.h>
+#include <linux/fb.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -20,11 +21,13 @@
 
 #include <mach/map.h>
 #include <mach/regs-clock.h>
+#include <mach/regs-fb.h>
 
 #include <plat/regs-serial.h>
 #include <plat/s5pv210.h>
 #include <plat/devs.h>
 #include <plat/cpu.h>
+#include <plat/fb.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define S5PV210_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -73,7 +76,35 @@ static struct s3c2410_uartcfg goni_uartcfgs[] __initdata = {
 	},
 };
 
+/* Frame Buffer */
+static struct s3c_fb_pd_win goni_fb_win0 = {
+	.win_mode = {
+		.pixclock = 1000000000000ULL / ((16+16+2+480)*(28+3+2+800)*55),
+		.left_margin	= 16,
+		.right_margin	= 16,
+		.upper_margin	= 3,
+		.lower_margin	= 28,
+		.hsync_len	= 2,
+		.vsync_len	= 2,
+		.xres		= 480,
+		.yres		= 800,
+		.refresh	= 55,
+	},
+	.max_bpp	= 32,
+	.default_bpp	= 16,
+};
+
+static struct s3c_fb_platdata goni_lcd_pdata __initdata = {
+	.win[0]		= &goni_fb_win0,
+	.vidcon0	= VIDCON0_VIDOUT_RGB | VIDCON0_PNRMODE_RGB |
+			  VIDCON0_CLKSEL_LCD,
+	.vidcon1	= VIDCON1_INV_VCLK | VIDCON1_INV_VDEN
+			  | VIDCON1_INV_HSYNC | VIDCON1_INV_VSYNC,
+	.setup_gpio	= s5pv210_fb_gpio_setup_24bpp,
+};
+
 static struct platform_device *goni_devices[] __initdata = {
+	&s3c_device_fb,
 	&s5pc110_device_onenand,
 };
 
@@ -86,6 +117,9 @@ static void __init goni_map_io(void)
 
 static void __init goni_machine_init(void)
 {
+	/* FB */
+	s3c_fb_set_platdata(&goni_lcd_pdata);
+
 	platform_add_devices(goni_devices, ARRAY_SIZE(goni_devices));
 }
 
-- 
1.7.1.569.g6f426
