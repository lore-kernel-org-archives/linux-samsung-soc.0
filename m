From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH RESEND 3/4] ARM: EXYNOS: Add s3c-hsotg device support for NURI
 board
Date: Thu, 10 May 2012 15:16:57 +0200
Message-ID: <1336655818-15136-4-git-send-email-l.majewski@samsung.com>
References: <1336655818-15136-1-git-send-email-l.majewski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:8213 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755610Ab2EJNRQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 May 2012 09:17:16 -0400
Received: from euspt2 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M3T004TV65F37@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 14:15:15 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M3T007YW68L4N@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 10 May 2012 14:17:09 +0100 (BST)
In-reply-to: <1336655818-15136-1-git-send-email-l.majewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>

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
index 2c35fd4..5e64728 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -287,6 +287,7 @@ config MACH_NURI
 	select S5P_DEV_MFC
 	select S5P_DEV_USB_EHCI
 	select S5P_SETUP_MIPIPHY
+	select S3C_DEV_USB_HSOTG
 	select EXYNOS4_DEV_DMA
 	select EXYNOS4_SETUP_FIMC
 	select EXYNOS4_SETUP_FIMD0
diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index 021dc68..4402aad 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -348,6 +348,7 @@ static struct regulator_consumer_supply __initdata max8997_ldo1_[] = {
 	REGULATOR_SUPPLY("vdd", "s5p-adc"), /* Used by CPU's ADC drv */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo3_[] = {
+	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"), /* USB */
 	REGULATOR_SUPPLY("vdd11", "s5p-mipi-csis.0"), /* MIPI */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo4_[] = {
@@ -363,7 +364,7 @@ static struct regulator_consumer_supply __initdata max8997_ldo7_[] = {
 	REGULATOR_SUPPLY("dig_18", "0-001f"), /* HCD803 */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo8_[] = {
-	REGULATOR_SUPPLY("vusb_d", NULL), /* Used by CPU */
+	REGULATOR_SUPPLY("vusb_a", "s3c-hsotg"), /* USB */
 	REGULATOR_SUPPLY("vdac", NULL), /* Used by CPU */
 };
 static struct regulator_consumer_supply __initdata max8997_ldo11_[] = {
@@ -819,6 +820,7 @@ static struct regulator_init_data __initdata max8997_esafeout1_data = {
 	.constraints	= {
 		.name		= "SAFEOUT1",
 		.valid_ops_mask	= REGULATOR_CHANGE_STATUS,
+		.always_on	= 1,
 		.state_mem	= {
 			.disabled	= 1,
 		},
@@ -1076,6 +1078,9 @@ static void __init nuri_ehci_init(void)
 	s5p_ehci_set_platdata(pdata);
 }
 
+/* USB OTG */
+static struct s3c_hsotg_plat nuri_hsotg_pdata;
+
 /* CAMERA */
 static struct regulator_consumer_supply cam_vt_cam15_supply =
 	REGULATOR_SUPPLY("vdd_core", "6-003c");
@@ -1288,6 +1293,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
 	&s5p_device_fimc_md,
+	&s3c_device_usb_hsotg,
 
 	/* NURI Devices */
 	&nuri_gpio_keys,
@@ -1336,6 +1342,7 @@ static void __init nuri_machine_init(void)
 	nuri_camera_init();
 
 	nuri_ehci_init();
+	s3c_hsotg_set_platdata(&nuri_hsotg_pdata);
 
 	/* Last */
 	platform_add_devices(nuri_devices, ARRAY_SIZE(nuri_devices));
-- 
1.7.2.3
