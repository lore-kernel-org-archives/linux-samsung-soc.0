From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH] ARM: EXYNOS: Add I2S SFR base addresses
Date: Wed, 25 Jul 2012 17:35:38 +0530
Message-ID: <1343217938-30351-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:61589 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756568Ab2GYMBD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jul 2012 08:01:03 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7P00LGVTDQVMJ0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jul 2012 21:01:02 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M7P00L9ETDJZI60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jul 2012 21:01:01 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: padma.v@samsung.com, rcsekar@samsung.com, sbkim73@samsung.com, sangsu4u.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com, thutt@chromium.org, joshi@samsung.com

The base address of I2S 0 controller is similar in exynos4 and exynos5
platforms. So this patch defines a common macro for the I2S controller
0 base address in both the platforms and use the same macro.

This patch also defines the I2S controller 1,2 base addresses in exynos5
and correct the I2S controller 1 base address in exynos4

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/mach-exynos/dev-audio.c        |    2 +-
 arch/arm/mach-exynos/include/mach/map.h |    6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/dev-audio.c b/arch/arm/mach-exynos/dev-audio.c
index b33a5b6..5dbc9a2 100644
--- a/arch/arm/mach-exynos/dev-audio.c
+++ b/arch/arm/mach-exynos/dev-audio.c
@@ -62,7 +62,7 @@ static struct s3c_audio_pdata i2sv5_pdata = {
 };
 
 static struct resource exynos4_i2s0_resource[] = {
-	[0] = DEFINE_RES_MEM(EXYNOS4_PA_I2S0, SZ_256),
+	[0] = DEFINE_RES_MEM(EXYNOS_PA_I2S0, SZ_256),
 	[1] = DEFINE_RES_DMA(DMACH_I2S0_TX),
 	[2] = DEFINE_RES_DMA(DMACH_I2S0_RX),
 	[3] = DEFINE_RES_DMA(DMACH_I2S0S_TX),
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index c72b675..5cf7d91 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -39,9 +39,11 @@
 
 #define EXYNOS4_PA_G2D			0x12800000
 
-#define EXYNOS4_PA_I2S0			0x03830000
-#define EXYNOS4_PA_I2S1			0xE3100000
+#define EXYNOS_PA_I2S0			0x03830000
+#define EXYNOS4_PA_I2S1			0xE2100000
 #define EXYNOS4_PA_I2S2			0xE2A00000
+#define EXYNOS5_PA_I2S1			0x12D60000
+#define EXYNOS5_PA_I2S2			0x12D70000
 
 #define EXYNOS4_PA_PCM0			0x03840000
 #define EXYNOS4_PA_PCM1			0x13980000
-- 
1.7.4.4
