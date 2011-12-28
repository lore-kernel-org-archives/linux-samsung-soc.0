From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH] ARM: S3C64XX: Remove unconditional power domain disables
Date: Wed, 28 Dec 2011 11:25:46 +0000
Message-ID: <1325071546-28711-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:38700 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753648Ab1L1LZu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Dec 2011 06:25:50 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>

Now that we have software runtime power management support this code is
redundant.

Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/pm.c |   13 -------------
 1 files changed, 0 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/pm.c b/arch/arm/mach-s3c64xx/pm.c
index 055dac9..7d3e81b 100644
--- a/arch/arm/mach-s3c64xx/pm.c
+++ b/arch/arm/mach-s3c64xx/pm.c
@@ -346,23 +346,10 @@ int __init s3c64xx_pm_init(void)
 
 static __init int s3c64xx_pm_initcall(void)
 {
-	u32 val;
-
 	pm_cpu_prep = s3c64xx_pm_prepare;
 	pm_cpu_sleep = s3c64xx_cpu_suspend;
 	pm_uart_udivslot = 1;
 
-	/*
-	 * Unconditionally disable power domains that contain only
-	 * blocks which have no mainline driver support.
-	 */
-	val = __raw_readl(S3C64XX_NORMAL_CFG);
-	val &= ~(S3C64XX_NORMALCFG_DOMAIN_G_ON |
-		 S3C64XX_NORMALCFG_DOMAIN_V_ON |
-		 S3C64XX_NORMALCFG_DOMAIN_I_ON |
-		 S3C64XX_NORMALCFG_DOMAIN_P_ON);
-	__raw_writel(val, S3C64XX_NORMAL_CFG);
-
 #ifdef CONFIG_S3C_PM_DEBUG_LED_SMDK
 	gpio_request(S3C64XX_GPN(12), "DEBUG_LED0");
 	gpio_request(S3C64XX_GPN(13), "DEBUG_LED1");
-- 
1.7.7.3
