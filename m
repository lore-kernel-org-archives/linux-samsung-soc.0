From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/4] ARM: S5PV210: Enable MFC on Goni
Date: Thu, 21 Jul 2011 08:31:17 +0200
Message-ID: <1311229879-14818-3-git-send-email-m.szyprowski@samsung.com>
References: <1311229879-14818-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:28874 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751003Ab1GUGb0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2011 02:31:26 -0400
Received: from spt2.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOO004GU7GDHY@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 07:31:25 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOO00FQA7GC9X@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 07:31:24 +0100 (BST)
In-reply-to: <1311229879-14818-1-git-send-email-m.szyprowski@samsung.com>
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
index 79bb3a0..69dd87c 100644
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
index e0c4d06..85c2d51 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -46,6 +46,7 @@
 #include <plat/sdhci.h>
 #include <plat/clock.h>
 #include <plat/s5p-time.h>
+#include <plat/mfc.h>
 #include <plat/regs-fb-v4.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
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
