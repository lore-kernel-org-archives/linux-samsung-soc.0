From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] ARM: S3C64XX: Fix build of Cragganmore after SPI changes
Date: Wed, 28 Dec 2011 12:05:36 +0000
Message-ID: <1325073936-10936-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:39754 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753722Ab1L1MFv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 07:05:51 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

Commit 875a59 (ARM: SAMSUNG: Consolidation of SPI platform devices to
plat-samsung) replaced the function s3c64xx_spi_set_info() with
s3c64xx_spiN_set_platdata() but did not update all the machines, with
Cragganmore being left. Fix that.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/mach-crag6410.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index 3600998..b77331e 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -736,7 +736,7 @@ static void __init crag6410_machine_init(void)
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));
 
 	samsung_keypad_set_platdata(&crag6410_keypad_data);
-        s3c64xx_spi_set_info(0, 0, 1);
+	s3c64xx_spi0_set_platdata(NULL, 0, 1);
 
 	platform_add_devices(crag6410_devices, ARRAY_SIZE(crag6410_devices));
 
-- 
1.7.7.3
