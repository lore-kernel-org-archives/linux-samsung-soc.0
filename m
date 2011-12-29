From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] ARM: S3C64XX: Fix interrupt configuration for PCA935x on Cragganmore
Date: Thu, 29 Dec 2011 01:26:19 +0000
Message-ID: <1325121979-3609-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:53326 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754748Ab1L2B0Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 20:26:25 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

0 is a valid IRQ but the interrupt line for the pca935x certainly isn't
connected there which causes it to fail to probe.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/mach-crag6410.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index 46dfb14..139d16e 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -357,7 +357,7 @@ static struct platform_device *crag6410_devices[] __initdata = {
 
 static struct pca953x_platform_data crag6410_pca_data = {
 	.gpio_base	= PCA935X_GPIO_BASE,
-	.irq_base	= 0,
+	.irq_base	= -1,
 };
 
 /* VDDARM is controlled by DVS1 connected to GPK(0) */
-- 
1.7.7.3
