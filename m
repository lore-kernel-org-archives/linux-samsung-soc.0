From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 1/6] ARM: s3c24xx: Remove S3C24XX_DMA dependency from S3C2410_DMA
Date: Mon, 30 Jun 2014 22:20:04 +0300
Message-ID: <1404156009-3919-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:46349 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754543AbaF3TWf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 15:22:35 -0400
Received: by mail-wg0-f45.google.com with SMTP id l18so8508362wgh.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2014 12:22:33 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

S3C24XX_DMA enables legacy DMA driver, and since we want to
move to introduced generic dmaengine s3c24xx-dma driver,
it's necessary to remove this redundant dependency.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c24xx/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 04284de..8c2a7f3 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -133,7 +133,6 @@ config S3C2410_DMA_DEBUG
 
 config S3C2410_DMA
 	bool
-	depends on S3C24XX_DMA && (CPU_S3C2410 || CPU_S3C2442)
 	help
 	  DMA device selection for S3C2410 and compatible CPUs
 
-- 
2.0.0
