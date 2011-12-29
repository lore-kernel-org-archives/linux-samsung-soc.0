From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 1/2] ARM: S3C64XX: Fix the memory mapped GPIOs on Cragganmore
Date: Thu, 29 Dec 2011 01:23:32 +0000
Message-ID: <1325121813-2066-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:53313 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753544Ab1L2BXi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 20:23:38 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Rather than letting them get allocated dynamically where we don't know
where they are, and also name the data line resource as gpio-generic
requires that.  Without these changes the GPIOs are useless.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/include/mach/crag6410.h |    1 +
 arch/arm/mach-s3c64xx/mach-crag6410.c         |    3 ++-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/include/mach/crag6410.h b/arch/arm/mach-s3c64xx/include/mach/crag6410.h
index 5d55ab0..4cb2f951 100644
--- a/arch/arm/mach-s3c64xx/include/mach/crag6410.h
+++ b/arch/arm/mach-s3c64xx/include/mach/crag6410.h
@@ -21,5 +21,6 @@
 #define CODEC_GPIO_BASE			(GPIO_BOARD_START + 8)
 #define GLENFARCLAS_PMIC_GPIO_BASE	(GPIO_BOARD_START + 32)
 #define BANFF_PMIC_GPIO_BASE		(GPIO_BOARD_START + 64)
+#define MMGPIO_GPIO_BASE		(GPIO_BOARD_START + 96)
 
 #endif
diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index 2e699b9..d0308f0 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -261,6 +261,7 @@ static struct platform_device crag6410_dm9k_device = {
 
 static struct resource crag6410_mmgpio_resource[] = {
 	[0] = {
+		.name	= "dat",
 		.start	= S3C64XX_PA_XM0CSN4 + 1,
 		.end	= S3C64XX_PA_XM0CSN4 + 1,
 		.flags	= IORESOURCE_MEM,
@@ -273,7 +274,7 @@ static struct platform_device crag6410_mmgpio = {
 	.resource	= crag6410_mmgpio_resource,
 	.num_resources	= ARRAY_SIZE(crag6410_mmgpio_resource),
 	.dev.platform_data = &(struct bgpio_pdata) {
-		.base	= -1,
+		.base	= MMGPIO_GPIO_BASE,
 	},
 };
 
-- 
1.7.7.3
