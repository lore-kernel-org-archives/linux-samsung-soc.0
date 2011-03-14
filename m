From: Jeongtae Park <jtp.park@samsung.com>
Subject: [PATCH v3 2/3] ARM: EXYNOS4: Add memory map support for MFC v5.1
Date: Mon, 14 Mar 2011 17:04:01 +0900
Message-ID: <1300089842-13140-2-git-send-email-jtp.park@samsung.com>
References: <1300089842-13140-1-git-send-email-jtp.park@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45558 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752286Ab1CNIfo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2011 04:35:44 -0400
In-Reply-To: <1300089842-13140-1-git-send-email-jtp.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, Jeongtae Park <jtp.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kamil Debski <k.debski@samsung.com>

This patch adds memroy map support for MFC v5.1.

Reviewed-by: Peter Oh <jaeryul.oh@samsung.com>
Signed-off-by: Jeongtae Park <jtp.park@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/map.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index 80a41e0..52e7856 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -89,6 +89,8 @@
 
 #define EXYNOS4_PA_SROMC		0x12570000
 
+#define EXYNOS4_PA_MFC			0x13400000
+
 #define EXYNOS4_PA_UART			0x13800000
 
 #define EXYNOS4_PA_IIC(x)		(0x13860000 + ((x) * 0x10000))
@@ -125,6 +127,7 @@
 #define S5P_PA_ONENAND_DMA		EXYNOS4_PA_ONENAND_DMA
 #define S5P_PA_SDRAM			EXYNOS4_PA_SDRAM
 #define S5P_PA_SROMC			EXYNOS4_PA_SROMC
+#define S5P_PA_MFC			EXYNOS4_PA_MFC
 #define S5P_PA_SYSCON			EXYNOS4_PA_SYSCON
 #define S5P_PA_TIMER			EXYNOS4_PA_TIMER
 
-- 
1.7.1
