From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3] ARM: EXYNOS5: Add I2S SFR base addresse
Date: Tue, 06 Nov 2012 10:06:45 +0530
Message-ID: <1352176605-16153-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46974 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751362Ab2KFEeO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 23:34:14 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD100FMETYKW7N0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 13:34:13 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MD100ETCTZBBP90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 13:34:12 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: padma.v@samsung.com, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com

This patch adds I2S controller0,1,2 base addresses

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---

Changes since V2:
	- Rebased on 3.7-rc3

Changes since V1:
	- Rebased on 3.6-rc6
	- Reverted Exynos4 I2S1,2 address changes that are added in V1
	  as Exynos4 based boards have different I2S base addresses.

 arch/arm/mach-exynos/include/mach/map.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index ef4958b..4192d23 100644
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
