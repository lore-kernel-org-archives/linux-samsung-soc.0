From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 2/2] ARM: S3C64XX: Register audio platform devices for Bells on Cragganmore
Date: Thu,  9 Aug 2012 19:05:49 +0100
Message-ID: <1344535549-4371-2-git-send-email-broonie@opensource.wolfsonmicro.com>
References: <1344535549-4371-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:50643 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758821Ab2HISFz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Aug 2012 14:05:55 -0400
In-Reply-To: <1344535549-4371-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/mach-crag6410.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index ab8dbbe4..4103ed3 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -287,6 +287,16 @@ static struct platform_device littlemill_device = {
 	.id		= -1,
 };
 
+static struct platform_device bells_wm5102_device = {
+	.name		= "bells",
+	.id		= 0,
+};
+
+static struct platform_device bells_wm5110_device = {
+	.name		= "bells",
+	.id		= 1,
+};
+
 static struct regulator_consumer_supply wallvdd_consumers[] = {
 	REGULATOR_SUPPLY("SPKVDD", "1-001a"),
 	REGULATOR_SUPPLY("SPKVDD1", "1-001a"),
@@ -359,6 +369,8 @@ static struct platform_device *crag6410_devices[] __initdata = {
 	&tobermory_device,
 	&littlemill_device,
 	&lowland_device,
+	&bells_wm5102_device,
+	&bells_wm5110_device,
 	&wallvdd_device,
 };
 
-- 
1.7.10.4
