From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] ARM: S3C64XX: Clean up after SPI driver platform data updates
Date: Tue, 17 Jul 2012 18:53:00 +0100
Message-ID: <1342547581-15028-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:43173 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753114Ab2GQRxE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jul 2012 13:53:04 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Commit 1c20c2 (spi: s3c64xx: Remove the 'set_level' callback from
controller data) didn't update all the users, breaking the build.  Fix
that.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/mach-crag6410-module.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
index 4645aa1..9e382e7 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
@@ -29,7 +29,6 @@
 #include <mach/crag6410.h>
 
 static struct s3c64xx_spi_csinfo wm0010_spi_csinfo = {
-	.set_level = gpio_set_value,
 	.line = S3C64XX_GPC(3),
 };
 
-- 
1.7.10.4
