From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/4] ARM: S5PV210: Enable MFC on Goni
Date: Mon, 18 Jul 2011 15:30:38 +0200
Message-ID: <1310995840-20660-3-git-send-email-m.szyprowski@samsung.com>
References: <1310995840-20660-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:22298 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753488Ab1GRNbO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 09:31:14 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LOJ002SL6W04M10@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 14:31:12 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOJ00D3H6VZ0M@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 14:31:12 +0100 (BST)
In-reply-to: <1310995840-20660-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kamil Debski <k.debski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Kamil Debski <k.debski@samsung.com>

Enable MFC device on the Goni board using the S5PV210 SoC.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig     |    1 +
 arch/arm/mach-s5pv210/mach-goni.c |   10 ++++++++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 37b5a97..a06acce 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -90,6 +90,7 @@ config MACH_GONI
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_I2C1
 	select S3C_DEV_I2C2
+	select S5P_DEV_MFC
 	select S3C_DEV_USB_HSOTG
 	select S5P_DEV_ONENAND
 	select SAMSUNG_DEV_KEYPAD
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 31d5aa7..50f2cc7 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -47,6 +47,7 @@
 #include <plat/sdhci.h>
 #include <plat/clock.h>
 #include <plat/s5p-time.h>
+#include <plat/mfc.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
 #define GONI_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
@@ -808,6 +809,9 @@ static struct platform_device *goni_devices[] __initdata = {
 	&goni_i2c_gpio5,
 	&mmc2_fixed_voltage,
 	&goni_device_gpiokeys,
+	&s5p_device_mfc,
+	&s5p_device_mfc_l,
+	&s5p_device_mfc_r,
 	&s3c_device_i2c0,
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
@@ -841,6 +845,11 @@ static void __init goni_map_io(void)
 	s5p_set_timer_source(S5P_PWM3, S5P_PWM4);
 }
 
+static void __init goni_reserve(void)
+{
+	s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
+}
+
 static void __init goni_machine_init(void)
 {
 	/* Radio: call before I2C 1 registeration */
@@ -893,4 +902,5 @@ MACHINE_START(GONI, "GONI")
 	.map_io		= goni_map_io,
 	.init_machine	= goni_machine_init,
 	.timer		= &s5p_timer,
+	.reserve	= &goni_reserve,
 MACHINE_END
-- 
1.7.1.569.g6f426
