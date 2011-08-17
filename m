From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Add USB EHCI device to Origen
Date: Wed, 17 Aug 2011 12:30:20 +0530
Message-ID: <1313564420-862-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:60165 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750813Ab1HQHCs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Aug 2011 03:02:48 -0400
Received: by qwk3 with SMTP id 3so414887qwk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Aug 2011 00:02:47 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, sachin.kamat@linaro.org

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos4/Kconfig       |    2 ++
 arch/arm/mach-exynos4/mach-origen.c |   17 +++++++++++++++++
 2 files changed, 19 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index 3ab0f18..fba97a4 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -189,8 +189,10 @@ config MACH_NURI
 config MACH_ORIGEN
 	bool "ORIGEN"
 	select CPU_EXYNOS4210
+	select S5P_DEV_USB_EHCI
 	select S3C_DEV_RTC
 	select S3C_DEV_WDT
+	select EXYNOS4_SETUP_USB_PHY
 	select S3C_DEV_HSMMC2
 	select EXYNOS4_SETUP_SDHCI
 	help
diff --git a/arch/arm/mach-exynos4/mach-origen.c b/arch/arm/mach-exynos4/mach-origen.c
index ed59f86..d101756 100644
--- a/arch/arm/mach-exynos4/mach-origen.c
+++ b/arch/arm/mach-exynos4/mach-origen.c
@@ -24,6 +24,8 @@
 #include <plat/devs.h>
 #include <plat/sdhci.h>
 #include <plat/iic.h>
+#include <plat/ehci.h>
+#include <plat/clock.h>
 
 #include <mach/map.h>
 
@@ -79,10 +81,21 @@ static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
 	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
 };
 
+/* USB EHCI */
+static struct s5p_ehci_platdata origen_ehci_pdata;
+
+static void __init origen_ehci_init(void)
+{
+	struct s5p_ehci_platdata *pdata = &origen_ehci_pdata;
+
+	s5p_ehci_set_platdata(pdata);
+}
+
 static struct platform_device *origen_devices[] __initdata = {
 	&s3c_device_hsmmc2,
 	&s3c_device_rtc,
 	&s3c_device_wdt,
+	&s5p_device_ehci,
 };
 
 static void __init origen_map_io(void)
@@ -95,6 +108,10 @@ static void __init origen_map_io(void)
 static void __init origen_machine_init(void)
 {
 	s3c_sdhci2_set_platdata(&origen_hsmmc2_pdata);
+
+	origen_ehci_init();
+	clk_xusbxti.rate = 24000000;
+
 	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
 }
 
-- 
1.7.4.1
