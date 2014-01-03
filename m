From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/3] ARM: S3C24XX: Remove invalid code from hardware.h
Date: Fri,  3 Jan 2014 14:54:37 +0530
Message-ID: <1388741079-16202-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:53716 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750841AbaACJ2Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jan 2014 04:28:25 -0500
Received: by mail-pa0-f43.google.com with SMTP id bj1so15595773pad.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Jan 2014 01:28:24 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Remove the code that is not referenced anywhere. While at it also
remove incorrect file path.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s3c24xx/include/mach/hardware.h |   14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/include/mach/hardware.h b/arch/arm/mach-s3c24xx/include/mach/hardware.h
index a6cc14a092fc..dedd3837c193 100644
--- a/arch/arm/mach-s3c24xx/include/mach/hardware.h
+++ b/arch/arm/mach-s3c24xx/include/mach/hardware.h
@@ -1,5 +1,4 @@
-/* arch/arm/mach-s3c2410/include/mach/hardware.h
- *
+/*
  * Copyright (c) 2003 Simtec Electronics
  *	Ben Dooks <ben@simtec.co.uk>
  *
@@ -17,20 +16,9 @@
 
 extern unsigned int s3c2410_modify_misccr(unsigned int clr, unsigned int chg);
 
-#ifdef CONFIG_CPU_S3C2440
-
-extern int s3c2440_set_dsc(unsigned int pin, unsigned int value);
-
-#endif /* CONFIG_CPU_S3C2440 */
-
 #endif /* __ASSEMBLY__ */
 
 #include <asm/sizes.h>
 #include <mach/map.h>
 
-/* machine specific hardware definitions should go after this */
-
-/* currently here until moved into config (todo) */
-#define CONFIG_NO_MULTIWORD_IO
-
 #endif /* __ASM_ARCH_HARDWARE_H */
-- 
1.7.9.5
