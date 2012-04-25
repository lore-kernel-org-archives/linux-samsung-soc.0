From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 02/33] ARM: EXYNOS: dev-ahci: Use common macro to define resources
Date: Wed, 25 Apr 2012 09:42:12 +0530
Message-ID: <1335327163-11794-3-git-send-email-tushar.behera@linaro.org>
References: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:49498 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753214Ab2DYEV6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Apr 2012 00:21:58 -0400
Received: by mail-pb0-f46.google.com with SMTP id ro12so939266pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 21:21:58 -0700 (PDT)
In-Reply-To: <1335327163-11794-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, patches@linaro.org

CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/dev-ahci.c |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-exynos/dev-ahci.c b/arch/arm/mach-exynos/dev-ahci.c
index 50ce5b0..ce1aad3 100644
--- a/arch/arm/mach-exynos/dev-ahci.c
+++ b/arch/arm/mach-exynos/dev-ahci.c
@@ -236,16 +236,8 @@ static struct ahci_platform_data exynos4_ahci_pdata = {
 };
 
 static struct resource exynos4_ahci_resource[] = {
-	[0] = {
-		.start	= EXYNOS4_PA_SATA,
-		.end	= EXYNOS4_PA_SATA + SZ_64K - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= EXYNOS4_IRQ_SATA,
-		.end	= EXYNOS4_IRQ_SATA,
-		.flags	= IORESOURCE_IRQ,
-	},
+	[0] = DEFINE_RES_MEM(EXYNOS4_PA_SATA, SZ_64K),
+	[1] = DEFINE_RES_IRQ(EXYNOS4_IRQ_SATA),
 };
 
 static u64 exynos4_ahci_dmamask = DMA_BIT_MASK(32);
-- 
1.7.4.1
