From: Tomasz Stanislawski <t.stanislaws@samsung.com>
Subject: [PATCH v4 9/9] arm: s5pv210: goni: add TV support
Date: Wed, 25 May 2011 14:29:24 +0200
Message-ID: <1306326564-21858-10-git-send-email-t.stanislaws@samsung.com>
References: <1306326564-21858-1-git-send-email-t.stanislaws@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:9212 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757153Ab1EYMae (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 08:30:34 -0400
Received: from spt2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LLR0064M415UK@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 May 2011 13:29:31 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LLR009NF414PK@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 May 2011 13:29:29 +0100 (BST)
In-reply-to: <1306326564-21858-1-git-send-email-t.stanislaws@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, t.stanislaws@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Add platform devices and regulator and for TV devices on
Samsung Goni board.

Signed-off-by: Tomasz Stanislawski <t.stanislaws@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig     |    1 +
 arch/arm/mach-s5pv210/mach-goni.c |    9 +++++++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 7e73ae8..9b93252 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -99,6 +99,7 @@ config MACH_GONI
 	select S3C_DEV_USB_HSOTG
 	select S5P_DEV_ONENAND
 	select SAMSUNG_DEV_KEYPAD
+	select S5P_DEV_TV
 	select S5PV210_SETUP_FB_24BPP
 	select S5PV210_SETUP_I2C1
 	select S5PV210_SETUP_I2C2
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 31d5aa7..0c8af58 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -284,6 +284,7 @@ static struct regulator_consumer_supply goni_ldo5_consumers[] = {
 
 static struct regulator_consumer_supply goni_ldo8_consumers[] = {
 	REGULATOR_SUPPLY("vusb_d", "s3c-hsotg"),
+	REGULATOR_SUPPLY("vdd33a_dac", "s5p-sdo"),
 };
 
 static struct regulator_consumer_supply goni_ldo11_consumers[] = {
@@ -474,6 +475,10 @@ static struct regulator_consumer_supply buck1_consumer =
 static struct regulator_consumer_supply buck2_consumer =
 	REGULATOR_SUPPLY("vddint", NULL);
 
+static struct regulator_consumer_supply buck3_consumer =
+	REGULATOR_SUPPLY("vdet", "s5p-sdo");
+
+
 static struct regulator_init_data goni_buck1_data = {
 	.constraints	= {
 		.name		= "VARM_1.2V",
@@ -510,6 +515,8 @@ static struct regulator_init_data goni_buck3_data = {
 			.enabled = 1,
 		},
 	},
+	.num_consumer_supplies	= 1,
+	.consumer_supplies	= &buck3_consumer,
 };
 
 static struct regulator_init_data goni_buck4_data = {
@@ -808,6 +815,8 @@ static struct platform_device *goni_devices[] __initdata = {
 	&goni_i2c_gpio5,
 	&mmc2_fixed_voltage,
 	&goni_device_gpiokeys,
+	&s5p_device_mixer,
+	&s5p_device_sdo,
 	&s3c_device_i2c0,
 	&s5p_device_fimc0,
 	&s5p_device_fimc1,
-- 
1.7.5.1
