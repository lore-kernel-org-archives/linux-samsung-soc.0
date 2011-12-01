From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 1/3] ARM: EXYNOS: Increase DMA pool allocator size for framebuffer
Date: Thu,  1 Dec 2011 11:20:09 +0530
Message-ID: <1322718611-20934-2-git-send-email-tushar.behera@linaro.org>
References: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:49051 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751095Ab1LAFwU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 00:52:20 -0500
Received: by iage36 with SMTP id e36so1948005iag.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Nov 2011 21:52:19 -0800 (PST)
In-Reply-To: <1322718611-20934-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org

Some of the boards under mach-exynos initialize frame-buffers
for which the memory requirement is more than 2MB, hence the
default dma pool allocation size of 2MB is not sufficient.

The consistent dma size is hence increased to successfully
allocate memory for those boards.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/cpu.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/cpu.c b/arch/arm/mach-exynos/cpu.c
index 8e09f34..d02ed16 100644
--- a/arch/arm/mach-exynos/cpu.c
+++ b/arch/arm/mach-exynos/cpu.c
@@ -12,6 +12,7 @@
 #include <linux/sysdev.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/dma-mapping.h>
 
 #include <asm/mach/map.h>
 #include <asm/mach/irq.h>
@@ -188,6 +189,12 @@ void __init exynos4_map_io(void)
 	iotable_init(exynos_iodesc, ARRAY_SIZE(exynos_iodesc));
 	iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc));
 
+	/*
+	 * Default allocation size for ARM = 2MB
+	 * Memory required for FB = (~ 2.4 MB) 4MB
+	 */
+	init_consistent_dma_size(SZ_2M + SZ_4M);
+
 	if (soc_is_exynos4210() && samsung_rev() == EXYNOS4210_REV_0)
 		iotable_init(exynos4_iodesc0, ARRAY_SIZE(exynos4_iodesc0));
 	else
-- 
1.7.4.1
