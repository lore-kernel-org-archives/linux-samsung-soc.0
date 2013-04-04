From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 2/2] ARM: EXYNOS: force mac ip to 32bit dma
Date: Thu,  4 Apr 2013 19:51:44 +0900
Message-ID: <1365072704-4568-2-git-send-email-kgene.kim@samsung.com>
References: <1365072704-4568-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f49.google.com ([209.85.210.49]:64915 "EHLO
	mail-da0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755834Ab3DDKwH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 06:52:07 -0400
Received: by mail-da0-f49.google.com with SMTP id t11so1071919daj.22
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2013 03:52:06 -0700 (PDT)
In-Reply-To: <1365072704-4568-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Girish K S <ks.giri@samsung.com>, Siva Reddy <siva.kallam@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

From: Girish K S <ks.giri@samsung.com>

The synopsys gigabit ethernet ip is compatible
with only 32 bit buffers. so restrict the driver
to use only 32 bit dma mapping.

Signed-off-by: Girish K S <ks.giri@samsung.com>
Signed-off-by: Siva Reddy <siva.kallam@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos5-dt.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index e47c2a5..9596861 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -25,6 +25,7 @@
 #include "common.h"
 
 static u64 dma_mask64 = DMA_BIT_MASK(64);
+static u64 dma_mask32 = DMA_BIT_MASK(32);
 
 static void __init exynos5_dt_map_io(void)
 {
@@ -41,6 +42,10 @@ static int exynos5440_platform_notifier(struct notifier_block *nb,
 
 	dev->dma_mask = &dma_mask64;
 	dev->coherent_dma_mask = DMA_BIT_MASK(64);
+
+	if (of_device_is_compatible(dev->of_node, "snps,dwmac-3.70a"))
+		dev->dma_mask = &dma_mask32;
+
 	return NOTIFY_OK;
 }
 
-- 
1.7.4.4
