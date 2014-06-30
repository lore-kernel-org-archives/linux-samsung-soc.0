From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH 5/6] ARM: s3c24xx: Kconfig: Fix unmet dependency on S3C2440_PLL_* symbols for S3C2442
Date: Mon, 30 Jun 2014 22:20:08 +0300
Message-ID: <1404156009-3919-5-git-send-email-anarsoul@gmail.com>
References: <1404156009-3919-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:46398 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756945AbaF3TWl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 15:22:41 -0400
Received: by mail-wi0-f180.google.com with SMTP id hi2so6588841wib.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2014 12:22:40 -0700 (PDT)
In-Reply-To: <1404156009-3919-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

It's possible to build kernel with S3C2442, but without S3C2440 support, and
some S3C2442 machines depend on CONFIG_S3C2440_PLL_16934400

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 arch/arm/mach-s3c24xx/Kconfig | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 8c2a7f3..2305a5f 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -437,12 +437,7 @@ config MACH_S3C2416_DT
 
 endif	# CPU_S3C2416
 
-if CPU_S3C2440
-
-config S3C2440_DMA
-	bool
-	help
-	  Support for S3C2440 specific DMA code5A
+if CPU_S3C2440 || CPU_S3C2442
 
 config S3C2440_XTAL_12000000
 	bool
@@ -469,6 +464,14 @@ config S3C2440_PLL_16934400
 	default y if S3C24XX_PLL
 	help
 	  PLL tables for S3C2440 or S3C2442 CPUs with 16.934MHz crystals.
+endif
+
+if CPU_S3C2440
+
+config S3C2440_DMA
+	bool
+	help
+	  Support for S3C2440 specific DMA code5A
 
 comment "S3C2440 Boards"
 
-- 
2.0.0
