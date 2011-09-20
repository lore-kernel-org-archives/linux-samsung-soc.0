From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: EXYNOS4: Add header file protection macros
Date: Tue, 20 Sep 2011 10:16:01 +0530
Message-ID: <1316493961-7650-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:54471 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750836Ab1ITEuG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Sep 2011 00:50:06 -0400
Received: by gyg10 with SMTP id 10so90893gyg.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Sep 2011 21:50:06 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, sachin.kamat@linaro.org

This patch adds header file protection macros to prevent duplication.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-exynos4/include/mach/pm-core.h |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/pm-core.h b/arch/arm/mach-exynos4/include/mach/pm-core.h
index 1df3b81..4c3406b 100644
--- a/arch/arm/mach-exynos4/include/mach/pm-core.h
+++ b/arch/arm/mach-exynos4/include/mach/pm-core.h
@@ -14,6 +14,10 @@
  * it under the terms of the GNU General Public License version 2 as
  * published by the Free Software Foundation.
 */
+
+#ifndef __ASM_ARCH_PM_CORE_H
+#define __ASM_ARCH_PM_CORE_H __FILE__
+
 #include <mach/regs-pmu.h>
 
 static inline void s3c_pm_debug_init_uart(void)
@@ -57,3 +61,5 @@ static inline void s3c_pm_saved_gpios(void)
 {
 	/* nothing here yet */
 }
+
+#endif /* __ASM_ARCH_PM_CORE_H */
-- 
1.7.4.1
