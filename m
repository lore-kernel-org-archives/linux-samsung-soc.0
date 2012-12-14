From: Jonghwan Choi <jhbird.choi@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Fix compile error in dev-audio.c
Date: Fri, 14 Dec 2012 17:15:52 +0900
Message-ID: <000701cdd9d3$3b6a6e10$b23f4a30$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:50503 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750986Ab2LNIPy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Dec 2012 03:15:54 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MF00036BHLXI2S0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Dec 2012 17:15:52 +0900 (KST)
Received: from DOJHBIRDCHO03 ([12.23.118.55])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MF0004TLHMGO4O0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Dec 2012 17:15:52 +0900 (KST)
References: 
In-reply-to: 
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jonghwan Choi' <jhbird.choi@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Russell King' <linux@arm.linux.org.uk>

arch/arm/mach-exynos/dev-audio.c:58:4: error: unknown field 'src_clk'
specified in initializer
arch/arm/mach-exynos/dev-audio.c:58:4: warning: initialization makes integer
from pointer without a cast [enabled by default]
arch/arm/mach-exynos/dev-audio.c:58:4: warning: (near initialization for
'i2sv5_pdata.type.i2s.idma_addr') [enabled by default]
arch/arm/mach-exynos/dev-audio.c:91:4: error: unknown field 'src_clk'
specified in initializer
arch/arm/mach-exynos/dev-audio.c:91:4: warning: initialization makes integer
from pointer without a cast [enabled by default]
arch/arm/mach-exynos/dev-audio.c:91:4: warning: (near initialization for
'i2sv3_pdata.type.i2s.idma_addr') [enabled by default]

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 arch/arm/mach-exynos/dev-audio.c |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-exynos/dev-audio.c
b/arch/arm/mach-exynos/dev-audio.c
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
1.7.4.1
