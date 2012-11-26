From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] ARM: S3C64XX: Add registration of WM2200 Bells device on Cragganmore
Date: Mon, 26 Nov 2012 15:45:01 +0000
Message-ID: <1353944701-5129-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:53912 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755449Ab2KZPpD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 10:45:03 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: patches@opensource.wolfsonmicro.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/mach-crag6410.c |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index 2abe95d..c06bcfa 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -287,16 +287,21 @@ static struct platform_device littlemill_device = {
 	.id		= -1,
 };
 
-static struct platform_device bells_wm5102_device = {
+static struct platform_device bells_wm2200_device = {
 	.name		= "bells",
 	.id		= 0,
 };
 
-static struct platform_device bells_wm5110_device = {
+static struct platform_device bells_wm5102_device = {
 	.name		= "bells",
 	.id		= 1,
 };
 
+static struct platform_device bells_wm5110_device = {
+	.name		= "bells",
+	.id		= 2,
+};
+
 static struct regulator_consumer_supply wallvdd_consumers[] = {
 	REGULATOR_SUPPLY("SPKVDD", "1-001a"),
 	REGULATOR_SUPPLY("SPKVDD1", "1-001a"),
@@ -376,6 +381,7 @@ static struct platform_device *crag6410_devices[] __initdata = {
 	&tobermory_device,
 	&littlemill_device,
 	&lowland_device,
+	&bells_wm2200_device,
 	&bells_wm5102_device,
 	&bells_wm5110_device,
 	&wallvdd_device,
-- 
1.7.10.4
