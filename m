From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: EXYNOS4: Debug wrong S/PDIF register address
Date: Tue,  8 Mar 2011 12:48:45 +0900
Message-ID: <1299556125-19440-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:47960 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755942Ab1CHETX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Mar 2011 23:19:23 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Seungwhan Youn <sw.youn@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Seungwhan Youn <sw.youn@samsung.com>

This patche fixes wrong S/PDIF SFR base address.

Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/map.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index 80a41e0..4d7f0ce 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -95,12 +95,12 @@
 
 #define EXYNOS4_PA_AC97			0x139A0000
 
+#define EXYNOS4_PA_SPDIF		0x139B0000
+
 #define EXYNOS4_PA_TIMER		0x139D0000
 
 #define EXYNOS4_PA_SDRAM		0x40000000
 
-#define EXYNOS4_PA_SPDIF		0xE1100000
-
 /* Compatibiltiy Defines */
 
 #define S3C_PA_HSMMC0			EXYNOS4_PA_HSMMC(0)
-- 
1.7.1
