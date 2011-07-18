From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/4] ARM: EXYNOS4: Enable MFC on universal_c210
Date: Mon, 18 Jul 2011 15:30:39 +0200
Message-ID: <1310995840-20660-4-git-send-email-m.szyprowski@samsung.com>
References: <1310995840-20660-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:60597 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753451Ab1GRNbP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jul 2011 09:31:15 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LOJ00H2G6W1RR20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 14:31:13 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LOJ00DQG6W0PJ@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 18 Jul 2011 14:31:12 +0100 (BST)
In-reply-to: <1310995840-20660-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kamil Debski <k.debski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Kamil Debski <k.debski@samsung.com>

Enable MFC device on the universal_c210 boards using the EXYNOS4 SoC.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig               |    2 ++
 arch/arm/mach-exynos4/mach-universal_c210.c |   13 +++++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index a4fb109..ea9a7be 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -166,7 +166,9 @@ config MACH_UNIVERSAL_C210
 	select S3C_DEV_I2C1
 	select S3C_DEV_I2C3
 	select S3C_DEV_I2C5
+	select S5P_DEV_MFC
 	select S5P_DEV_ONENAND
+	select EXYNOS4_DEV_PD
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_I2C3
 	select EXYNOS4_SETUP_I2C5
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index 5d8b097..0e280d1 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -31,7 +31,9 @@
 #include <plat/devs.h>
 #include <plat/iic.h>
 #include <plat/gpio-cfg.h>
+#include <plat/mfc.h>
 #include <plat/sdhci.h>
+#include <plat/pd.h>
 
 #include <mach/map.h>
 
@@ -717,6 +719,10 @@ static struct platform_device *universal_devices[] __initdata = {
 	&i2c_gpio12,
 	&universal_gpio_keys,
 	&s5p_device_onenand,
+	&s5p_device_mfc,
+	&s5p_device_mfc_l,
+	&s5p_device_mfc_r,
+	&exynos4_device_pd[PD_MFC],
 };
 
 static void __init universal_map_io(void)
@@ -726,6 +732,11 @@ static void __init universal_map_io(void)
 	s3c24xx_init_uarts(universal_uartcfgs, ARRAY_SIZE(universal_uartcfgs));
 }
 
+static void __init universal_reserve(void)
+{
+	s5p_mfc_reserve_mem(0x43000000, 8 << 20, 0x51000000, 8 << 20);
+}
+
 static void __init universal_machine_init(void)
 {
 	universal_sdhci_init();
@@ -746,6 +757,7 @@ static void __init universal_machine_init(void)
 
 	/* Last */
 	platform_add_devices(universal_devices, ARRAY_SIZE(universal_devices));
+	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 }
 
 MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
@@ -755,4 +767,5 @@ MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
 	.map_io		= universal_map_io,
 	.init_machine	= universal_machine_init,
 	.timer		= &exynos4_timer,
+	.reserve        = &universal_reserve,
 MACHINE_END
-- 
1.7.1.569.g6f426
