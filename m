From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2] ARM: EXYNOS5: Add I2S SFR base addresses
Date: Thu, 27 Sep 2012 15:52:33 +0530
Message-ID: <1348741353-29297-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51676 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753519Ab2I0KRu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Sep 2012 06:17:50 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MB000I0S79MQPG0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Sep 2012 19:17:49 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MB00072Y79G0P60@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Sep 2012 19:17:48 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: padma.v@samsung.com, sbkim73@samsung.com, sangsu4u.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com

This patch adds I2S controller0,1,2 base addresses

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/mach-exynos/include/mach/map.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 5aa77f9..792c0bd 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -42,6 +42,9 @@
 #define EXYNOS4_PA_I2S0			0x03830000
 #define EXYNOS4_PA_I2S1			0xE3100000
 #define EXYNOS4_PA_I2S2			0xE2A00000
+#define EXYNOS5_PA_I2S0			0x03830000
+#define EXYNOS5_PA_I2S1			0x12D60000
+#define EXYNOS5_PA_I2S2			0x12D70000
 
 #define EXYNOS4_PA_PCM0			0x03840000
 #define EXYNOS4_PA_PCM1			0x13980000
-- 
1.7.4.4
