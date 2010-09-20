From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCHv2 6/7] ARM: S5PC110: add support for otg usb gadget on Goni
 board
Date: Mon, 20 Sep 2010 14:55:36 +0200
Message-ID: <1284987337-15365-7-git-send-email-m.szyprowski@samsung.com>
References: <1284987337-15365-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:51290 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755926Ab0ITMzo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Sep 2010 08:55:44 -0400
Received: from eu_spt2 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L9100METQKT0K00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Sep 2010 13:55:41 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L91003ZCQKSW3@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 20 Sep 2010 13:55:41 +0100 (BST)
In-reply-to: <1284987337-15365-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Add required platform definitions for s3c-hsotg driver to enable usb
gadget support on Samsung Goni board.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig     |    1 +
 arch/arm/mach-s5pv210/mach-goni.c |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index b1f671d..f8bac5a 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -85,6 +85,7 @@ config MACH_GONI
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_I2C1
 	select S5P_DEV_ONENAND
+	select S3C_DEV_USB_HSOTG
 	select SAMSUNG_DEV_KEYPAD
 	select S5PV210_SETUP_FB_24BPP
 	select S5PV210_SETUP_I2C1
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 5677c4d..68e22f2 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -41,6 +41,7 @@
 #include <plat/iic.h>
 #include <plat/keypad.h>
 #include <plat/sdhci.h>
+#include <plat/clock.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define GONI_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -569,6 +570,7 @@ static struct platform_device *goni_devices[] __initdata = {
 	&s3c_device_fb,
 	&s5p_device_onenand,
 	&goni_spi_gpio,
+	&s3c_device_usb_hsotg,
 	&goni_i2c_gpio_pmic,
 	&goni_device_gpiokeys,
 	&s5p_device_fimc0,
@@ -614,6 +616,8 @@ static void __init goni_machine_init(void)
 	samsung_keypad_set_platdata(&keypad_data);
 
 	platform_add_devices(goni_devices, ARRAY_SIZE(goni_devices));
+
+	clk_xusbxti.rate = 24000000;
 }
 
 MACHINE_START(GONI, "GONI")
-- 
1.7.1.569.g6f426
