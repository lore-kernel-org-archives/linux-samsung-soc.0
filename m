From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 2/2] ARM: S3C64XX: Hook up carrier class modules on Cragganmore
Date: Mon, 14 May 2012 18:20:41 +0100
Message-ID: <1337016041-16096-2-git-send-email-broonie@opensource.wolfsonmicro.com>
References: <1337016041-16096-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:34832 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757209Ab2ENRUr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 May 2012 13:20:47 -0400
In-Reply-To: <1337016041-16096-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

We now have an additional classs of modules which are enumerated at I2C
address 0x22. Add hookup for these modules.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/mach-crag6410.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c64xx/mach-crag6410.c b/arch/arm/mach-s3c64xx/mach-crag6410.c
index 0787b91..48eb76f 100644
--- a/arch/arm/mach-s3c64xx/mach-crag6410.c
+++ b/arch/arm/mach-s3c64xx/mach-crag6410.c
@@ -674,6 +674,7 @@ static struct i2c_board_info i2c_devs1[] __initdata = {
 	  .platform_data = &glenfarclas_pmic_pdata },
 
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x20) },
+	{ I2C_BOARD_INFO("wlf-gf-module", 0x22) },
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x24) },
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x25) },
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x26) },
-- 
1.7.10
