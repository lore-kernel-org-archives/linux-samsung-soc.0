From: Sachin Kamat <sachin.kamat@samsung.com>
Subject: [PATCH 1/1] ARM: EXYNOS: Remove unused code in common.h
Date: Mon, 23 Jun 2014 17:30:14 +0530
Message-ID: <1403524814-14735-1-git-send-email-sachin.kamat@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f45.google.com ([209.85.160.45]:45652 "EHLO
	mail-pb0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750820AbaFWMD3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 08:03:29 -0400
Received: by mail-pb0-f45.google.com with SMTP id rr13so5782397pbb.18
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 05:03:29 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com

PINCTRL_EXYNOS is always selected by Exynos platform in its
machine Kconfig. Thus the code in the else part is never used.
Remove it.

Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
---
 arch/arm/mach-exynos/common.h |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/mach-exynos/common.h b/arch/arm/mach-exynos/common.h
index 1ee91763fa7c..3371669dabc6 100644
--- a/arch/arm/mach-exynos/common.h
+++ b/arch/arm/mach-exynos/common.h
@@ -125,11 +125,7 @@ void exynos_init_late(void);
 
 void exynos_firmware_init(void);
 
-#ifdef CONFIG_PINCTRL_EXYNOS
 extern u32 exynos_get_eint_wake_mask(void);
-#else
-static inline u32 exynos_get_eint_wake_mask(void) { return 0xffffffff; }
-#endif
 
 #ifdef CONFIG_PM_SLEEP
 extern void __init exynos_pm_init(void);
-- 
1.7.9.5
