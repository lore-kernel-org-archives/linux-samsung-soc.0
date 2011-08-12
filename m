From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH 4/4] ARM: S5PV210: enable TV support on GONI board
Date: Fri, 12 Aug 2011 11:45:42 +0200
Message-ID: <1313142342-22403-5-git-send-email-t.stanislaws@samsung.com>
References: <1313142342-22403-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:13810 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751951Ab1HLJpu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 05:45:50 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LPT00B2374CSJ50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 10:45:48 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LPT006VP74BQL@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 12 Aug 2011 10:45:47 +0100 (BST)
In-reply-to: <1313142342-22403-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com

This patch adds platform devices and regulators for TV devices on
Samsung Goni board.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig     |    1 +
 arch/arm/mach-s5pv210/mach-goni.c |    9 +++++++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 69dd87c..ab6a87c 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -94,6 +94,7 @@ config MACH_GONI
 	select S3C_DEV_USB_HSOTG
 	select S5P_DEV_ONENAND
 	select SAMSUNG_DEV_KEYPAD
+	select S5P_DEV_TV
 	select S5PV210_SETUP_FB_24BPP
 	select S5PV210_SETUP_I2C1
 	select S5PV210_SETUP_I2C2
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 85c2d51..14578f5 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -285,6 +285,7 @@ static struct regulator_consumer_supply goni_ldo5_consumers[] = {
 
 static struct regulator_consumer_supply goni_ldo8_consumers[] = {
 	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"),
+	REGULATOR_SUPPLY("vdd33a_dac", "s5p-sdo"),
 };
 
 static struct regulator_consumer_supply goni_ldo11_consumers[] = {
@@ -475,6 +476,10 @@ static struct regulator_consumer_supply buck1_consumer =
 static struct regulator_consumer_supply buck2_consumer =
 	REGULATOR_SUPPLY("vddint", NULL);
 
+static struct regulator_consumer_supply buck3_consumer =
+	REGULATOR_SUPPLY("vdet", "s5p-sdo");
+
+
 static struct regulator_init_data goni_buck1_data = {
 	.constraints	= {
 		.name		= "VARM_1.2V",
@@ -511,6 +516,8 @@ static struct regulator_init_data goni_buck3_data = {
 			.enabled = 1,
 		},
 	},
+	.num_consumer_supplies	= 1,
+	.consumer_supplies	= &buck3_consumer,
 };
 
 static struct regulator_init_data goni_buck4_data = {
@@ -812,6 +819,8 @@ static struct platform_device *goni_devices[] __initdata = {
 	&s5p_device_mfc,
 	&s5p_device_mfc_l,
 	&s5p_device_mfc_r,
+	&s5p_device_mixer,
+	&s5p_device_sdo,
 	&s3c_device_i2c0,
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
-- 
1.7.6
