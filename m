From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 5/6] ARM: S5PC110: add support for otg usb gadget on Goni board
Date: Fri, 10 Sep 2010 09:23:22 +0200
Message-ID: <1284103403-10696-6-git-send-email-m.szyprowski@samsung.com>
References: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:35026 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753530Ab0IJHXc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 03:23:32 -0400
Received: from eu_spt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L8I00EZ7SJ3VY30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 08:23:28 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8I007C9SJ3V3@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 08:23:27 +0100 (BST)
In-reply-to: <1284103403-10696-1-git-send-email-m.szyprowski@samsung.com>
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
 arch/arm/mach-s5pv210/mach-goni.c |    5 +++++
 2 files changed, 6 insertions(+), 0 deletions(-)

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
index 30da422..b28a42b 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -41,6 +41,8 @@
 #include <plat/iic.h>
 #include <plat/keypad.h>
 #include <plat/sdhci.h>
+#include <plat/clock.h>
+#include <plat/s5p-clock.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define GONI_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -569,6 +571,7 @@ static struct platform_device *goni_devices[] __initdata = {
 	&s3c_device_fb,
 	&s5p_device_onenand,
 	&goni_spi_gpio,
+	&s3c_device_usb_hsotg,
 	&goni_i2c_gpio_pmic,
 	&goni_device_gpiokeys,
 	&s5p_device_fimc0,
@@ -613,6 +616,8 @@ static void __init goni_machine_init(void)
 	samsung_keypad_set_platdata(&keypad_data);
 
 	platform_add_devices(goni_devices, ARRAY_SIZE(goni_devices));
+
+	clk_xusbxti.rate = 24000000;
 }
 
 MACHINE_START(GONI, "GONI")
-- 
1.7.2.2
