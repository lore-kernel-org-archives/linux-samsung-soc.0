From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 2/6] ARM: s3c24xx: add dma_coherent_mask for DMA devices
Date: Mon, 30 Jun 2014 22:20:05 +0300
Message-ID: <1404156009-3919-2-git-send-email-anarsoul@gmail.com>
References: <1404156009-3919-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:64812 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754543AbaF3TWg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 15:22:36 -0400
Received: by mail-wi0-f175.google.com with SMTP id r20so6644373wiv.14
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2014 12:22:35 -0700 (PDT)
In-Reply-To: <1404156009-3919-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Otherwise dma_alloc_coherent() fails.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c24xx/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-s3c24xx/common.c b/arch/arm/mach-s3c24xx/common.c
index c0763b8..2fa0a99 100644
--- a/arch/arm/mach-s3c24xx/common.c
+++ b/arch/arm/mach-s3c24xx/common.c
@@ -358,6 +358,7 @@ struct platform_device s3c2410_device_dma = {
 	.resource	= s3c2410_dma_resource,
 	.dev	= {
 		.platform_data	= &s3c2410_dma_platdata,
+		.coherent_dma_mask = ~0,
 	},
 };
 #endif
@@ -455,6 +456,7 @@ struct platform_device s3c2440_device_dma = {
 	.resource	= s3c2410_dma_resource,
 	.dev	= {
 		.platform_data	= &s3c2440_dma_platdata,
+		.coherent_dma_mask = ~0,
 	},
 };
 #endif
-- 
2.0.0
