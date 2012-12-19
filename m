From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 4/5] ARM: S5PV210: Avoid passing the clks through platform data
Date: Wed, 19 Dec 2012 11:05:52 +0530
Message-ID: <1355895353-10316-5-git-send-email-padma.v@samsung.com>
References: <1355895353-10316-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:32087 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750962Ab2LSFfM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Dec 2012 00:35:12 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MF900L5WJIF5EG0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Dec 2012 14:35:11 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MF900KQQJI8CS20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Dec 2012 14:35:11 +0900 (KST)
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
 arch/arm/mach-s5pv210/dev-audio.c |   16 ----------------
 1 files changed, 0 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-s5pv210/dev-audio.c b/arch/arm/mach-s5pv210/dev-audio.c
index 0a5480b..addfb16 100644
--- a/arch/arm/mach-s5pv210/dev-audio.c
+++ b/arch/arm/mach-s5pv210/dev-audio.c
@@ -20,11 +20,6 @@
 #include <mach/irqs.h>
 #include <mach/regs-audss.h>
 
-static const char *rclksrc[] = {
-	[0] = "busclk",
-	[1] = "i2sclk",
-};
-
 static int s5pv210_cfg_i2s(struct platform_device *pdev)
 {
 	/* configure GPIO for i2s port */
@@ -52,7 +47,6 @@ static struct s3c_audio_pdata i2sv5_pdata = {
 		.i2s = {
 			.quirks = QUIRK_PRI_6CHAN | QUIRK_SEC_DAI
 					 | QUIRK_NEED_RSTCLR,
-			.src_clk = rclksrc,
 			.idma_addr = S5PV210_AUDSS_INT_MEM,
 		},
 	},
@@ -75,18 +69,8 @@ struct platform_device s5pv210_device_iis0 = {
 	},
 };
 
-static const char *rclksrc_v3[] = {
-	[0] = "iis",
-	[1] = "audio-bus",
-};
-
 static struct s3c_audio_pdata i2sv3_pdata = {
 	.cfg_gpio = s5pv210_cfg_i2s,
-	.type = {
-		.i2s = {
-			.src_clk = rclksrc_v3,
-		},
-	},
 };
 
 static struct resource s5pv210_iis1_resource[] = {
-- 
1.7.4.4
