From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH 4/6] ARM: EXYNOS: Add hsotg device for NURI board
Date: Fri, 10 Feb 2012 11:35:44 +0100
Message-ID: <1328870146-20312-5-git-send-email-l.majewski@samsung.com>
References: <1328870146-20312-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:37692 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758994Ab2BJKfy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 05:35:54 -0500
Received: from euspt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LZ6002Z2ARR4S30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 10:35:51 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LZ6000FSARR8J@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 10:35:51 +0000 (GMT)
In-reply-to: <1328870146-20312-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

From: Joonyoung Shim <jy0922.shim@samsung.com>

This patch adds hsotg device to the NURI board.

Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
[Rebased on the newest git/kgene/linux-samsung #for-next]
Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
---
 arch/arm/mach-exynos/mach-nuri.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index 165c876..cd90ef2 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -43,6 +43,7 @@
 #include <plat/fb.h>
 #include <plat/sdhci.h>
 #include <plat/ehci.h>
+#include <plat/udc-hs.h>
 #include <plat/clock.h>
 #include <plat/gpio-cfg.h>
 #include <plat/iic.h>
@@ -391,6 +392,7 @@ static struct regulator_consumer_supply __initdata max8997_ldo1_[] = {
 	REGULATOR_SUPPLY("vdd", "s5p-adc"), /* Used by CPU's ADC drv */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo3_[] = {
+	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"), /* USB */
 	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"), /* MIPI */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo4_[] = {
@@ -403,7 +405,7 @@ static struct regulator_consumer_supply __initdata max8997_ldo7_[] = {
 	REGULATOR_SUPPLY("dig_18", "0-001f"), /* HCD803 */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo8_[] = {
-	REGULATOR_SUPPLY("vusb_d", NULL), /* Used by CPU */
+	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"), /* USB */
 	REGULATOR_SUPPLY("vdac", NULL), /* Used by CPU */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo11_[] = {
@@ -1115,6 +1117,9 @@ static void __init nuri_ehci_init(void)
 	s5p_ehci_set_platdata(pdata);
 }
 
+/* USB OTG */
+static struct s3c_hsotg_plat nuri_hsotg_pdata;
+
 /* CAMERA */
 static struct regulator_consumer_supply cam_vdda_supply[] = {
 	REGULATOR_SUPPLY("a_sensor", "0-001f"),
@@ -1268,6 +1273,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&exynos4_device_pd[PD_LCD0],
 	&exynos4_device_pd[PD_CAM],
 	&s5p_device_fimc_md,
+	&s3c_device_usb_hsotg,
 
 	/* NURI Devices */
 	&nuri_gpio_keys,
@@ -1312,6 +1318,7 @@ static void __init nuri_machine_init(void)
 	nuri_camera_init();
 
 	nuri_ehci_init();
+	s3c_hsotg_set_platdata(&nuri_hsotg_pdata);
 	clk_xusbxti.rate = 24000000;
 
 	/* Last */
-- 
1.7.2.3
