From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH 2/3] ARM: EXYNOS: Add s3c-hsotg device support for NURI board
Date: Tue, 13 Mar 2012 09:14:06 +0100
Message-ID: <1331626447-22868-3-git-send-email-l.majewski@samsung.com>
References: <1331626447-22868-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:31152 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758953Ab2CMIOR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Mar 2012 04:14:17 -0400
Received: from euspt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M0T00LK7DJRF2@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Mar 2012 08:14:15 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M0T0049XDJQJP@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Mar 2012 08:14:14 +0000 (GMT)
In-reply-to: <1331626447-22868-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>

From: Joonyoung Shim <jy0922.shim@samsung.com>

This patch adds hsotg device to the NURI board.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
[Rebased on the newest git/kgene/linux-samsung #for-next]
Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
---
 arch/arm/mach-exynos/Kconfig     |    1 +
 arch/arm/mach-exynos/mach-nuri.c |    9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 060414e..1292ad3 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -292,6 +292,7 @@ config MACH_NURI
 	select S5P_DEV_MFC
 	select S5P_DEV_USB_EHCI
 	select S5P_SETUP_MIPIPHY
+	select S3C_DEV_USB_HSOTG
 	select EXYNOS4_DEV_DMA
 	select EXYNOS4_SETUP_FIMC
 	select EXYNOS4_SETUP_FIMD0
diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index 7ac81ce..23463d8 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -44,6 +44,7 @@
 #include <plat/fb.h>
 #include <plat/sdhci.h>
 #include <plat/ehci.h>
+#include <plat/udc-hs.h>
 #include <plat/clock.h>
 #include <plat/gpio-cfg.h>
 #include <plat/iic.h>
@@ -390,6 +391,7 @@ static struct regulator_consumer_supply __initdata max8997_ldo1_[] = {
 	REGULATOR_SUPPLY("vdd", "s5p-adc"), /* Used by CPU's ADC drv */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo3_[] = {
+	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"), /* USB */
 	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"), /* MIPI */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo4_[] = {
@@ -405,7 +407,7 @@ static struct regulator_consumer_supply __initdata max8997_ldo7_[] = {
 	REGULATOR_SUPPLY("dig_18", "0-001f"), /* HCD803 */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo8_[] = {
-	REGULATOR_SUPPLY("vusb_d", NULL), /* Used by CPU */
+	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"), /* USB */
 	REGULATOR_SUPPLY("vdac", NULL), /* Used by CPU */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo11_[] = {
@@ -1118,6 +1120,9 @@ static void __init nuri_ehci_init(void)
 	s5p_ehci_set_platdata(pdata);
 }
 
+/* USB OTG */
+static struct s3c_hsotg_plat nuri_hsotg_pdata;
+
 /* CAMERA */
 static struct regulator_consumer_supply cam_vt_cam15_supply =
 	REGULATOR_SUPPLY("vdd_core", "6-003c");
@@ -1330,6 +1335,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
 	&s5p_device_fimc_md,
+	&s3c_device_usb_hsotg,
 
 	/* NURI Devices */
 	&nuri_gpio_keys,
@@ -1377,6 +1383,7 @@ static void __init nuri_machine_init(void)
 	nuri_camera_init();
 
 	nuri_ehci_init();
+	s3c_hsotg_set_platdata(&nuri_hsotg_pdata);
 	clk_xusbxti.rate = 24000000;
 
 	/* Last */
-- 
1.7.2.3
