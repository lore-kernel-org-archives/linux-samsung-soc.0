From: Kamil Debski <k.debski@samsung.com>
Subject: [PATCH 3/3 v2] ARM: EXYNOS4: Enable MFC on universal_c210
Date: Tue, 14 Jun 2011 18:39:00 +0200
Message-ID: <1308069540-24934-4-git-send-email-k.debski@samsung.com>
References: <1308069540-24934-1-git-send-email-k.debski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:43868 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752058Ab1FNQjJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Jun 2011 12:39:09 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LMS00FB0GX9PT@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jun 2011 17:39:09 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LMS00FB1GX7C8@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 14 Jun 2011 17:39:08 +0100 (BST)
In-reply-to: <1308069540-24934-1-git-send-email-k.debski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, k.debski@samsung.com, jaeryul.oh@samsung.com, jtp.park@samsung.com, kgene.kim@samsung.com

Enable MFC device on the universal_c210 boards using the EXYNOS4 SoC.

Signed-off-by: Kamil Debski <k.debski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos4/Kconfig               |    2 ++
 arch/arm/mach-exynos4/mach-universal_c210.c |   13 +++++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 1435fc3..c7ecfc4 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -153,12 +153,14 @@ config MACH_ARMLEX4210
 config MACH_UNIVERSAL_C210
 	bool "Mobile UNIVERSAL_C210 Board"
 	select CPU_EXYNOS4210
+	select S5P_DEV_MFC
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
 	select S3C_DEV_I2C1
 	select S3C_DEV_I2C5
 	select S5P_DEV_ONENAND
+	select EXYNOS4_DEV_PD
 	select EXYNOS4_SETUP_I2C1
 	select EXYNOS4_SETUP_I2C5
 	select EXYNOS4_SETUP_SDHCI
diff --git a/arch/arm/mach-exynos4/mach-universal_c210.c b/arch/arm/mach-exynos4/mach-universal_c210.c
index 97d329f..cdb3c86 100644
--- a/arch/arm/mach-exynos4/mach-universal_c210.c
+++ b/arch/arm/mach-exynos4/mach-universal_c210.c
@@ -27,7 +27,9 @@
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/iic.h>
+#include <plat/mfc.h>
 #include <plat/sdhci.h>
+#include <plat/pd.h>
 
 #include <mach/map.h>
 
@@ -617,6 +619,10 @@ static struct platform_device *universal_devices[] __initdata = {
 	/* Universal Devices */
 	&universal_gpio_keys,
 	&s5p_device_onenand,
+	&s5p_device_mfc,
+	&s5p_device_mfc_l,
+	&s5p_device_mfc_r,
+	&exynos4_device_pd[PD_MFC],
 };
 
 static void __init universal_map_io(void)
@@ -626,6 +632,11 @@ static void __init universal_map_io(void)
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
@@ -638,6 +649,7 @@ static void __init universal_machine_init(void)
 
 	/* Last */
 	platform_add_devices(universal_devices, ARRAY_SIZE(universal_devices));
+	s5p_device_mfc.dev.parent = &exynos4_device_pd[PD_MFC].dev;
 }
 
 MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
@@ -647,4 +659,5 @@ MACHINE_START(UNIVERSAL_C210, "UNIVERSAL_C210")
 	.map_io		= universal_map_io,
 	.init_machine	= universal_machine_init,
 	.timer		= &exynos4_timer,
+	.reserve        = &universal_reserve,
 MACHINE_END
-- 
1.6.3.3
