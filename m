From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 2/3] ARM: EXYNOS: Add USB OHCI support to SMDKV310 board
Date: Tue, 15 Nov 2011 15:31:48 +0900
Message-ID: <1321338708-15561-1-git-send-email-jg1.han@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:42386 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752233Ab1KOGwh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Nov 2011 01:52:37 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Alan Stern <stern@rowland.harvard.edu>, Kukji
Cc: Yulgon Kim <yulgon.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Jingoo Han <jg1.han@samsung.com>

This patch adds USB OHCI support to SMDKV310 board.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-exynos/Kconfig         |    1 +
 arch/arm/mach-exynos/mach-smdkv310.c |   13 +++++++++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 724ec0f..4e417ea 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -170,6 +170,7 @@ config MACH_SMDKV310
 	select S5P_DEV_MFC
 	select S5P_DEV_TV
 	select S5P_DEV_USB_EHCI
+	select S5P_DEV_USB_OHCI
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC1
 	select S3C_DEV_HSMMC2
diff --git a/arch/arm/mach-exynos/mach-smdkv310.c b/arch/arm/mach-exynos/mach-smdkv310.c
index cec2afa..50199c7 100644
--- a/arch/arm/mach-exynos/mach-smdkv310.c
+++ b/arch/arm/mach-exynos/mach-smdkv310.c
@@ -39,6 +39,7 @@
 #include <plat/backlight.h>
 #include <plat/mfc.h>
 #include <plat/ehci.h>
+#include <plat/ohci.h>
 #include <plat/clock.h>
 
 #include <mach/map.h>
@@ -245,6 +246,16 @@ static void __init smdkv310_ehci_init(void)
 	s5p_ehci_set_platdata(pdata);
 }
 
+/* USB OHCI */
+static struct s5p_ohci_platdata smdkv310_ohci_pdata;
+
+static void __init smdkv310_ohci_init(void)
+{
+	struct s5p_ohci_platdata *pdata = &smdkv310_ohci_pdata;
+
+	s5p_ohci_set_platdata(pdata);
+}
+
 static struct platform_device *smdkv310_devices[] __initdata = {
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
@@ -255,6 +266,7 @@ static struct platform_device *smdkv310_devices[] __initdata = {
 	&s3c_device_rtc,
 	&s3c_device_wdt,
 	&s5p_device_ehci,
+	&s5p_device_ohci,
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
 	&s5p_device_fimc2,
@@ -363,6 +375,7 @@ static void __init smdkv310_machine_init(void)
 	s5p_fimd0_set_platdata(&smdkv310_lcd0_pdata);
 
 	smdkv310_ehci_init();
+	smdkv310_ohci_init();
 	clk_xusbxti.rate = 24000000;
 
 	platform_add_devices(smdkv310_devices, ARRAY_SIZE(smdkv310_devices));
-- 
1.7.1
