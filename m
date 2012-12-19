From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 5/5] ARM: EXYNOS: Avoid passing the clks through platform data
Date: Wed, 19 Dec 2012 11:05:53 +0530
Message-ID: <1355895353-10316-6-git-send-email-padma.v@samsung.com>
References: <1355895353-10316-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32100 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922Ab2LSFfO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Dec 2012 00:35:14 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MF900L5WJIF5EG0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Dec 2012 14:35:13 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MF900KQQJI8CS20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Dec 2012 14:35:12 +0900 (KST)
In-reply-to: <1355895353-10316-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, olof@lixom.net, jhbird.choi@samsung.com

I2S controller has an internal mux for RCLK source clks. The list
of source clk names were passed through platform data in non-dt case.
The variable holding the list of RCLK source clk names is not
required, as the list of clks need to be registered with clkdev
using generic connection id. This is required as part of adding DT
support for I2S controller driver.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Acked-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-exynos/dev-audio.c |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-exynos/dev-audio.c b/arch/arm/mach-exynos/dev-audio.c
index a1cb42c..9d1a609 100644
--- a/arch/arm/mach-exynos/dev-audio.c
+++ b/arch/arm/mach-exynos/dev-audio.c
@@ -23,11 +23,6 @@
 #include <mach/irqs.h>
 #include <mach/regs-audss.h>
 
-static const char *rclksrc[] = {
-	[0] = "busclk",
-	[1] = "i2sclk",
-};
-
 static int exynos4_cfg_i2s(struct platform_device *pdev)
 {
 	/* configure GPIO for i2s port */
@@ -55,7 +50,6 @@ static struct s3c_audio_pdata i2sv5_pdata = {
 		.i2s = {
 			.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI
 					 | QUIRK_NEED_RSTCLR,
-			.src_clk = rclksrc,
 			.idma_addr = EXYNOS4_AUDSS_INT_MEM,
 		},
 	},
@@ -78,17 +72,11 @@ struct platform_device exynos4_device_i2s0 = {
 	},
 };
 
-static const char *rclksrc_v3[] = {
-	[0] = "sclk_i2s",
-	[1] = "no_such_clock",
-};
-
 static struct s3c_audio_pdata i2sv3_pdata = {
 	.cfg_gpio = exynos4_cfg_i2s,
 	.type = {
 		.i2s = {
 			.quirks = QUIRK_NO_MUXPSR,
-			.src_clk = rclksrc_v3,
 		},
 	},
 };
-- 
1.7.4.4
