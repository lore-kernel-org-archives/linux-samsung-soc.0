From: jhbird.choi@samsung.com
Subject: [PATCH] ARM: EXYNOS4: Add missing S3C_VA_UARTx
Date: Thu, 21 Jul 2011 15:21:37 +0900
Message-ID: <1311229297-4423-1-git-send-email-jhbird.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:35293 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751003Ab1GUG2N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 Jul 2011 02:28:13 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Jonghwan Choi <jhbird.choi@samsung.com>

From: Jonghwan Choi <jhbird.choi@samsung.com>

Fix compile error with CONFIG_SAMSUNG_PM_DEBUG

Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 arch/arm/mach-exynos4/include/mach/map.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exynos4/include/mach/map.h
index 0009e77..5ddbfe3 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -151,6 +151,7 @@
 #define SAMSUNG_PA_KEYPAD		EXYNOS4_PA_KEYPAD
 
 /* UART */
+#define S3C_VA_UARTx(x)			(S3C_VA_UART + ((x) * S3C_UART_OFFSET))
 
 #define S3C_PA_UART			EXYNOS4_PA_UART
 
-- 
1.7.0
