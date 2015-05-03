From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 1/3] ARM: s3c24xx: add dma_coherent_mask for DMA devices
Date: Sun,  3 May 2015 21:15:08 +0300
Message-ID: <1430676910-30657-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:33331 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751283AbbECSPV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 3 May 2015 14:15:21 -0400
Received: by lbbzk7 with SMTP id zk7so92236846lbb.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 May 2015 11:15:19 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Otherwise dma_alloc_coherent() fails.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c24xx/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
index bf50328..7ed0853 100644
--- a/arch/arm/mach-s3c24xx/common.c
+++ b/arch/arm/mach-s3c24xx/common.c
@@ -355,6 +355,7 @@ struct platform_device s3c2410_device_dma = {
 	.resource	= s3c2410_dma_resource,
 	.dev	= {
 		.platform_data	= &s3c2410_dma_platdata,
+		.coherent_dma_mask = ~0,
 	},
 };
 #endif
@@ -452,6 +453,7 @@ struct platform_device s3c2440_device_dma = {
 	.resource	= s3c2410_dma_resource,
 	.dev	= {
 		.platform_data	= &s3c2440_dma_platdata,
+		.coherent_dma_mask = ~0,
 	},
 };
 #endif
-- 
2.3.5
