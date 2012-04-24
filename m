From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S3C24XX: Fix build warning for S3C2410_PM
Date: Tue, 24 Apr 2012 16:44:20 -0700
Message-ID: <1335311060-21227-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f51.google.com ([209.85.210.51]:59846 "EHLO
	mail-pz0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754547Ab2DXXwk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Apr 2012 19:52:40 -0400
Received: by dadz8 with SMTP id z8so1551540dad.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 16:52:40 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>

warning: (CPU_S3C2440 && CPU_S3C2442) selects S3C2410_PM which has unmet direct dependencies (ARCH_S3C24XX && CPU_S3C2410)
warning: (CPU_S3C2440 && CPU_S3C2442) selects S3C2410_PM which has unmet direct dependencies (ARCH_S3C24XX && CPU_S3C2410)

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s3c24xx/Kconfig |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 0f3a327..b34287a 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -111,10 +111,6 @@ config S3C24XX_SETUP_TS
 	help
 	  Compile in platform device definition for Samsung TouchScreen.
 
-# cpu-specific sections
-
-if CPU_S3C2410
-
 config S3C2410_DMA
 	bool
 	depends on S3C24XX_DMA && (CPU_S3C2410 || CPU_S3C2442)
@@ -127,6 +123,10 @@ config S3C2410_PM
 	help
 	  Power Management code common to S3C2410 and better
 
+# cpu-specific sections
+
+if CPU_S3C2410
+
 config S3C24XX_SIMTEC_NOR
 	bool
 	help
-- 
1.7.2.3
