From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: S3C64XX: Add header file protection macros in pm-core.h
Date: Tue, 17 Jul 2012 14:43:40 +0530
Message-ID: <1342516420-30188-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:63076 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752203Ab2GQJOJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Jul 2012 05:14:09 -0400
Received: by pbbrp8 with SMTP id rp8so500778pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Jul 2012 02:14:09 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Adds header file protection macros.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s3c64xx/include/mach/pm-core.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c64xx/include/mach/pm-core.h b/arch/arm/mach-s3c64xx/include/mach/pm-core.h
index fcf3dca..c9be9dd 100644
--- a/arch/arm/mach-s3c64xx/include/mach/pm-core.h
+++ b/arch/arm/mach-s3c64xx/include/mach/pm-core.h
@@ -12,6 +12,9 @@
  * published by the Free Software Foundation.
  */
 
+#ifndef __S3C64XX_PM_CORE_H
+#define __S3C64XX_PM_CORE_H __FILE__
+
 #include <mach/regs-gpio.h>
 
 static inline void s3c_pm_debug_init_uart(void)
@@ -113,3 +116,4 @@ static inline void samsung_pm_saved_gpios(void)
 
 	__raw_writel(S3C64XX_SLPEN_USE_xSLP, S3C64XX_SLPEN);
 }
+#endif /* __S3C64XX_PM_CORE_H */
-- 
1.7.4.1
