From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 1/4] ARM: Exynos: Use CHIP_ID to detect cpu type during
 decompression setup
Date: Tue, 27 Mar 2012 14:56:02 +0530
Message-ID: <1332840365-24827-2-git-send-email-thomas.abraham@linaro.org>
References: <1332840365-24827-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:23449 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755359Ab2C0JWH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Mar 2012 05:22:07 -0400
Received: from epcpsbgm2.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M1J00AOOE0GIMC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 27 Mar 2012 18:22:05 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M1J003DJDYYQZJ0@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 27 Mar 2012 18:22:05 +0900 (KST)
In-reply-to: <1332840365-24827-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

The config option MACH_SMDK5250 is not available for Exynos5 since only
a device tree based machine is supported and selected by MACH_EXYNOS5_DT.
Hence, the detection of the cpu type based on machine_is_smdk5250 always
fails and boot hangs due to incorrect uart base being used. Fix this by
reading the chip id to determine the cpu type and setup the uart_base
accordingly.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-exynos/include/mach/uncompress.h |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/include/mach/uncompress.h b/arch/arm/mach-exynos/include/mach/uncompress.h
index 493f4f3..603ea9b 100644
--- a/arch/arm/mach-exynos/include/mach/uncompress.h
+++ b/arch/arm/mach-exynos/include/mach/uncompress.h
@@ -14,15 +14,19 @@
 
 #include <asm/mach-types.h>
 
+#include <plat/cpu.h>
 #include <mach/map.h>
 
 volatile u8 *uart_base;
 
 #include <plat/uncompress.h>
 
+#define __raw_readl(addr)		\
+	(*((volatile unsigned int __force *)(addr)))
+
 static void arch_detect_cpu(void)
 {
-	if (machine_is_smdk5250())
+	if ((__raw_readl(EXYNOS_PA_CHIPID) & EXYNOS5_SOC_MASK) == EXYNOS5250_SOC_ID)
 		uart_base = (volatile u8 *)EXYNOS5_PA_UART + (S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
 	else
 		uart_base = (volatile u8 *)EXYNOS4_PA_UART + (S3C_UART_OFFSET * CONFIG_S3C_LOWLEVEL_UART_PORT);
-- 
1.6.6.rc2
