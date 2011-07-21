From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/4] ARM: EXYNOS4: Enable MFC on Samsung NURI
Date: Thu, 21 Jul 2011 08:31:19 +0200
Message-ID: <1311229879-14818-5-git-send-email-m.szyprowski@samsung.com>
References: <1311229879-14818-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38375 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751318Ab1GUGb1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2011 02:31:27 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LOO00AAA7GF2H@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 07:31:27 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOO00LLH7GD4I@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jul 2011 07:31:25 +0100 (BST)
In-reply-to: <1311229879-14818-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kamil Debski <k.debski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

Enable MFC device on the Samsung NURI boards using the EXYNOS4 SoC.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig     |    2 ++
 arch/arm/mach-exynos4/mach-nuri.c |   13 +++++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 3cc0077..fc38532 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -196,7 +196,9 @@ config MACH_NURI
 	select S3C_DEV_I2C1
 	select S3C_DEV_I2C3
 	select S3C_DEV_I2C5
+	select S5P_DEV_MFC
 	select S5P_DEV_USB_EHCI
+	select EXYNOS4_DEV_PD
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_I2C3
 	select EXYNOS4_SETUP_I2C5
diff --git a/arch/arm/mach-exynos4/mach-nuri.c b/arch/arm/mach-exynos4/mach-nuri.c
index 1920906..43be71b 100644
--- a/arch/arm/mach-exynos4/mach-nuri.c
+++ b/arch/arm/mach-exynos4/mach-nuri.c
@@ -41,6 +41,8 @@
 #include <plat/clock.h>
 #include <plat/gpio-cfg.h>
 #include <plat/iic.h>
+#include <plat/mfc.h>
+#include <plat/pd.h>
 
 #include <mach/map.h>
 
@@ -1100,6 +1102,10 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&i2c9_gpio,
 	&s3c_device_adc,
 	&s3c_device_rtc,
+	&s5p_device_mfc,
+	&s5p_device_mfc_l,
+	&s5p_device_mfc_r,
+	&exynos4_device_pd[PD_MFC],
 
 	/* NURI Devices */
 	&nuri_gpio_keys,
@@ -1116,6 +1122,11 @@ static void __init nuri_map_io(void)
 	s3c24xx_init_uarts(nuri_uartcfgs, ARRAY_SIZE(nuri_uartcfgs));
 }
 
+static void __init nuri_reserve(void)
+{
+	s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
+}
+
 static void __init nuri_machine_init(void)
 {
 	nuri_sdhci_init();
@@ -1136,6 +1147,7 @@ static void __init nuri_machine_init(void)
 
 	/* Last */
 	platform_add_devices(nuri_devices, ARRAY_SIZE(nuri_devices));
+	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 }
 
 MACHINE_START(NURI, "NURI")
@@ -1145,4 +1157,5 @@ MACHINE_START(NURI, "NURI")
 	.map_io		= nuri_map_io,
 	.init_machine	= nuri_machine_init,
 	.timer		= &exynos4_timer,
+	.reserve        = &nuri_reserve,
 MACHINE_END
-- 
1.7.1.569.g6f426
